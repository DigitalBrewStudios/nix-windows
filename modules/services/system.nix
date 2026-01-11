{
  lib,
  config,
  pkgs,
  ...
}:
let
  portable-lib = import <nixpkgs/lib/services/lib.nix> { inherit lib; };

  modularServiceConfiguration = portable-lib.configure {
    serviceManagerPkgs = pkgs;
    extraRootModules = [
      ./winit-service.nix
    ];
  };
in
{
  options.services = lib.mkOption {
    type = lib.types.attrsOf modularServiceConfiguration.serviceSubmodule;
    default = { };
  };

  config = {
    # Convert service tree -> launchd plists, assertions, etc.
    # (analogous to how NixOS converts to systemd units)
    # launchd.agents = ...;
    # assertions = ...;
    # warnings = ...;
  };
}
