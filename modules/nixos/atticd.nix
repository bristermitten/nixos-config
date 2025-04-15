{ flake, ... }: {
  #imports = [ flake.inputs.atticd.nixosModules.atticd ];

  services.atticd = {
    enable = false;

    environmentFile = "/root/nix_cache_info";
  };
}
