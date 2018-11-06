#!/usr/bin/env bash

cat extensions.txt | xargs -n1 code --force --install-extension
