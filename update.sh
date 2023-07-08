#!/bin/sh

CUR=$(pwd)

CURRENT=$(cd $(dirname $0);pwd)
echo "${CURRENT}"

cd "${CURRENT}"
git pull --prune
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi

cd "${CURRENT}"
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi
echo ""
pwd
pnpm install -r && pnpm up -r && pnpm build
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi

cd "${CURRENT}"/backend
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi
echo ""
pwd
cargo update && cargo build
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi

cd "${CURRENT}"
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi
git commit -am "Bumps node modules" && git push
result=$?
if [ $result -ne 0 ]; then
  cd "${CUR}"
  exit $result
fi

cd "${CUR}"
