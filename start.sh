#!/bin/sh

# How to use this ...
#
# 1. Run this script
#    sh ./start.sh
# 2. Visit website: http://127.0.0.1:4004

BUILD_DIR=build
OUTFILE=add.min.js
OUTMAP=add.min.js.map

npm install uglify-js

UGLIFY_BIN=node_modules/uglify-js/bin/uglifyjs

# no directive
mkdir -p ${BUILD_DIR}/nodirective
$UGLIFY_BIN add.js -o ${BUILD_DIR}/nodirective/${OUTFILE}

# bad sourcemap url
mkdir -p ${BUILD_DIR}/missing
$UGLIFY_BIN add.js --source-map url=${OUTMAP} -o ${BUILD_DIR}/missing/${OUTFILE}
rm ${BUILD_DIR}/missing/${OUTMAP} # remove map so directive points nowhere

# no sources
mkdir -p ${BUILD_DIR}/noSources
$UGLIFY_BIN add.js --source-map url=${OUTMAP} -o ${BUILD_DIR}/noSources/${OUTFILE}

# include sources
mkdir -p ${BUILD_DIR}/includeSources
$UGLIFY_BIN add.js --source-map url=${OUTMAP},includeSources -o ${BUILD_DIR}/includeSources/${OUTFILE}

echo "Starting webserver at http://127.0.0.1:4004"
python -m SimpleHTTPServer 4004