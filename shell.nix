with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "movie-night";
  buildInputs = [
    elixir_1_14
    inotify-tools
  ];
}

