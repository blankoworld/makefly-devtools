# useful to not show commands. Otherwise put "Q=" behind pmake command
Q ?= @

# Color variables
e != echo "\033"
r_col  ?= "$e[00m" # Reset COLors
bold   ?= "$e[01m"
green  ?= "$e[32m"
yellow ?= "$e[33m"
blue   ?= "$e[34m"
white  ?= "$e[37m"

# Default variables
current = /home/olivier/projets/makefly-devtools/tests
main ?= /home/olivier/projets/makefly
default_file = ${main}/makefly
out = ${current}/out
result ?= ${current}/result

# Result appearance
result_ok  = "[ ${bold}${green}OK${r_col}  ]"
result_err = "[ ${bold}${yellow}ER${r_col} ]"

# Git version
git_branch_version != GIT_DIR="${main}/.git" git rev-parse HEAD
TODAY != date '+%Y%m%d_%H%M%S'

#####
## BEGIN
###

###############################################################################
###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that cleaning up files works.
test000_name = "Test 000"
test000_desc = "Clean command -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test000_conf = "${current}/test000.rc"
test000: test000.rc
	$Q{ \
		cp ${test000_conf} ${result}/${TODAY}-test000.rc && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test000_conf}" ${default_file} refresh > /dev/null && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test000_conf}" ${default_file} clean > ${out}/test000.out && \
		diff -u test000.ok ${out}/test000.out > ${out}/test000.diff.out && { \
		echo "-- ${test000_name}: ${result_ok} ${test000_desc}" && echo "test000.rc:${test000_name}:${test000_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test000_name}: ${result_err} ${test000_desc}" && echo "test000.rc:${test000_name}:${test000_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that compilation work without any specific functionnality.
test001_name = "Test 001"
test001_desc = "Compile without any functionnality -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test001_conf = "${current}/test001.rc"
test001: test001.rc
	$Q{ \
		cp ${test001_conf} ${result}/${TODAY}-test001.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test001_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test001_conf}" ${default_file} compile > ${out}/test001.out && \
		diff -u test001.ok ${out}/test001.out > ${out}/test001.diff.out && { \
		echo "-- ${test001_name}: ${result_ok} ${test001_desc}" && echo "test001.rc:${test001_name}:${test001_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test001_name}: ${result_err} ${test001_desc}" && echo "test001.rc:${test001_name}:${test001_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : YES
# identica: NO
# goal    : Test that compilation work with ISSO comment system.
test002_name = "Test 002"
test002_desc = "Only jskomment functionnality -- base theme WITHOUT sidebar WITHOUT search USING comment WITHOUT identica"
test002_conf = "${current}/test002.rc"
test002: test002.rc
	$Q{ \
		cp ${test002_conf} ${result}/${TODAY}-test002.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test002_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test002_conf}" ${default_file} compile > ${out}/test002.out && \
		diff -u test002.ok ${out}/test002.out > ${out}/test002.diff.out && { \
		echo "-- ${test002_name}: ${result_ok} ${test002_desc}" && echo "test002.rc:${test002_name}:${test002_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test002_name}: ${result_err} ${test002_desc}" && echo "test002.rc:${test002_name}:${test002_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: YES
# goal    : Test that compilation work with identica functionnality.
test003_name = "Test 003"
test003_desc = "Only identica functionnality -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment USING identica"
test003_conf = "${current}/test003.rc"
test003: test003.rc
	$Q{ \
		cp ${test003_conf} ${result}/${TODAY}-test003.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test003_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test003_conf}" ${default_file} compile > ${out}/test003.out && \
		diff -u test003.ok ${out}/test003.out > ${out}/test003.diff.out && { \
		echo "-- ${test003_name}: ${result_ok} ${test003_desc}" && echo "test003.rc:${test003_name}:${test003_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test003_name}: ${result_err} ${test003_desc}" && echo "test003.rc:${test003_name}:${test003_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : YES
# comment : NO
# identica: NO
# goal    : Test that SEARCH BAR is present in index.html page
test004_name = "Test 004"
test004_desc = "Search bar should be present -- base theme WITHOUT sidebar USING search WITHOUT comment WITHOUT identica"
test004_conf = "${current}/test004.rc"
test004: test004.rc
	$Q{ \
		cp ${test004_conf} ${result}/${TODAY}-test004.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test004_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test004_conf}" ${default_file} compile > ${out}/test004.out && \
		diff -u test004.ok ${out}/test004.out > ${out}/test004.diff.out && \
		diff -u test004.html ${main}/pub/index.html > ${out}/test004.diff2.out && { \
		echo "-- ${test004_name}: ${result_ok} ${test004_desc}" && echo "test004.rc:${test004_name}:${test004_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test004_name}: ${result_err} ${test004_desc}" && echo "test004.rc:${test004_name}:${test004_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that SEARCH BAR is NOT present in index.html page
test005_name = "Test 005"
test005_desc = "Search bar should not be present -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test005_conf = "${current}/test005.rc"
test005: test005.rc
	$Q{ \
		cp ${test005_conf} ${result}/${TODAY}-test005.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test005_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test005_conf}" ${default_file} compile > ${out}/test005.out && \
		diff -u test005.ok ${out}/test005.out > ${out}/test005.diff.out && \
		diff -u test005.html ${main}/pub/index.html > ${out}/test005.diff2.out && { \
		echo "-- ${test005_name}: ${result_ok} ${test005_desc}" && echo "test005.rc:${test005_name}:${test005_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test005_name}: ${result_err} ${test005_desc}" && echo "test005.rc:${test005_name}:${test005_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that documentation could be generated.
test006_name = "Test 006"
test006_desc = "Generate documentation -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test006_conf = "${current}/test006.rc"
test006: test006.rc
	$Q{ \
		cp ${test006_conf} ${result}/${TODAY}-test006.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test006_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test006_conf}" ${default_file} doc > ${out}/test006.out && \
		diff -u test006.ok ${out}/test006.out > ${out}/test006.diff.out && \
		diff -ruN test006/ ${main}/doc/ > ${out}/test006.diff2.out && { \
		echo "-- ${test006_name}: ${result_ok} ${test006_desc}" && echo "test006.rc:${test006_name}:${test006_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test006_name}: ${result_err} ${test006_desc}" && echo "test006.rc:${test006_name}:${test006_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : minisch
# sidebar : YES
# search  : YES
# comment : YES
# identica: YES
# MAX_POST: 2
# MAX_POST_LINES: 13
# MAX_RSS : 5
# goal    : Test that we can compile with the max functionnalities' number.
test007_name = "Test 007"
test007_desc = "All functionnalities except INTRO -- minisch theme"
test007_conf = "${current}/test007.rc"
test007: test007.rc
	$Q{ \
		cp ${test007_conf} ${result}/${TODAY}-test007.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test007_conf}" ${default_file} clean > /dev/null && \
		LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test007_conf}" ${default_file} compile > ${out}/test007.out && \
		diff -u test007.ok ${out}/test007.out > ${out}/test007.diff.out && { \
		echo "-- ${test007_name}: ${result_ok} ${test007_desc}" && echo "test007.rc:${test007_name}:${test007_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test007_name}: ${result_err} ${test007_desc}" && echo "test007.rc:${test007_name}:${test007_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################

# THEME   : base
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that compilation DOESN'T work if TMPL_EXT is same as PAGE_EXT (without any specific functionnality).
test008_name = "Test 008"
test008_desc = "TMPL_EXT = PAGE_EXT should NOT compile -- base theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test008_conf = "${current}/test008.rc"
test008: test008.rc
	$Q{ \
		cp ${test008_conf} ${result}/${TODAY}-test008.rc && \
		(LANG=en_US.UTF-8 CURDIR=${main} RC_CONFIG="${test008_conf}" ${default_file} clean > ${out}/test008.out && { \
		echo "-- ${test008_name}: ${result_err} ${test008_desc}" && echo "test008.rc:${test008_name}:${test008_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test008_name}: ${result_ok} ${test008_desc}" && echo "test008.rc:${test008_name}:${test008_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

###############################################################################
###############################################################################

#####
## CONFIG
###

all: test000 test001 test002 test003 test004 test005 test006 test007 test008

.PHONY: test000 test001 test002 test003 test004 test005 test006 test007 test008

clean:
	$Qecho "Removing .out files..."
	$Qfind ${current}/ -name '*.out' -print0 |xargs -0 rm -f
	$Qecho "Done."

.MAIN: all
