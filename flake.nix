{
  description = "A collection of some packages i've gotten to run with nix";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system} = {
      mars = import ./mars.nix pkgs;
      mcb32tools = import ./mcb32tools pkgs;
      binary-ninja = import ./binary-ninja.nix pkgs;
    };
    devShells.${system} = {
      mcb32tools = import ./mcb32tools/shell.nix pkgs;
    };
  };
}
