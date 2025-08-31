
{ ... }: {
  # Common Nix settings
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Common user settings
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPNPRzSLlLpDQwA9QpurZnREyON6z9wHiNJ9tZexFmgh alex@Alexs-MacBook-Pro.local" ];

  # Common security settings
  security.sudo.wheelNeedsPassword = false;

  # Common system settings
  system.stateVersion = "25.05";
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
  }];

  # Common network settings
  networking.domain = "contaboserver.net";
  services.openssh.enable = true;

  # Common boot settings
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "xen_blkfront"
    "vmw_pvscsi"
    "virtio_pci"
    "virtio_scsi"
  ];
  boot.initrd.kernelModules = [ "nvme" "dm-snapshot" ];
  boot.kernelParams = [ "boot.shell_on_fail" ];


# define alex user
 # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."alex" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  users.users.alex.openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPNPRzSLlLpDQwA9QpurZnREyON6z9wHiNJ9tZexFmgh alex@Alexs-MacBook-Pro.local'' ];

}
