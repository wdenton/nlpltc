# A short Makefile to automate building of PDFs with nlpltc
#
# `make` builds PDFs from all CSV files in the directory.
# `make foo.pdf` builds foo.pdf from foo.csv in the directory
# `make clean` removes all PDFs, .tex files, .log files, .aux files in the
# directory


# This bit just finds all CSV files in the current directory and tries to
# build PDFs from all of them, making just `make` useful.
all: $(shell find . -maxdepth 1 -name "*.csv" | sed s/.csv/.pdf/g)

%.tex : %.csv
	./nlpltc $< > $@

%.pdf : %.tex
	pdflatex $<

clean:
	rm -f *.pdf
	rm -f *.tex
	rm -f *.log
	rm -f *.aux
