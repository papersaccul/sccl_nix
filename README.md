# sccl_nix

My NixOS config using flakes, home manager, disko.

![desktop_img](img/Niri.png)

## What's Inside

**Window Managers:**
- **Niri** (main)
- **Hyprland** 

**Global Software:**
- **System:** vim, git, htop, fastfetch, lazygit
- **Network:** firefox, ayugram, webcord
- **Dev:** nixd, rustc, cargo, gcc, gh, lmstudio
- **Gaming:** steam, bottles, obs-studio, protonplus
- **Creative:** kdenlive, krita, aseprite, blender, audacity
- **Office:** libreoffice

**User Software (shared):**
- **CLI:** neofetch, ripgrep, fd, fzf, zoxide, bat, eza, btop
- **GUI:** thunar, vlc, mpv, evince, zathura
- **Utils:** grim, slurp, wl-clipboard, pavucontrol
- **Terminal:** alacritty with fish & starship prompt
- **Launcher:** fuzzel (niri), rofi (hyprland)
- **Bar:** waybar
- **Themes:** Nordic, Papirus icons, Rose Pine cursor

**Keyboard Layout:**
- Colemak-CAWS / Rulemak-CAWS (custom layouts)
- Switch w/ Right Win key

## Table of Contents

- [Config Structure](#config-structure)
- [Adding New Users](#adding-new-users)
- [Adding New Hosts](#adding-new-hosts)
- [Common Tasks](#common-tasks)
- [Installation](#installation)

---

## Config Structure

```diff
sccl_nix
 ├── flake.nix                # Main flake conf (auto-discovers hosts)
 ├── flake.lock               # Dependencies
 ├── profiles/
 │   ├── shared/             # Shared conf for all users
 │   │   ├── packages.nix    # Base packages w/ categories
 │   │   └── modules/        # Base program configs
 │   └── paper/              # User-specific conf
 │       ├── user.nix        # System user settings
 │       ├── home.nix        # Home Manager conf
 │       ├── packages.nix    # Extra user packages
 │       └── modules/        # Config overrides
 ├── hosts/
 │   └── sacculos/           # Host-specific conf
 └── nixos/
     └── modules/            # Reusable NixOS modules
```

**What's cool:**
- Just drop a new host dir in `hosts/` and it's auto-detected, no need to edit flake.nix
- Shared base conf + per-user customization
- Packages organized w/ categories & comments
- Ez to scale

---

## Adding New Users

### 1. Create user dir

```bash
mkdir -p profiles/<username>/modules
```

### 2. Create files

U can copy from existing user and edit:
```bash
cp -r profiles/paper profiles/<username>
```

Or create manually:

**`profiles/<username>/user.nix`** - system user settings:
```nix
{ config, pkgs, ... }:

{
  users.users.<username> = {
    isNormalUser = true;
    description = "Your Name";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.fish;
    initialPassword = "changeme";
  };
}
```

**`profiles/<username>/home.nix`** - home manager conf:
```nix
{ config, pkgs, inputs, ... }:

{
  imports = [
    ../shared/packages.nix    # Base packages
    ../shared/modules         # Base configs
    ./packages.nix            # Ur extra packages
    ./modules                 # Ur config overrides
  ];

  home = {
    username = "<username>";
    homeDirectory = "/home/<username>";
    stateVersion = "25.11";
  };

  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    hyprland.enable = false;
  };

  programs.home-manager.enable = true;
}
```

**`profiles/<username>/packages.nix`** - ur extra packages:
```nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development Tools
    vscode

    # Extra Apps
    # add ur stuff here
  ];
}
```

**`profiles/<username>/modules/default.nix`** - config overrides:
```nix
{ config, pkgs, ... }:

{
  imports = [
    # Add overrides here if needed
    # ./git.nix  # Override git config
  ];
}
```

### 3. Add user to host

Edit `hosts/<hostname>/configuration.nix`:
```nix
{
  imports = [
    # ... other imports
    ../../profiles/<username>/user.nix
  ];

  home-manager.users.<username> = import ../../profiles/<username>/home.nix;
}
```

### 4. Rebuild

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

### Overriding shared configs

If u wanna change smth from shared conf (like git email), create override:

**`profiles/<username>/modules/git.nix`:**
```nix
{ config, pkgs, ... }:

{
  programs.git = {
    userEmail = "your@email.com";  # Override
  };
}
```

Import it in `profiles/<username>/modules/default.nix`:
```nix
{
  imports = [
    ./git.nix
  ];
}
```

---

## Adding New Hosts

### 1. Create host dir

```bash
mkdir -p hosts/<hostname>
```

### 2. Copy from existing host

```bash
cp -r hosts/sacculos hosts/<hostname>
```

### 3. Edit hostname

In `hosts/<hostname>/configuration.nix`:
```diff
- networking.hostName = "sacculos";
+ networking.hostName = "<hostname>";
```

### 4. Edit disk conf

In `hosts/<hostname>/disko.nix`, change disk path:
```diff
{
  disko.devices = {
    disk.nvme0n1 = {
-       device = "/dev/nvme0n1";
+       device = "/dev/sda";  # ur disk, check w/ `lsblk`
```

### 5. Generate hardware conf

```bash
nixos-generate-config --root /mnt --show-hardware-config --no-filesystems > hosts/<hostname>/hardware-configuration.nix
```

### 6. Build & test

```bash
nixos-rebuild build --flake .#<hostname>
```

That's it! Flake auto-discovers the new host.

---

## Common Tasks

### Adding packages

**For all users:**
- Edit `profiles/shared/packages.nix`
- Add package under category comment

**For specific user:**
- Edit `profiles/<username>/packages.nix`

**W/ custom config:**
- Create `profiles/shared/modules/<program>.nix`
- Import in `profiles/shared/modules/default.nix`

### Updating system

```bash
# Update deps
nix flake update

# Rebuild
sudo nixos-rebuild switch --flake .#<hostname>
```

### Testing changes

```bash
# Check syntax
nix flake check

# Build w/o switching
nixos-rebuild build --flake .#<hostname>

# Test in VM
nixos-rebuild build-vm --flake .#<hostname>
./result/bin/run-<hostname>-vm

# Dry run
nixos-rebuild dry-run --flake .#<hostname>
```

### Rollback

```bash
# List generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback to prev
sudo nixos-rebuild switch --rollback

# Switch to specific gen
sudo nix-env --switch-generation <number> --profile /nix/var/nix/profiles/system
sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
```

### Cleanup

```bash
# Remove old gens (older than 7d)
sudo nix-collect-garbage --delete-older-than 7d

# Optimize store
nix-store --optimize
```

---

## Installation

### Fresh NixOS Installation

#### 1. Boot into NixOS installer

Idk u can use a minimal iso or another distro.

#### 2. Clone repo

```bash
git clone https://github.com/papersaccul/sccl_nix.git /mnt/etc/nixos
cd /mnt/etc/nixos
```

#### 3. Create host

Create ur own host in `./hosts/*`

it should look something like this:
```
hosts
└── sacculos
    ├── configuration.nix           # imports and other shi
    ├── disko.nix                   # disk conf
    ├── hardware-configuration.nix  # generated file
    └── local-packages.nix          # programs
```

U can copy my conf:
```bash
cp -r /mnt/etc/nixos/hosts/sacculos /mnt/etc/nixos/hosts/<YOUR_HOSTNAME>
```

Edit `configuration.nix`:
```diff
...
- networking.hostName = "sacculos";
+ networking.hostName = "<YOUR_HOSTNAME>";
...
```

Edit `disko.nix`, set up partitions as u like:
```diff
{
  disko.devices = {
    disk.nvme0n1 = {              # Disc label (any)
        device = "/dev/nvme0n1";  # Path of main disk, check w/ lsblk
...
```

generate `hardware-configuration.nix`:
```bash
nixos-generate-config --root /mnt --show-hardware-config --no-filesystems > hosts/<YOUR_HOSTNAME>/hardware-configuration.nix
```

#### 4. Install NixOS

```bash
# Install w/ my host
nixos-install --flake .#sacculos

# Install w/ ur own
nixos-install --flake .#<YOUR_HOSTNAME>
```

#### 5. Set root password when prompted

#### 6. Reboot

```bash
umount -r /dev/nvme0n1
# umount -r /dev/sda1

reboot
```

### Migrating Existing NixOS System

#### 1. Backup ur current conf

```bash
sudo cp -r /etc/nixos /etc/nixos.backup
```

#### 2. Clone repo

```bash
cd /tmp
git clone https://github.com/papersaccul/sccl_nix
cd sccl_nix
```

#### 3. Copy ur hardware conf

Or create ur own following step 3 above:
```bash
sudo cp /etc/nixos/hardware-configuration.nix hosts/sacculos/
```

#### 4. Review and merge ur customizations

#### 5. Test the conf

```bash
sudo nixos-rebuild test --flake .#sacculos
# sudo nixos-rebuild test --flake .#<YOUR_HOSTNAME>
```

#### 6. If everything works, switch

```bash
sudo nixos-rebuild switch --flake .#sacculos
# sudo nixos-rebuild switch --flake .#<YOUR_HOSTNAME>
```

---

## License

This configuration is provided as-is for personal use. Modify as needed for ur own systems.
