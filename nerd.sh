#!/usr/bin/env bash

shopt -s globstar

pushd "fonts" || exit

for f in "SF Mono/"*
do
    D="SF Mono Nerd Font Complete"
    mkdir "$D"
    ../nerd-fonts/font-patcher "$f" \
        -c --progressbars -out "$D"

    F=$(ls -Art "$D" | tail -n 1)
    Fp=${F// /-}
    Fp=${Fp//Nerd-Font-Complete/NerdFontComplete}
    mv "$D/$F" "$D/$Fp"
done

for f in "Liga SF Mono/"*
do
    D="Liga SF Mono Nerd Font Complete"
    mkdir "$D"
    ../nerd-fonts/font-patcher "$f" \
        -c --progressbars -out "$D"

    F=$(ls -Art "$D" | tail -n 1)
    Fp=${F// /-}
    Fp=${Fp//Nerd-Font-Complete/NerdFontComplete}
    mv "$D/$F" "$D/$Fp"
done

popd || exit
