with import <nixpkgs> {};
with import <nixhome> { inherit stdenv; inherit pkgs; };
let
  dotfiles = stdenv.mkDerivation {
    name = "mathiasbynens-dotfiles";
    src = fetchgit {
      url = "https://github.com/mathiasbynens/dotfiles.git";
      rev = "4def07deeee588432e064d2c7baa049ffd6ac9d5";
      sha256 = "0x167i9b95v7vpd88dqmh5n8k6b7v6cgbf7hp6miiik6hq3lai7b";
    };
    installPhase = ''
      mkdir $out
      cp -a . $out
    '';
  };
in
mkHome {
  user = "sheenobu";
  files = {
     ".screenrc" = "${dotfiles}/.screenrc";
  };
}
