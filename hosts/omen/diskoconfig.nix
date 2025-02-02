{
  disko.devices = {
    disk = {
      nixos = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  # Subvolume name is different from mountpoint
                  # "/rootfs" = {
                  #   mountpoint = "/";
                  # };
                  # Subvolume name is the same as the mountpoint
                  "/home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  # Parent is not mounted so the mountpoint must be set
                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };
                  # Subvolume for the swapfile
                  "/swap" = {
                    mountpoint = "/.swapvol";
                    swap = {
                      swapfile.size = "4096M";
                      # swapfile2.size = "2048M";
                    };
                  };
                };

                mountpoint = "/";
                # swap = {
                #   swapfile = {
                #     size = "1024M";
                #   };
                #   swapfile2 = {
                #     size = "2048M";
                #   };
                # };
              };
            };
          };
        };
      };
    };
  };
}
