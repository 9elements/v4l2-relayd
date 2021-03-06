#!/bin/sh

test -n "$srcdir" || srcdir=`dirname "$0"`
test -n "$srcdir" || srcdir=.

olddir=`pwd`
cd "$srcdir"

mkdir -p m4

AUTORECONF=`which autoreconf`
if test -z $AUTORECONF; then
  echo "*** No autoreconf found, please install it ***"
  exit 1
fi

autoreconf --force --install --verbose || exit $?

cd "$olddir"
test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"
