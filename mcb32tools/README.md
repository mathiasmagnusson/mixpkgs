# How to use

## Prerequisites

Make sure you have write access to the appropriate device, usually `dialout`.
Can be checked with `ls -l /dev/ttyUSB0` (or whatever device) and adding the
current user to the group owning the device, then logging out and in.

## Run with flakes

```sh
nix run github:mathiasmagnusson/mixpkgs#mcb32tools
```

## Run without flakes

```sh
git clone https://github.com/mathiasmagnusson/mixpkgs.git
cd mixpkgs/mcb32tools
nix-build -E '(import <nixpkgs> {}).callPackage ./. {}'
./result/bin/mcb32tools
```
