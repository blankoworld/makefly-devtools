#!/usr/bin/env bash
#
# Generate a webpage containing all themes informations
#
# Depends:
# - imagemagick (convert)
# - CutyCapt (Cf. cutycapt.sf.net)
# - makefly

#####
## VARIABLES
###

BASE="../../../makefly"
install_script="${BASE}/tools/install.sh"
URL="http://localhost/~${USER}"
INSTALLDIR="${HOME}/public_html"
TEMPLATEDIR="${BASE}/template"
result="`pwd`/index.html"
tmpconf="`pwd`/themes_appearance.conf.mk"
tmpimg="`pwd`/themes_appearance.img.jpg"
tmprc="`pwd`/themes_appearance.rc"
head="`pwd`/header.html"
foot="`pwd`/footer.html"

THEMELIST=`ls -d -- ${TEMPLATEDIR}/*/|sort -r`

#####
## TESTS
###

if test -f ${result}
then
  rm ${result} && echo "" > ${result}
fi

if ! test -d img
then
  mkdir img
fi

#####
## BEGIN
###

# Clean up jpg files
rm "img/*.jpg" -f
# Update rc file
sed -i "s#\(BASE_URL = \).*\$#\1${URL}#g" ${tmprc}
sed -i "s#\(INSTALLDIR = \)\$#\1${INSTALLDIR}#g" ${tmprc}

# Create result file
cat ${head} > ${result}

# Parse theme directories
for theme in ${THEMELIST}
do
  theme_dir=`echo ${theme}|sed -e "s#${BASE}/template/##g" -e "s#/##g"`
  # fetch complete name for theme, then list of main templates and finally list of color styles
  name=`cat ${theme}/config.mk|grep "CSS_NAME"|cut -d "=" -f 2|sed -e "s#^ ##g" -e "s# $$##g"`
  main_stylelist=`find "${theme}style" -maxdepth 1 -type f -iname 'main*.css'`
  color_stylelist=`find "${theme}style" -maxdepth 1 -type f -iname 'color*.css'`
  # write result in a webpage
  echo "<h2>${name}</h2>" >> ${result}
  echo "<ol>" >> ${result}
  # parse each style for each main template
  for main_style in ${main_stylelist}
  do
    for color_style in ${color_stylelist}
    do
      # fetch main CSS name and color style name
      main=`basename ${main_style} '.css'`
      color=`basename ${color_style} '.css'`
      # create a temporary theme configuration file
      echo "CSS_NAME = ${name}" > ${tmpconf}
      echo "CSS_FILE = ${main}.css" >> ${tmpconf}
      echo "CSS_COLOR_FILE = ${color}.css" >> ${tmpconf}
      echo "JSKOMMENT_CAPTCHA_THEME = white" >> ${tmpconf}
      echo "JSKOMMENT_CSS = jskomment.css" >> ${tmpconf}
      # update rc for makefly's configuration
      sed -i "s#\(THEME = \).*#\1${theme_dir}#g" ${tmprc} || exit 1
      MAKEOBJDIR="${BASE}" conf="${tmprc}" pmake -f "${BASE}/Makefile" clean > /dev/null && MAKEOBJDIR="${BASE}" conf="${tmprc}" theme_config="${tmpconf}" pmake -f "${BASE}/Makefile" > /dev/null && rc=${tmprc} ${install_script} < <(echo "y") > /dev/null
      xvfb-run --server-args="-screen 0, 1024x768x24" CutyCapt --url=${URL} --out="${tmpimg}" --out-format=jpeg
      convert -resize 50% "${tmpimg}" "img/${main}_${color}_thb.jpg"
      cp ${tmpimg} img/${main}_${color}.jpg
      echo "<li><em>${main}</em> template with <em>${color}</em> style.<br /><a href=\"img/${main}_${color}.jpg\" target=\"_blank\"><img src=\"img/${main}_${color}_thb.jpg\"/></a></li>" >> ${result}
    done
  done
  echo "</ol>" >> ${result}
done

cat ${foot} >> ${result}

#####
## END
###

exit 0
