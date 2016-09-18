# nix-home

Utilities for working with user configurations in Nix.

## Supported

`nix-home`, when invoked, automically builds `~/default.nix`, which must define a derivation.

The derivation is an overlay that gets linked into your home directory. Additionally, the current derivation will be
linked at $HOME/.nix-home/current-home.

There is a helper function in nixhome called `mkHome`, for making the derivation:

	with import <nixpkgs> {};
	with import <nixhome> { inherit stdenv; inherit pkgs; };
	mkHome {
	  user = "username";
	  files = {
		 ".screenrc" = ./path-to-file;
		 ".vimrc" = "${somePkg}/path-to-file";
		 ".bashrc".content = ''
			... bashrc conents
		 '';
	  };
	}

## Planned

 * nix-home rebuild / switch
 * nix-home --list-generations
 * nix-home --rollback
 * nix-home --gc

