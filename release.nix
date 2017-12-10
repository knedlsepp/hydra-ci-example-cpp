rec {
  build = with import <nixpkgs> { };
  releaseTools.nixBuild {
    name = "helloworld";
    src = ./.;
    doCheck = true;
    checkTarget = "test";
    buildInputs = [ cmake ];
  };
}
