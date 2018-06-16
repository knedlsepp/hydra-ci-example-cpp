{ nixpkgs }:
rec {
  build = import ./default.nix { inherit nixpkgs; };
}
