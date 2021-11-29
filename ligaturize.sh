#!/usr/bin/env bash

mkdir -p 'build/SF-Mono Ligatures'
rm -rf modules/ligaturizer/fonts/SF-Mono
cp -r build/SF-Mono modules/ligaturizer/fonts/

pushd modules/ligaturizer || exit

rm -rf fonts/output/*.otf

for f in fonts/SF-Mono/*.otf; do
    fontforge -lang py -script ligaturize.py "$f" \
        --prefix '' \
        --output-dir='fonts/output/' \
        --output-name="SFMono Ligatures"
done

rename SFMonoLigatures SF-Mono-Ligatures fonts/output/*.otf
rm -rf fonts/SF-Mono
popd || exit

mv modules/ligaturizer/fonts/output/*.otf 'build/SF-Mono Ligatures'