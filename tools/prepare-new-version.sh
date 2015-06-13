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

# Copy original content to a TEMPORARY one
echo "Create new branch..."
cp -r $branch/* "$tmp/makefly" || exit 1

# Copy CONFIG file into TEMPORARY dir
echo "Copy makefly configuration file..."
cp $tmp/makefly/makefly.rc.example $tmp/makefly/makefly.rc

# Change Makefly version
echo "Change makefly version to given one..."
cat $tmp/makefly/config |sed -e "s#\(VERSION = \).*#\1$2#g" > "$tmp/makefly/config.new" && mv -f "$tmp/makefly/config.new" "$tmp/makefly/config"
# same in Changelog file
echo -e "\tin Changelog..."
cat $tmp/makefly/Changelog |sed -e "s#^\(Current \).*#Version $2#g" > "$tmp/makefly/Changelog.new" && mv -f "$tmp/makefly/Changelog.new" "$tmp/makefly/Changelog"

# Generate DOCUMENTATION
echo "Generate documentation..."
cd $tmp/makefly && ./makefly doc && cd ../../ || exit 1

# DELETE USELESS FILES/DIR
echo "Delete specific files/directories..."
cd $tmp/makefly && grep -Ev '^($|#)' ../../prepare-new-version.txt | xargs -n 1 rm -fr && cd ../../ || exit 1
cd $tmp/makefly/lang && rm -f *.po && cd ../../../ || exit 1

# Create a compressed TARBALL
echo "Create default archive..."
cd $tmp && zip -q -r ../makefly_$2.zip makefly && cd ../ || exit 1

# FRENCH VERSION
echo "Create french archive..."
cat $tmp/makefly/makefly.rc.fr.example > $tmp/makefly/makefly.rc
cd $tmp/makefly && rm -f README.md && ln -sv doc/README.fr.md README.md && cd ../../ || exit 1
cd $tmp && zip -q -r ../makefly_$2_fr.zip makefly && cd ../ || exit 1

# Delete temporary directory
echo "Clean up files and directories..."
rm -rf $tmp

exit 0
