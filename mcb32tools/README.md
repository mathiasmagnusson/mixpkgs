# How to use

1. Make sure you have write access to the appropriate device, usually `dialout`. Can be checked
with `ls -l /dev/ttyUSB0` (or whatever device) and adding the current user to the group owning
the device, then logging out and in.
2. Make sure make is available in path e.g. through `nix shell nixpkgs#gnumake`.
3. Build this derivation e.g. through `nix build github:mathiasmagnusson/nixpkgs#mcb32tools`
4. Start a posix compliant shell (not fish)
5. Source the environment variables e.g. `. result/environment`
6. Start any shell within the current one (or not)
