
# NOTE: We expect this file to be supplanted by the original /etc/nixos/configuration.nix
{ ... }: {
  # These are normally in hardware-configuration.nix
  # imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot.loader.grub.device = "/dev/sda";
  fileSystems."/" = { device = "/dev/sda3"; fsType = "ext4"; };

  nixpkgs.hostPlatform = "x86_64-linux";

  # Common configuration is in /modules/nixos/common.nix
  networking.hostName = "vmi2319146";
}
