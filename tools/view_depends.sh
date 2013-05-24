#!/usr/bin/env bash

# view_depends.sh
#
# Generate a tree with dependencies from Makefly.
#
# requirements: graphviz

dot -Tpng -odepends.png ng_depends.dot && xdg-open depends.png
