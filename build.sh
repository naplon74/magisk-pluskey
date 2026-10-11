#!/bin/bash
set -e
rm -f pluskey.zip
cd module && zip -r ../pluskey.zip . -x '*.git*'
