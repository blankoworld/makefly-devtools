#!/usr/bin/env bash
#
# generate_devdocumentation.sh
#
# Generate Development documentation

# Test parameters
if test $# -ne 2
then
  echo "Should have TWO parameters: last branch directory and trunk version"
  exit 1
fi

# Initialisation
branch=$1
version=$2
documentation_name="devdocumentation"
revision=`GIT_DIR="${branch}/.git" git rev-parse HEAD`
tmp="./tmp"
git_version="${version} | ${revision}"

# Some tests about result
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
cat $tmp/makefly/config |sed -e "s#\(VERSION = \).*#\1${git_version}#g" > "$tmp/makefly/config.new" && mv -f "$tmp/makefly/config.new" "$tmp/makefly/config"

# Generate DOCUMENTATION
echo "Generate documentation..."
cd $tmp/makefly && ./makefly doc && cd ../../ || exit 1

# Keep useful files
cp $tmp/makefly/doc/README.html ./${documentation_name}.html.en || exit 1
cp $tmp/makefly/doc/README.fr.html ./${documentation_name}.html.fr || exit 1

# Do replacement so that links between DEV documentation is OK
sed -i "s/documentation\.html/${documentation_name}\.html/g" ./${documentation_name}.html.* || exit 1

# Delete temporary directory
echo "Clean up files and directories..."
rm -rf $tmp

exit 0
