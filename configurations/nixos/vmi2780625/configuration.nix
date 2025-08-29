
# NOTE: We expect this file to be supplanted by the original /etc/nixos/configuration.nix
{ ... }: {
  nixpkgs.hostPlatform = "x86_64-linux";

  # Common configuration is in /modules/nixos/common.nix
  networking.hostName = "vmi2780625";
}
