# nix-home

Utilities for working with user configurations in Nix.

## commands

### nix-home

The command delegates to nix-env, so it supports any parameter that nix-env does.

Running `nix-home` by itself builds and symlinks the files defined in $HOME/default.nix

NOTE: `nix-home --dry-run` will still attempt to link. This is a bug! #15

### nix-build-home

nix-build-home builds $HOME/default.nix via nix-build and prints out the derivation. Useful
for testing your config without linking to your home directory. Does NOT generate a ./result
symlink.

## Installation

The package for installing nix-home is on the wiki [here](https://github.com/sheenobu/nix-home/wiki/package.nix). Include it in your configuration.nix file via:

```
environment.systemPackages = [
  ((pkgs.callPackage path/to/nixhome/package.nix) { })
]
```

## Supported

`nix-home`, when invoked, builds `~/default.nix`, which must define a derivation.

nix-home calls nix-env to build a profile from the derivation. The derivation
is an overlay that gets linked into your home directory.

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

## Generations

Generations are supported via standard `nix-env` parameters:

	* nix-home --list-generations
	* nix-home --rollback
	* nix-home --switch-generation 1
	* nix-home --delete-generations 1 2 3
