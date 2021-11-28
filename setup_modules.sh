#!/usr/bin/env bash

mod=modules/git-partial-submodule/git-partial-submodule.py

git submodule add --name git-partial-submodule https://github.com/Reedbeta/git-partial-submodule modules/git-partial-submodule

python3 $mod add --sparse --name nerd-fonts https://github.com/ryanoasis/nerd-fonts modules/nerd-fonts
python3 $mod restore-sparse modules/nerd-fonts

python3 $mod add --name ligaturizer https://github.com/ToxicFrog/Ligaturizer modules/ligaturizer


pushd modules/ligaturizer || exit
git submodule update --init fonts/fira
popd || exit