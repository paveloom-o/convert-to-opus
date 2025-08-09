#!/usr/bin/env bash

set -e
shopt -s extglob

convert_status() {
    local in_dir_name="$1"
    local i=$2
    local n=$3

    echo -en "\r\x1B[2KConverting \"$in_dir_name\"... ($((i + 1))/$n)"
}

convert() {
    local in_file="$1"
    local out_file="$2"

    ffmpeg -y -i "$in_file" -c:a libopus "$out_file" &>/dev/null &
}

convert_dir() {
    local in_dir=$1
    local out_dir=$2

    local in_files=("${in_dir}"/@(*.flac|*.wav))
    declare -i n=${#in_files[@]}

    for in_file in "${in_files[@]}"; do
        local in_file_name="${in_file##*/}"
        local out_file_name="${in_file_name%.*}.opus"
        local out_file="$out_dir/$out_file_name"

        convert "$in_file" "$out_file"
    done

    local in_dir_name="${in_dir##*/}"
    for ((i = 0; i < n; i++)); do
        convert_status "$in_dir_name" $i $n
        wait -n
    done

    echo
}

process() {
    local root
    root="$(dirname "$(realpath -s "$0")")"

    for in_dir in "$root"/*; do
        [[ -d $in_dir ]] || continue

        local postfix=" (Opus)"
        [[ "$in_dir" == *"$postfix"* ]] && continue

        local out_dir="$in_dir$postfix"
        mkdir -p "$out_dir"

        convert_dir "$in_dir" "$out_dir"
    done
}

process
