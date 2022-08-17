#!/bin/sh

cd "$HOME_DIR"  || exit

npm install --no-package-lock  --legacy-peer-deps --no-fund

npm run start
