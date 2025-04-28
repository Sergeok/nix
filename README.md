## Step 1: Boot into the Live ISO

Open a terminal in the NixOS Live environment.

## Step 2: Disk Partitioning and Formatting

Use `cfdisk /dev/sdX` to create:

- An EFI partition (512MB, type EF00)
- A root partition (remaining space) (label gpt)
- A home partition (label gpt)

Format the partitions:

```sh
lsblk
mkfs.fat -F32 /dev/sdX1       # EFI partition
mkfs.ext4 /dev/sdX2           # Root partition
mkfs.ext4 /dev/sdX3           # Home partition
```

Mount them:

```sh
mount /dev/sdX2 /mnt
mkdir -p /mnt/boot
mount /dev/sdX1 /mnt/boot
mount /dev/sdX3 /mnt/home
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
cd /etc/nixos
sudo chown -R sergeok .
nix run github:nix-community/home-manager -- switch --flake .#sergeok
```
