rec {
  build = with import <nixpkgs> { };
  releaseTools.nixBuild {
    name = "helloworld";
    src = ./.;
    doCheck = true;
    checkTarget = "test";
    buildInputs = [ cmake ];
    meta.maintainers = [ 
      "Josef Kemetueller <josef.kemetmueller@gmail.com>"
    ]; 
  };
}
