## Step 1: Boot into the Live ISO

Open a terminal in the NixOS Live environment.

## Step 2: Disk Partitioning (EMPTY_DISK - sys+boot; HOME_DISK - home)

Use only EMPTY_DISK for laptop Installation

```sh
export EMPTY_DISK=/dev/sdX 
export HOME_DISK=/dev/sdY
```

## Step 3: Clone flake from GitHub

```sh
nix-shell -p git
git clone https://github.com/Sergeok/nix.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

## Step 4: Generate Hardware Configuration

```sh
nixos-generate-config --root /mnt
cp hardware-configuration.nix hardware-modules/hardware-sergeok.nix
git add .
```

## Step 5: Install the System using the flake with -pc or -laptop

```sh
nixos-install --flake .#sergeok-laptop
```

## Step 6: Reboot
```sh
reboot
```

## Step 7: Set up user using the home-manager

```sh
login sergeok
cd /etc/nixos
sudo chown -R sergeok .
nix run github:nix-community/home-manager -- switch --flake .#sergeok
```
