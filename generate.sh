#!/bin/sh

# How to use this ...
#
# 1. Install npm
#    $ npm install -g uglify-js
# 2. Run this script
#    sh ./generate.sh

BUILD_DIR=build

# no directive
mkdir -p ${BUILD_DIR}/nodirective
uglifyjs add.js -o ${BUILD_DIR}/nodirective/add.min.js

# bad sourcemap url
mkdir -p ${BUILD_DIR}/missing
uglifyjs add.js --source-map url=add.min.js.map -o ${BUILD_DIR}/missing/add.min.js
rm ${BUILD_DIR}/missing/add.min.js.map # remove map so directive points nowhere

# no sources
mkdir -p ${BUILD_DIR}/noSources
uglifyjs add.js --source-map url=add.min.js.map -o ${BUILD_DIR}/noSources/add.min.js

# include sources
mkdir -p ${BUILD_DIR}/includeSources
uglifyjs add.js --source-map url=add.min.js.map,includeSources -o ${BUILD_DIR}/includeSources/add.min.js