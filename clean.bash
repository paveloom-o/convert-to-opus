#!/usr/bin/env bash

root="$(dirname "$(realpath -s "$0")")"
find "$root" -mindepth 1 -type d -exec rm -rf {} +
