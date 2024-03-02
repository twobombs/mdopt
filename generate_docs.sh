#!/bin/bash

PACKAGE_DIR="mdopt"
DOCS_DIR="docs"
SPHINX_SOURCE_DIR="docs/source"
SPHINX_BUILD_DIR="docs/build"

# Ensure the script is executed from the project root
if [ ! -d "$PACKAGE_DIR" ] || [ ! -d "$DOCS_DIR" ]; then
    echo "Error: Script must be run from the root of the project."
    exit 1
fi

# Generate .rst files with sphinx-apidoc
echo "Generating .rst files with sphinx-apidoc..."
sphinx-apidoc -o "$SPHINX_SOURCE_DIR" "$PACKAGE_DIR" --force

# Build the Sphinx documentation
echo "Building Sphinx documentation..."
sphinx-build -b html "$SPHINX_SOURCE_DIR" "$SPHINX_BUILD_DIR"

# Alternatively, if you're using the Makefile generated by Sphinx:
# make -C "$DOCS_DIR" html

echo "Documentation generation complete. Check the $SPHINX_BUILD_DIR directory."
