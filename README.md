## Step 1: Boot into the Live ISO

Open a terminal in the NixOS Live environment.

## Step 2: Disk Partitioning and Formatting

Use `cfdisk` or `parted` to create:

- An EFI partition (512MB, type EF00)
- A root partition (remaining space)

Format the partitions:

```sh
mkfs.fat -F32 /dev/sdX1       # EFI partition
mkfs.ext4 /dev/sdX2           # Root partition
```

Mount them:

```sh
mount /dev/sdX2 /mnt
mkdir -p /mnt/boot
mount /dev/sdX1 /mnt/boot
```

## Step 3: Clone flake from GitHub

```sh
nix-shell -p git
nix run nixpkgs#git -- clone https://github.com/your/repo.git
git clone https://github.com/Sergeok/nix.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

## Step 4: Generate Hardware Configuration

```sh
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/system-modules/hardware-laptop.nix
```

## Step 5: Install the System using the flake

```sh
nixos-install --flake .#sergeok
```

## Step 6: Reboot
```sh
reboot
```

## Step 7: Set up user using the home-manager

```sh
login sergeok
nix run github:nix-community/home-manager -- switch --flake /etc/nixos#sergeok
```
