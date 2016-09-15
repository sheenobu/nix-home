# nix-home

Utilities for working with user configurations in Nix.

## Supported

`nix-home`, when invoked, automically builds ~/default.nix, which much define a derivation. There is a helper function
in nixhome called `mkHome`.

	with import <nixpkgs> {};
	with import <nixhome> { inherit stdenv; inherit pkgs; };
	mkHome {
	  user = "username";
	  files = {
		 ".screenrc" = ./path-to-file;
		 ".vimrc" = "{somePkg}/path-to-file";
		 ".bashrc".content = ''
			... bashrc conents
		 '';
	  };
	}

## Planned

 * nix-home build / switch
 * nix-home --list-generations
 * nix-home --rollback

