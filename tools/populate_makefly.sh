#!/usr/bin/env bash

# populate_makefly.sh
#
# permit to create some post for Makefly

#####
## LICENSE
###

# Makefly, a static weblog engine using a BSD Makefile
# Copyright (C) 2012 DOSSMANN Olivier
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# VARIABLES
Makefile='../Makefile'
DBDIR=`cat ${Makefile} |grep "^DBDIR[ ]*="|cut -d'=' -f2 |sed -e "s/^ //g" -e "s/^\./\.\./g"` # sed delete useless space
SRCDIR=`cat ${Makefile} |grep "^SRCDIR[ ]*="|cut -d'=' -f2 |sed -e "s/^ //g" -e "s/^\./\.\./g"` # sed delete useless space

# POST 1
POST1_AUTHOR="blankoworld"
POST1_TITLE="Welcome to makefly!"
POST1_DESC="Makefly discovering"
POST1_DATE="2012-06-29"
POST1_TAGS="makefly, news"
POST1_TYPE="news"
IFS='' read -r -d '' POST1_CONTENT<<'EOF'
Makefly is a *static weblog engine* working thanks to a BSD **makefile** under GNU Affero General Public License (AGPL).

It's composed of:

  * home page
  * post's list
  * tag's list

and includes somes functionalities like:

  * RSS feed
  * tags
  * permalink
  * possibility to set posting date (using a _timestamp_)
  * customization using options like max post on homepage
  * translation: English, French
  * static files
  * templates
  * comment system
  * identica badge (to display twitter/identica statuses)
  * backup command

You can so:

  * create posts
  * add tags to them
  * add image
  * generate an RSS feed
  * give some static files (for an example to share PDF)
  * have your own template
  * translate Makefly in your language
  * prepare some post and publish them in the future
  * add comments on each post
  * add an about page, an introduction on main page and/or a specific footer content
  * display your identica statuses in sidebar
  * backup your configuration file, theme, static files and some important files for your Makefile blog

In fact, it's a lightweight weblog engine that generate some HTML static files.
EOF
IFS="\\"

# POST 2
POST2_AUTHOR="anonymous"
POST2_TITLE="Makefly project"
POST2_DESC="How to contribute?"
POST2_DATE="2012-07-01"
POST2_TAGS="makefly, social, programmation"
POST2_TYPE="normal"
IFS='' read -r -d '' POST2_CONTENT<<'EOF'
## About

