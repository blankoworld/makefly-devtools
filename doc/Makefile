Q = @

DOCDIR = ${.CURDIR}
PAGE_EXT = .html
DOCFILES := ${DOCDIR}/*.md
DOCFILESRESULT != echo ${DOCFILES}
markdown ?= markdown

# Create documentation
.for FILE in ${DOCFILESRESULT}

${FILE:S/.md$/${PAGE_EXT}/}:
	$Q{                                                    \
		${markdown} ${FILE} > ${FILE:S/.md$/${PAGE_EXT}/} || \
		{                                                    \
			echo "-- Could not build doc file: $@" ;        \
		} ;                                                  \
	} && echo "-- Doc file built: $@"

.endfor

doc: ${DOCFILESRESULT:S/.md$/${PAGE_EXT}/}

clean:
	$Qrm -f ${DOCDIR}/*${PAGE_EXT}

.MAIN: doc
