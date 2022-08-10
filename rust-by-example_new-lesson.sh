#!/bin/sh
# Boris Nimcevic
# 2022 August 9
# Create and start new lesson

cargo new "$1-$2" --name $2
cd "$1-$2"
nvim ./src/main.rs
