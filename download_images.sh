#!/usr/bin/env bash

apple_url='https://devimages-cdn.apple.com/design/resources/download'

sf_pro="${apple_url}/SF-Pro.dmg"
sf_compact="${apple_url}/SF-Compact.dmg"
sf_mono="${apple_url}/SF-Mono.dmg"
sf_arabic="${apple_url}/SF-Arabic.dmg"
ny="${apple_url}/NY.dmg"

mkdir images

wget "${sf_pro}" -O "./images/SF Pro.dmg"
wget "${sf_compact}" -O "./images/SF Compact.dmg"
wget "${sf_mono}" -O "./images/SF Mono.dmg"
wget "${sf_arabic}" -O "./images/SF Arabic.dmg"
wget "${ny}" -O "./images/NY.dmg"
