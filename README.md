## disko install

```sh
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix

sudo nixos-install --no-root-password --flake .#your-hostname
```

## rebuild system

```sh
nix flake update

sudo nixos-rebuild switch --flake .#your-hostname

home-manager --flake .#your-username@your-hostname
```