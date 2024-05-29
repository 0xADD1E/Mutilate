#!/usr/bin/env bash
[ -z "$1" ] && {
    echo "Must specify an input filename!"
    exit 1
}
convert -density 150 "$1" -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -attenuate 0.4 +noise Multiplicative -attenuate 0.03 +noise Multiplicative -sharpen 0x1.0 -colorspace Gray "$1.out.pdf"
./process_pdf.sh "$1.out.pdf"
