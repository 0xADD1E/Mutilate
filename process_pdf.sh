#!/usr/bin/env bash
set -ex
mkdir -p Output
[[ -z "$1" ]] && {
	echo No more files
	exit
}

convert -density 300 -quality 100 "$1" temp_burst-%03d.tiff

ffmpeg -i temp_burst-%03d.tiff -pix_fmt rgb24 temp_pixfmt-%03d.tiff
rm -f temp_burst-???.tiff

#unpaper temp_pixfmt-%03d.tiff temp_unpaper-%03d.tiff
#rm -f temp_pixfmt-???.tiff

for f in $(ls temp_*.tiff); do
	convert -colors 2 "$f" "conv_$f.png"
done
rm -f temp_*.tiff

oxipng -o3 conv_*.png
convert conv_*.png cleaned.pdf
rm conv_*.png
env "PATH=/opt/homebrew/bin:$PATH" ocrmypdf cleaned.pdf "Output/$1"
rm cleaned.pdf

shift
./$0 $@