Makefly could be followed on [the official Makefly weblog](http://makefly.e-mergence.org/ "Visit official website").

But for those who prefer status.net, you could use the [makefly identica's group](http://identi.ca/group/makefly).

## Social coding

> How could we contribute?

Don't forget our github repository on which Makefly could be found: [https://github.com/blankoworld/makefly](https://github.com/blankoworld/makefly).

Some others information could be seen @ohloh: [http://www.ohloh.net/p/makefly](http://www.ohloh.net/p/makefly).

## Contact

For other piece of information, you could contact me at this email address: [olivier [AT] dossmann [DOT] net](mailto:olivier+makefly@dossmann.net "Contact me").
EOF
IFS="\\"

# POST 3
POST3_AUTHOR="The best long pseudo I ever seen"
POST3_TITLE="Official weblog: Open"
POST3_DESC="Makefly is now available on the web"
POST3_DATE="2012-07-04"
POST3_TAGS="news, web"
POST3_TYPE="special"
IFS='' read -r -d '' POST3_CONTENT<<'EOF'
Just remember one address for last makefly news: [http://makefly.e-mergence.org/](http://makefly.e-mergence.org/ "Visit official Makefly weblog to have news about Makefly!").

I will post some tips & tricks, news and event about Makefly here. For this, I could use some example like this to be changed in a file:

    YOURVAR = the content of your variable

But those who prefer to be more connected, I suggest you [to follow Makefly identica's group](http://identi.ca/group/makefly).

Don't forget to have fun with Makefly ;-)
EOF
IFS="\\"

# POST 4
POST4_AUTHOR="non-human"
POST4_TITLE="Post in the future"
POST4_DESC="That's so strange!"
POST4_DATE="2038-01-19 04:14:07"
POST4_TAGS="strange, archaic"
POST4_TYPE="special"
IFS='' read -r -d '' POST4_CONTENT<<'EOF'
## Introduction

This post is here to test future post. If this date: 2038-01-19 04:14:07 is not achieved, Makefly have a bug.

## Content

     .===============================================================.
     |  ,-----------------,                                          |
     | /| HELP THE BUNNY  |==========.===.   .===.   .===========.   |
     || |    FIND HIS     |          |   |   |   |   |      .-.  | E |
     || |  EASTER EGGS!   |  |===|   |   |   |   |   |..==./xxx\ | N |
     || |_________________|          |   |       |   /<<<<<\    || D |
     ||/_________________/   .======='   |   .   |   \>>>>>/xxxx/--. |
     |   |   |           |   |           |   |   |   |`'==''---; * *`\
     |   |   '==========='   |   |======='   |   |   |   ,===. \* * */
     |   |                   |               |   |   |   |   |  '--'`|
     |   '===============|   '===.   |===.   |   |   |==='   '=======|
     |                           |       |   |   |   |               |
     |   |===============.   .   '===|   |   |===|   |   .=======.   |
     |                   |   |           |   |   |   |   |       |   |
     |   .===========.   |   |   |===.   |   |   |   |   |   |   |   |
     |   |           |   |   |       |   |   |   |   |   |   |   |   |
     |   |   .===.   |   |   |===.   '===|   |   '==='   |   |   |   |
     |   |   |   |   |   |   |   |       |   |           |   |   |   |
     |   '==='   /`\ '==='   |   '===.   |   '===========|   |   |   |
     |          / : |                |   |               |   |   |   |
     | _.._=====| '/ '===|   .======='   '===========.   |   |   |   |
     /`    \    | /          |                       |   |   |       |
    |  .-._ '-"` (=======.   |   .===============.   |   |   '===.   |
    |_/  |/   e  e\==.   |   |   |               |   |   |       |   |
     | S ||  >   @ )<|   |   |   |   .=======.   |   |   |===.   |   |
     | T | \  '--`/  |   |   |   |   |       |   |   |   |   |   |   |
     | A | / '--<`   |   |   |   |   |   |   |   |   '==='   |   '   |
     | R || ,    \\\  |           |   |   |   |   |           |       |
     | T |; ;     \\\__'======.   |   |   '==='   |   .===.   |   |   |
     |   / /      |.__)==,   |   |   |           |   |   |   |   |   |
     |  (_/,--.   ; //"""\\\  |   |   '==========='   |   '==='   |   |
     |  { `|   \_/  ||___||  |   |                   |           |   |
     |   ;-\   / |  |(___)|  |   '===========.   |   '=======.   |   |
     |   |  | /  |  |XXXXX|  |               |   |           |   |   |
     |   | /  \  '-,\XXXXX/  |   .==========='   '=======.   |   |   |
     |   | \__|----' `"""`   |   |                       |   |   |   |
     |   '==================='   '======================='   '==='   |
     |                                                               |
     '==jgs=='01====================================================='

[Original one can be found here](http://www.geocities.com/spunk1111/easter.htm)

## Conclusion

WTF?! **You should not be displayed!**
EOF
IFS="\\"

# BEGIN

# create POST 1
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST1_AUTHOR}; echo ${POST1_TITLE}; echo ${POST1_DESC}; echo ${POST1_TAGS}; echo ${POST1_TYPE}) && echo -e ${POST1_CONTENT} > ${SRCDIR}/welcome_to_makefly.md || exit 1

# create POST 2
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST2_AUTHOR}; echo ${POST2_TITLE}; echo ${POST2_DESC}; echo ${POST2_TAGS}; echo ${POST2_TYPE}) && echo -e ${POST2_CONTENT} > ${SRCDIR}/makefly_project.md || exit 1

# create POST 3
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST3_AUTHOR}; echo ${POST3_TITLE}; echo ${POST3_DESC}; echo ${POST3_TAGS}; echo ${POST3_TYPE}) && echo -e ${POST3_CONTENT} > ${SRCDIR}/official_weblog_open.md || exit 1

# create POST 4
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST4_AUTHOR}; echo ${POST4_TITLE}; echo ${POST4_DESC}; echo ${POST4_TAGS}; echo ${POST4_TYPE}) && echo -e ${POST4_CONTENT} > ${SRCDIR}/post_in_the_future.md || exit 1

# Change TIMESTAMP of posts
mv ${DBDIR}/*,welcome_to_makefly.mk "${DBDIR}/`date -d ${POST1_DATE} +'%s'`,welcome_to_makefly.mk"
mv ${DBDIR}/*,makefly_project.mk "${DBDIR}/`date -d ${POST2_DATE} +'%s'`,makefly_project.mk"
mv ${DBDIR}/*,official_weblog_open.mk "${DBDIR}/`date -d ${POST3_DATE} +'%s'`,official_weblog_open.mk"
mv ${DBDIR}/*,post_in_the_future.mk "${DBDIR}/`date -d ${POST4_DATE} +'%s'`,post_in_the_future.mk"

# END
exit 0
