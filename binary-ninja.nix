{ fetchzip, buildFHSUserEnv, ... }:
let
  binary-ninja = fetchzip {
    url = "https://cdn.binary.ninja/installers/BinaryNinja-demo.zip";
    hash = "sha256-Kor1pRAgGAwG1moz7tstEuDXhX8qHkX69mCE6jWyaxI=";
  };
in
buildFHSUserEnv {
  name = "binary-ninja";
  runScript = "${binary-ninja}/binaryninja";
  targetPkgs = pkgs:
  with pkgs; [
    libGL fontconfig xorg.libX11 xorg.libxcb
    libxkbcommon freetype qt6.qtbase
    zlib dbus
  ];
}
