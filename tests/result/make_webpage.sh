#!/usr/bin/env bash
#
# make_webpage.sh
#
# Generate a webpage with test results.

files=`ls *.txt`
result="result.html"
header="header.html"
footer="footer.html"

# Test that result doesn't exist
if [[ -f ${result} ]]
then
  rm -f ${result}
fi

cat ${header} > ${result}

for f in $files
do
  date=`echo $f|cut -d '-' -f 1`
  id=`echo $f|cut -d '-' -f 2|cut -d '.' -f 1`
  echo "<h2>${date}</h2>" >> ${result}
  echo "<p>Hash: ${id}" >> ${result}
  echo "<ul>" >> ${result}
  cat $f | while read line ; do
      conf=`echo $line|cut -d ':' -f 1`
      name=`echo $line|cut -d ':' -f 2`
      desc=`echo $line|cut -d ':' -f 3`
      state=`echo $line|cut -d ':' -f 4`
      echo "        <li><ul class='${state}'><li class='config'>Config: ${conf}</li><li class='name'>Name: ${name}</li><li class='description'>Description: ${desc}</li><li>${state}</li></ul></li>" >> ${result}
  done
  echo "</ul></p>" >> ${result}
done

cat ${footer} >> ${result}

exit 0
