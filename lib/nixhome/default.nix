{ stdenv, pkgs }:
let

  mkHome = { user, files }: let
    src = pkgs.writeText "${user}-nix-home.json" (builtins.toJSON {
       inherit files;
    });

  in stdenv.mkDerivation {
      name = "${user}-nix-home";
      inherit src;
      builder = ./builder.sh;
  };
in
{
  inherit mkHome;
}
