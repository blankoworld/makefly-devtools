#!/usr/bin/env bash
#
# prepare-new-version.sh
#
# Prepare a given branch to its new version (given in params)

if test $# -ne 2
then
  echo "Should have TWO parameters: last branch directory and version number."
  exit 1
fi

branch=$1
version=$2
tmp="./tmp"

if ! test -d "$tmp"
then
  mkdir "$tmp"
fi

if ! test -d "$tmp/makefly"
then
  mkdir "$tmp/makefly"
fi

# Copy original content to a temporary one
cp -r $branch/* "$tmp/makefly" || exit 1
# Copy makefly example configuration file to the right one
cp $tmp/makefly/makefly.rc.example $tmp/makefly/makefly.rc
# Change Makefly version in code
cat $tmp/makefly/Makefile |sed -e "s#\(VERSION = \).*#\1$2#g" > "$tmp/makefly/Makefile.new" && mv -f "$tmp/makefly/Makefile.new" "$tmp/makefly/Makefile"
cat $tmp/makefly/Changelog |sed -e "s#^\(Current \)(.*)#\1#g" > "$tmp/makefly/Changelog.new" && mv -f "$tmp/makefly/Changelog.new" "$tmp/makefly/Changelog"
# Generate documentation
MAKEOBJDIR="$tmp/makefly" conf="$tmp/makefly/makefly.rc" pmake -f "$tmp/makefly/Makefile" doc || exit 1
# Delete useless 
cd $tmp/makefly && grep -Ev '^($|#)' ../../prepare-new-version.txt | xargs -n 1 rm -fr && cd ../../ || exit 1
# Create a tarball
cd $tmp && zip -r ../makefly_$2.zip makefly && cd ../ || exit 1
# Delete temporary directory
rm -rf $tmp

exit 0
