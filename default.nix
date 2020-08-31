# To get a development shell use:
#   nix-shell
# To build with pinned nixpkgs use:
#   nix build
# To develop/build with your custom nixpkgs (from $NIX_PATH) use:
#   nix-shell --arg nixpkgs "<nixpkgs>"
#   nix build --arg nixpkgs "<nixpkgs>"

{ nixpkgs ? (builtins.fetchGit {
    url = git://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-20.03";
    rev = "5adf2a6c11646898742b0c08f7e94101620ba707";
  })
, src ? builtins.fetchGit ./.
}:
let
  pkgs = import nixpkgs { config = { }; overlays = [ ]; };
  stdenv = pkgs.pkgsStatic.stdenv;
in with pkgs; stdenv.mkDerivation rec {
  name = "hydra-ci-example-cpp";

  inherit src;

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    catch2
  ];
  cmakeFlags = [
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
    "-DCMAKE_BUILD_SHARED_LIBS=OFF"
    "-DCMAKE_SKIP_BUILD_RPATH=OFF" # To run tests in build dir. See also: https://github.com/NixOS/nixpkgs/issues/22060
  ];

  doCheck = true;
  checkTarget = "test";

  meta.maintainers = [
    "Josef Kemetmueller <josef.kemetmueller@gmail.com>"
  ];
}
