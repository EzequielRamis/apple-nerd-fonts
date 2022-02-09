#!/usr/bin/env bash

for d in ./images/*.dmg; do
    n=$(basename "$d" .dmg)
    tempDir=$(mktemp -d)
    fontsDir=./fonts/"$n"
    i="$tempDir/$n".img
    dmg2img "$d" "$i"

    find "$tempDir" -name "*.img" -exec 7z x -o"$tempDir" {} ";"
    find "$tempDir" -name "*.pkg" -exec 7z x -o"$tempDir" {} ";"
    find "$tempDir" -name "Payload~" -exec 7z x -o"$tempDir" {} ";"

    mkdir -p "$fontsDir"
    find "$tempDir" -name "*.[ot]tf" -exec mv -v {} "$fontsDir" ";"

    rm -rf "$tempDir"
done
