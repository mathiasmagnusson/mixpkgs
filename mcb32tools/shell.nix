pkgs @ { mkShell, ... }:

let
  deriv = import ./default.nix pkgs;
in
mkShell {
  name = "mcb32tools";
  inherit (deriv) version;

  /* nativeBuildInputs = [ */
  /*   deriv */
  /* ]; */

  shellHook = ''
    . ${deriv}/environment

    green=$(tput setaf 2)
    bred=$(tput setaf 9)
    reset=$(tput sgr0)
    export PS1="\[$green\]mcb32\[$reset\] \[$bred\]\W\[$reset\] $ "
  '';
}
