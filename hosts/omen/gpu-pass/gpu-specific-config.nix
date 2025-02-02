# https://astrid.tech/2022/09/22/0/nixos-gpu-vfio/
let
  # RTX 3060 Laptop
  # IOMMU Group 2:
  #         00:01.0 PCI bridge [0604]: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 02)
  #         01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M [GeForce RTX 3060 Mobile / Max-Q] [10de:2520] (rev a1)
  #         01:00.1 Audio device [0403]: NVIDIA Corporation GA106 High Definition Audio Controller [10de:228e] (rev a1)

  gpuIDs = [
    "8086:1901" # Intel
    "10de:2520" # Graphics
    "10de:228e" # Audio
  ];
in
{ lib, ... }:
{
  specialisation."GPUPass".configuration = {
    system.nixos.tags = [
      "Nvidia-VFIO"
    ];

    # The vfio modules before the nvidia modules is very intentional because it lets vfio claim my GPU before nvidia does.
    boot.initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];
    boot.kernelParams = [
      ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs) # vfio devices
      ("vfio-pci.disable_idle_d3=1")
      ("vfio-pci.disable_vga=1")
    ];
  };
}
