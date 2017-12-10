rec {
  build = with import <nixpkgs> { system = "x86_64-linux"; };
  releaseTools.nixBuild {
    name = "helloworld";
    src = ./.;
    doCheck = true;
    buildInputs = [ stdenv ];
  };
}
