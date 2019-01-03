# To get a development shell use:
#   nix-shell
# To build with pinned nixpkgs use:
#   nix build
# To develop/build with your custom nixpkgs (from $NIX_PATH) use:
#   nix-shell --arg nixpkgs "<nixpkgs>"
#   nix build --arg nixpkgs "<nixpkgs>"

{ nixpkgs ? (builtins.fetchGit {
    url = git://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-18.09";
    rev = "9d608a6f592144b5ec0b486c90abb135a4b265eb";
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