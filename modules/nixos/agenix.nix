{ flake, pkgs, ... }: {
  imports = [ flake.inputs.agenix.nixosModules.default ];

  environment.systemPackages = [ flake.inputs.agenix.packages.${pkgs.system}.default ];

  age.secrets.secrets.file = ../../secrets/secrets.age;
}

