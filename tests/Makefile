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
current != pwd
main ?= ${current}/../../makefly/
default_file = ${main}/Makefile
out = ${current}/out
result = ${current}/result

# Result appearance
result_ok  = "[ ${bold}${green}OK${r_col}  ]"
result_err = "[ ${bold}${yellow}ER${r_col} ]"

# Git version
git_branch_version != cd ${main} && git rev-parse HEAD
TODAY != date '+%Y%m%d_%H%M%S'

#####
## BEGIN
###

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that compilation work without any specific functionnality.
test001_name = "Test 001"
test001_desc = "Minisch WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test001: test001.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test001.rc" pmake -f ${default_file} > ${out}/test001.out && \
		diff -u test001.ok ${out}/test001.out > ${out}/test001.diff.out && { \
		echo "-- ${test001_name}: ${result_ok} ${test001_desc}" && echo "test001.rc:${test001_name}:${test001_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test001_name}: ${result_err} ${test001_desc}" && echo "test001.rc:${test001_name}:${test001_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : YES
# identica: NO
# goal    : Test that compilation work with jskomment comment system.
test002_name = "Test 002"
test002_desc = "Minisch WITHOUT sidebar WITHOUT search USING comment WITHOUT identica"
test002: test002.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test002.rc" pmake -f ${default_file} > ${out}/test002.out && \
		diff -u test002.ok ${out}/test002.out > ${out}/test002.diff.out && { \
		echo "-- ${test002_name}: ${result_ok} ${test002_desc}" && echo "test002.rc:${test002_name}:${test002_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test002_name}: ${result_err} ${test002_desc}" && echo "test002.rc:${test002_name}:${test002_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : NO
# identica: YES
# goal    : Test that compilation work with identica functionnality.
test003_name = "Test 003"
test003_desc = "Minisch WITHOUT sidebar WITHOUT search WITHOUT comment USING identica"
test003: test003.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test003.rc" pmake -f ${default_file} > ${out}/test003.out && \
		diff -u test003.ok ${out}/test003.out > ${out}/test003.diff.out && { \
		echo "-- ${test003_name}: ${result_ok} ${test003_desc}" && echo "test003.rc:${test003_name}:${test003_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test003_name}: ${result_err} ${test003_desc}" && echo "test003.rc:${test003_name}:${test003_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

# THEME   : default
# sidebar : NO
# search  : YES
# comment : NO
# identica: NO
# goal    : Test that SEARCH BAR is present in index.html page
test004_name = "Test 004"
test004_desc = "default theme WITHOUT sidebar USING search WITHOUT comment WITHOUT identica"
test004: test004.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test004.rc" pmake -f ${default_file} > ${out}/test004.out && \
		diff -u test004.ok ${out}/test004.out > ${out}/test004.diff.out && \
		diff -u test004.html ${main}/pub/index.html > ${out}/test004.diff2.out && { \
		echo "-- ${test004_name}: ${result_ok} ${test004_desc}" && echo "test004.rc:${test004_name}:${test004_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test004_name}: ${result_err} ${test004_desc}" && echo "test004.rc:${test004_name}:${test004_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

# THEME   : default
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that SEARCH BAR is NOT present in index.html page
test005_name = "Test 005"
test005_desc = "default theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test005: test005.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test005.rc" pmake -f ${default_file} > ${out}/test005.out && \
		diff -u test005.ok ${out}/test005.out > ${out}/test005.diff.out && \
		diff -u test005.html ${main}/pub/index.html > ${out}/test005.diff2.out && { \
		echo "-- ${test005_name}: ${result_ok} ${test005_desc}" && echo "test005.rc:${test005_name}:${test005_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test005_name}: ${result_err} ${test005_desc}" && echo "test005.rc:${test005_name}:${test005_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

# THEME   : default
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
# goal    : Test that documentation could be generated.
test006_name = "Test 006"
test006_desc = "Generate documentation -- default theme WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test006: test006.rc
	$Q{ \
		(MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test006.rc" pmake -f ${default_file} doc > ${out}/test006.out && \
		diff -u test006.ok ${out}/test006.out > ${out}/test006.diff.out && \
		diff -ruN test006/ ${main}/doc/ > ${out}/test006.diff2.out && { \
		echo "-- ${test006_name}: ${result_ok} ${test006_desc}" && echo "test006.rc:${test006_name}:${test006_desc}:OK" >> ${result}/${TODAY}-${git_branch_version}.txt ; }) || { \
		echo "-- ${test006_name}: ${result_err} ${test006_desc}" && echo "test006.rc:${test006_name}:${test006_desc}:ER" >> ${result}/${TODAY}-${git_branch_version}.txt ; } ; \
	}

#####
## CONFIG
###

all: test001 test002 test003 test004 test005 test006

clean:
	$Qecho "Removing .out files..."
	$Qfind ${current}/ -name '*.out' -print0 |xargs -0 rm -f
	$Qecho "Done."

.MAIN: all
