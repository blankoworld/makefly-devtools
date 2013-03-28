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
name = "Test 001"
desc = "Minisch WITHOUT sidebar WITHOUT search WITHOUT comment WITHOUT identica"
test1: test1.rc
	$Q{ \
		MAKEOBJDIR=${main} pmake clean -f ${default_file} && MAKEOBJDIR=${main} conf="${current}/test1.rc" pmake -f ${default_file} > ${current}/test1.out && \
		diff -u test1.ok test1.out > test1.diff.out && \
		echo "-- ${name}: ${result_ok} ${desc}"|| \
		echo "-- ${name}: ${result_err} ${desc}" ; \
	}

all: test1

clean:
	$Qecho "Removing .out files..."
	$Qrm -f ${current}/*.out
	$Qecho "Done."
