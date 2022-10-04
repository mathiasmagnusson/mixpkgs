# How to use

## Prerequisites

Make sure you have write access to the appropriate device, usually `dialout`. Can be checked
with `ls -l /dev/ttyUSB0` (or whatever device) and adding the current user to the group owning
the device, then logging out and in.

## Alternative 1: `nix develop`

```sh
nix develop github:mathiasmagnusson/nixpkgs#mcb32tools
```

## Alternative 2: `nix build`

1. Make sure make is available in path e.g. through `nix shell nixpkgs#gnumake`.
2. Build this derivation e.g. through `nix build github:mathiasmagnusson/nixpkgs#mcb32tools`
3. Start a posix compliant shell
4. Source the environment variables e.g. `. result/environment`
5. Optionally start any shell within the current one
