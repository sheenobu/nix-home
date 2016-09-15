#!/bin/sh

. $stdenv/setup

mkdir -p $out
python writeFiles.py "$src" "$out"
