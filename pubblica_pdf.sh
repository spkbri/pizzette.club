#!/usr/bin/env bash

set -e

FILENAME=$1
PASSWORD=$2

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dPDFSETTINGS=/ebook -dFastWebView=true -dNOPAUSE -dQUIET -dBATCH -sOutputFile=/tmp/stage.pdf "$FILENAME"
qpdf --encrypt "$PASSWORD" "$PASSWORD" 256 -- --force-version=2.0 -- /tmp/stage.pdf "$FILENAME.new"
mv "$FILENAME" "$FILENAME.orig"
mv "$FILENAME.new" "$FILENAME"

