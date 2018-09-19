{
}@args:

let
  repo = fetchGit {
    url = "git://git.devalot.com/edify.git";
    rev = "440988b08fc27ea13119aa197e7a17344295f0e2";
  };

  edify = import "${repo}/nix/builder.nix" args;
  pkgs  = edify.pkgs;
in

edify.mkDerivation rec {
  name = "rubyclass-${version}";
  version = "2.0";
  src = ./.;

  # Files to include in the zip archive:
  extraFiles = [ "LICENSE" "README.md" "src" ];

  # Additional system dependencies:
  buildInputs = [
    (pkgs.ruby_2_4.override {
      docSupport = true;
    })
  ];

  # Link archive to generic name:
  installPhase = ''
    ( cd $out && ln -nfs ${name}.zip rubyclass.zip )
  '';

  # When installing gems, make them install locally.
  shellHook = ''
    export GEM_HOME=$(pwd)/gems
    export PATH=$GEM_HOME/bin:$PATH
  '';
}
