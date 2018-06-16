# To get a development shell use:
#   nix-shell
# To build with pinned nixpkgs use:
#   nix build
# To develop/build with your custom nixpkgs (from $NIX_PATH) use:
#   nix-shell --arg nixpkgs "<nixpkgs>"
#   nix build --arg nixpkgs "<nixpkgs>"

{ nixpkgs ? (builtins.fetchGit {
    url = git://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-18.03";
    rev = "08d245eb31a3de0ad73719372190ce84c1bf3aee";
  })
, src ? builtins.fetchGit ./.
}:
let
  pkgs = import nixpkgs { config = { }; overlays = [ ]; };
in with pkgs; stdenv.mkDerivation rec {
  name = "hydra-ci-example-cpp";

  inherit src;

  nativeBuildInputs = [
    cmake
  ];

  doCheck = true;
  checkTarget = "test";

  meta.maintainers = [
    "Josef Kemetmueller <josef.kemetmueller@gmail.com>"
  ];
}