{ stdenv, fetchurl, jre, ... }:

stdenv.mkDerivation {
  name = "mars";
  version = "4.5";

  src = fetchurl {
    url = https://courses.missouristate.edu/KenVollmar/MARS/MARS_4_5_Aug2014/Mars4_5.jar;
    sha256 = "rDQLZ2uitiJGud935i+BrURHvP0ymrU5cWvNCZULcJY=";
  };

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin $out/lib
    echo "#!/bin/sh" > $out/bin/mars
    echo 'export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.xrender=true"' >> $out/bin/mars
    echo "${jre}/bin/java -jar $out/lib/Mars4_5.jar" >> $out/bin/mars
    chmod +x $out/bin/mars
    cp $src $out/lib/Mars4_5.jar
  '';
}
