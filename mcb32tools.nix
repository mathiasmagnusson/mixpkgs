{ stdenv, fetchurl, autoPatchelfHook, zlib, libusb1, libftdi, ... }:

let
  version = "2.2";
in
stdenv.mkDerivation {
  name = "mcb32tools";
  inherit version;

  src = fetchurl {
    url =
    "https://github.com/is1200-example-projects/mcb32tools/releases/download/v${version}/mcb32tools-v${version}-x86_64-linux-gnu.run";
    sha256 = "lNtc6l2qv/QtwGcWR2PW70XN7W+m/kQfJoILVPYS8Zs=";
    executable = true;
  };

  buildInputs = [
    zlib
    libusb1
    libftdi
  ];
  nativeBuildInputs = [
    autoPatchelfHook
  ];

  phases = ["installPhase" "fixupPhase"];

  installPhase = ''
    $src --target "$out"
  '';

  postFixup = ''
    escaped_out=$(echo "$out" | sed 's/\//\\\//g')
    sed -i "s/\/opt\/mcb32tools/$escaped_out/" $out/environment
  '';
}
