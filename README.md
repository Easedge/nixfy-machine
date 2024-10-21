## disko install

```sh
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix

sudo nixos-install --flake .#your-hostname
```

## rebuild system

```sh
sudo nixos-rebuild --flake .#your-hostname

home-manager --flake .#your-username@your-hostname
```