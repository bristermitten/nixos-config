# NOTE: We expect this file to be supplanted by the original /etc/nixos/configuration.nix
{ ... }: {
  # These are normally in hardware-configuration.nix
  # imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "xen_blkfront"
    "vmw_pvscsi"
    "virtio_pci" # disk
    "virtio_scsi" # disk
  ];
  boot.initrd.kernelModules = [ "nvme" "dm-snapshot" ];
  boot.kernelParams = [ "boot.shell_on_fail" ];
  fileSystems."/" = { device = "/dev/sda3"; fsType = "ext4"; };

  nixpkgs.hostPlatform = "x86_64-linux";

  # nix storage
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."alex" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  users.users.alex.openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPNPRzSLlLpDQwA9QpurZnREyON6z9wHiNJ9tZexFmgh alex@Alexs-MacBook-Pro.local'' ];


  security.sudo.wheelNeedsPassword = false;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
  }];

  networking.hostName = "vmi2319146";
  networking.domain = "contaboserver.net";

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPNPRzSLlLpDQwA9QpurZnREyON6z9wHiNJ9tZexFmgh alex@Alexs-MacBook-Pro.local'' ];
}
