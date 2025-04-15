{ flake, ... }: {
  imports = [ flake.inputs.vscode-server.nixosModules.default ];


  services.vscode-server.enable = false;

}
