# Build using:
#   nix build -f release.nix
{ nixpkgs ? <nixpkgs>
, src ? builtins.fetchGit ./.
}:
rec {
  build = import ./default.nix { inherit nixpkgs src; };
}
