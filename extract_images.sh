#!/usr/bin/env bash

for d in ./images/*.dmg; do
    n=$(basename "$d" .dmg)
    tempDir=$(mktemp -d)
    buildDir=./build/"$n"
    i="$tempDir/$n".img
    dmg2img "$d" "$i"

    find "$tempDir" -name "*.img" -exec 7z x -o"$tempDir" {} ";"
    find "$tempDir" -name "*.pkg" -exec 7z x -o"$tempDir" {} ";"
    find "$tempDir" -name "Payload~" -exec 7z x -o"$tempDir" {} ";"

    mkdir -p "$buildDir"
    find "$tempDir" -name "*.[ot]tf" -exec mv -v {} "$buildDir" ";"

    rm -rf "$tempDir"
done