rec {
  build = with import <nixpkgs> { };
  releaseTools.nixBuild {
    name = "helloworld";
    src = ./.;
    doCheck = true;
    checkTarget = "test";
    buildInputs = [ cmake ];
    meta.maintainers = [ 
      "Josef Kemetmueller <josef.kemetmueller@gmail.com>"
    ]; 
  };
}
