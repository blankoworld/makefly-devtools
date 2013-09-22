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
POST1_KEYWORDS="discovering, welcome"
IFS='' read -r -d '' POST1_CONTENT<<'EOF'
### Introduction

Makefly is a *static weblog engine* working thanks to a BSD **makefile** and Lua language under GNU Affero General Public License (AGPL).

Feel free to use, modify and share it!

### Main

Makefly result is composed of:

  * The Homepage: main page
  * The post's list: a list view of all posts
  * The tag's list: a list view of all tags
  * RSS feed: a file that permit your users to feed you with some RSS feed clients
  * An optional about's page that give information about your blog

### Functionalities

You have a lot of possibilities like:

  * templates to customize your blog
  * share file to the Web using 'static' directory
  * add comments to your posts
  * show your last statuses from StatusNet instance
  * sort your post by tags
  * backup your blog
  * publish your blog on a remote machine
  * translate it easily
  * create some post in advance but do not show them (using timestamp)
  * create an introduction for all pages in your blog
  * create a conclusion for all pages in your blog
  * add a sidebar with some links to your friend's blogs

### Technical info

If you know what a static weblog is, here is some details:

  * Lua language
  * BSD Makefile to launch commands
  * RSS feed
  * tags
  * permalink
  * set posting date (using a _timestamp_)
  * set max post that appears on homepage
  * set max post lines that will appears for each post on homepage (with a _read more_ link)
  * translations: English, French. Approximatively 30 words to translate for other languages
  * supplementary files can be added to the result
  * comment system in javascript using a free and open source server
  * templates
  * statusnet badge
  * backup your configuration file, theme, static files and some important files for your Makefile blog
  * command that permit to create a new theme
  * publish script
  * install script to a local directory
  * sidebar possibililty with some links
  * about's page
  * introduction on all pages
  * conclusion on all pages

### Conclusion

In fact, it's a lightweight weblog engine that generate some HTML static files which is compatible with a lot of provider.
EOF
IFS="\\"

# POST 2
POST2_AUTHOR="anonymous"
POST2_TITLE="Makefly project"
POST2_DESC="How to contribute?"
POST2_DATE="2012-07-01"
POST2_TAGS="makefly, social, programmation"
POST2_TYPE="normal"
POST2_KEYWORDS=""
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
POST3_TAGS="news, a test to see if space breaks tags, web"
POST3_TYPE="special"
POST3_KEYWORDS=""
IFS='' read -r -d '' POST3_CONTENT<<'EOF'
Just remember one address for last makefly news: [http://makefly.e-mergence.org/](http://makefly.e-mergence.org/ "Visit official Makefly weblog to have news about Makefly!").

I will post some tips & tricks, news and event about Makefly here. For this, I could use some example like this to be changed in a file:

    YOURVAR = the content of your variable

But those who prefer to be more connected, I suggest you [to follow Makefly identica's group](http://identi.ca/group/makefly).

<iframe width="640" height="360" src="//www.youtube.com/embed/dHURyRLMOK0" frameborder="0" allowfullscreen></iframe>

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
POST4_KEYWORDS="easter,egg"
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
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST1_AUTHOR}; echo ${POST1_TITLE}; echo ${POST1_DESC}; echo ${POST1_TAGS}; echo ${POST1_TYPE}; echo ${POST1_KEYWORDS}) && echo -e ${POST1_CONTENT} > ${SRCDIR}/welcome_to_makefly.md || exit 1

# create POST 2
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST2_AUTHOR}; echo ${POST2_TITLE}; echo ${POST2_DESC}; echo ${POST2_TAGS}; echo ${POST2_TYPE}; echo ${POST2_KEYWORDS}) && echo -e ${POST2_CONTENT} > ${SRCDIR}/makefly_project.md || exit 1

# create POST 3
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST3_AUTHOR}; echo ${POST3_TITLE}; echo ${POST3_DESC}; echo ${POST3_TAGS}; echo ${POST3_TYPE}; echo ${POST3_KEYWORDS}) && echo -e ${POST3_CONTENT} > ${SRCDIR}/official_weblog_open.md || exit 1

# create POST 4
DBDIR=${DBDIR} SRCDIR=${SRCDIR} ./create_post.sh -q < <(echo ${POST4_AUTHOR}; echo ${POST4_TITLE}; echo ${POST4_DESC}; echo ${POST4_TAGS}; echo ${POST4_TYPE}; echo ${POST4_KEYWORDS}) && echo -e ${POST4_CONTENT} > ${SRCDIR}/post_in_the_future.md || exit 1

# Change TIMESTAMP of posts
mv ${DBDIR}/*,welcome_to_makefly.mk "${DBDIR}/`date -d ${POST1_DATE} +'%s'`,welcome_to_makefly.mk"
mv ${DBDIR}/*,makefly_project.mk "${DBDIR}/`date -d ${POST2_DATE} +'%s'`,makefly_project.mk"
mv ${DBDIR}/*,official_weblog_open.mk "${DBDIR}/`date -d ${POST3_DATE} +'%s'`,official_weblog_open.mk"
mv ${DBDIR}/*,post_in_the_future.mk "${DBDIR}/`date -d ${POST4_DATE} +'%s'`,post_in_the_future.mk"

# Add JSKOMMENT prefix to POST3
echo "JSKOMMENT_PREFIX =" >> "${DBDIR}/`date -d ${POST3_DATE} +'%s'`,official_weblog_open.mk"

# END
exit 0
