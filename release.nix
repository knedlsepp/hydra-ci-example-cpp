{ nixpkgs, src }:
rec {
  build = import ./default.nix { inherit nixpkgs src; };
}
