{ pkgs ? import <nixpkgs> { config = { allowUnsupportedSystem = true; }; } }:
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = [ pkgs.imagemagick pkgs.unpaper pkgs.oxipng pkgs.ghostscript pkgs.ffmpeg pkgs.ocrmypdf ];
}
