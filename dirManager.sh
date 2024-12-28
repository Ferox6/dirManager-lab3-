#!/bin/bash

TARGET_DIR=${1:-.}

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Цільова директорія $TARGET_DIR не існує."
    exit 1
fi

for ITEM in "$TARGET_DIR"/*; do
    if [[ -d "$ITEM" ]]; then
        echo "$(basename "$ITEM") є директорією."
    elif [[ -f "$ITEM" ]]; then
        FILENAME=$(basename "$ITEM")
        NEW_DIR="${TARGET_DIR}/${FILENAME}_dir"

        mkdir -p "$NEW_DIR"
        mv "$ITEM" "$NEW_DIR/"
        echo "$FILENAME переміщений у $NEW_DIR."
    fi
done

