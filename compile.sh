#!/bin/bash

################################################################################
# Compiles files to PDF using pandoc.
# Currently supported formats:
#   - Markdown (.md)
#   - (La)TeX (.tex)
################################################################################

# Check to see if file exists
if [ ! -f $1 ]; then
  1>&2 echo "Error: File does not exist."
  exit 1
fi

# If so, break it up into its name and extension
FILENAME=$(echo $1 | awk -F/ '{ print $NF }' | awk -F. '{ print $1 }')
EXTENSION=$(echo $1 | awk -F/ '{ print $NF }' | awk -F. '{ print $2 }')

# Compile the file with pandoc based on its type
# Its name will be the original name,
# but with the extension changed to .pdf
echo "Compiling..."
if [ "$EXTENSION" == "md" ]; then
  pandoc -s -f commonmark -t pdf -o ${FILENAME}.pdf ${FILENAME}.md
elif [ "$EXTENSION" == "tex" ]; then
  pandoc -s -f latex -t pdf -o ${FILENAME}.pdf ${FILENAME}.tex
else
  1>&2 echo "Error: File format not supported."
  exit 2
fi
echo "Done."
exit 0
