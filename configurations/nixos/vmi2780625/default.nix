# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    inputs.disko.nixosModules.disko
    ./configuration.nix
    ./disk-config.nix
  ];

  
  # Enable home-manager for "alex" user
  home-manager.users."alex" = {
    imports = [ (self + /configurations/home/alex.nix) ];
  };
}
