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
out = ${current}/out

default_file = ${main}/Makefile
result_ok  = "[ ${bold}${green}OK${r_col}  ]"
result_err = "[ ${bold}${yellow}ER${r_col} ]"

#####
## BEGIN
###

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : NO
# identica: NO
test001_name = "Test 001"
test001_desc = "Minisch WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test001: test001.rc
	$Q{ \
		MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test001.rc" pmake -f ${default_file} > ${out}/test001.out && \
		diff -u test001.ok ${out}/test001.out > ${out}/test001.diff.out && \
		echo "-- ${test001_name}: ${result_ok} ${test001_desc}"|| \
		echo "-- ${test001_name}: ${result_err} ${test001_desc}" ; \
	}

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : YES
# identica: NO
test002_name = "Test 002"
test002_desc = "Minisch WITHOUT sidebar WITHOUT search USING comment WITHOUT identica"
test002: test002.rc
	$Q{ \
		MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test002.rc" pmake -f ${default_file} > ${out}/test002.out && \
		diff -u test002.ok ${out}/test002.out > ${out}/test002.diff.out && \
		echo "-- ${test002_name}: ${result_ok} ${test002_desc}"|| \
		echo "-- ${test002_name}: ${result_err} ${test002_desc}" ; \
	}

# THEME   : minisch
# sidebar : NO
# search  : NO
# comment : NO
# identica: YES
test003_name = "Test 003"
test003_desc = "Minisch WITHOUT sidebar WITHOUT search WITHOUT comment USING identica"
test003: test003.rc
	$Q{ \
		MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test003.rc" pmake -f ${default_file} > ${out}/test003.out && \
		diff -u test003.ok ${out}/test003.out > ${out}/test003.diff.out && \
		echo "-- ${test003_name}: ${result_ok} ${test003_desc}"|| \
		echo "-- ${test003_name}: ${result_err} ${test003_desc}" ; \
	}

all: test001 test002 test003

clean:
	$Qecho "Removing .out files..."
	$Qfind ${current}/ -name '*.out' -print0 |xargs -0 rm -f
	$Qecho "Done."

.MAIN: all
