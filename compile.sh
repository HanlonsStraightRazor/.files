#!/bin/bash

################################################################################
# Compiles files to PDF using pandoc.
# Currently supported formats:
#   - Markdown (.md)
#   - (La)TeX (.tex)
################################################################################

# Check to see if file exists
if [ ! -f $1 ]; then
  1>&2 echo Error: File does not exist.
  exit 1
fi

# If so, break it up into its name and extension
filename=$(echo $1 | awk -F. '{ print $1 }')
extension=$(echo $1 | awk -F. '{ print $2 }')

# Compile the file with pandoc based on its type
# Its name will be the original name,
# but with the extension changed to .pdf
echo Compiling...
if [ $extension == md ]; then
  pandoc -s -f commonmark -t pdf -o $filename.pdf $filename.md
elif [ $extension == tex ]; then
  pandoc -s -f latex -t pdf -o $filename.pdf $filename.tex
else
  1>&2 echo Error: File format not supported.
  exit 1
fi
echo Done.
exit 0
