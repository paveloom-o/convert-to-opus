#!/usr/bin/env bash

root="$(dirname "$(realpath -s "$0")")"
find "$root" -mindepth 1 -maxdepth 1 -type d -not -name .git -exec rm -rf {} +
