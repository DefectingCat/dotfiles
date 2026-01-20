#!/bin/env bash

incat() {
    if [ -z "$1" ]; then
        echo "Usage: incat <url>"
        return 1
    fi

    curl "$1" --output - | kitten icat
}
