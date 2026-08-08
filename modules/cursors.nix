{ pkgs, ... }:

let
  # JuxCursor
  # https://github.com/juxtopposed/cosmic
  jux-cursor = pkgs.stdenv.mkDerivation {
    pname = "juxcursor";
    version = "0.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "juxtopposed";
      repo = "cosmic";
      rev = "b1c5215f4dda9023dd550536126afb086a91b6f7";
      hash = "sha256-3iGEsetwrYcY+zDtLw80/g6TRoHUqEcW2U9gBM3gbDg=";
    };

    nativeBuildInputs = [ pkgs.unzip ];

    installPhase = ''
      mkdir -p $out/share/icons
      unzip $src/JuxCursor.zip
      cp -r JuxCursor $out/share/icons/
    '';
  };
in
{
  # Bibata
  # gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Classic"
  home.packages = [ pkgs.bibata-cursors ];

  # Cursor theme
  gtk.cursorTheme = {
    package = jux-cursor;
    name = "JuxCursor";
  };
}
