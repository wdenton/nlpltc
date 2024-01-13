# A short Makefile to automate building of PDFs with nlpltc

alc:
	nlpltc -i catalogues/alc/librarything_artsandlettersclub.json -t catalogues/alc/alc.tex.erb -o catalogues/alc/alc-catalogue.tex
	pdflatex -output-directory catalogues/alc alc-catalogue.tex

test:
	nlpltc -i catalogues/test/test-export.json -t catalogues/test/test.tex.erb -o catalogues/test/test-catalogue.tex
	pdflatex -output-directory catalogues/test test-catalogue.tex

# `make` builds PDFs from all CSV files in the directory.
# `make foo.pdf` builds foo.pdf from foo.csv in the directory
# `make clean` removes all PDFs, .tex files, .log files, .aux files in the
# directory

# This bit just finds all CSV files in the current directory and tries to
# build PDFs from all of them, making just `make` useful.

# all: $(shell find . -maxdepth 1 -name "*.csv" | sed s/.csv/.pdf/g)

# fetch:
# 	curl -L --cookie "cookie_userid=COOKIE; cookie_usernum=COOKIE; cookie_userchecksum=COOKIE; PHPSESSID=COOKIE" -o lt.csv https://www.librarything.com/export-csv

# %.tex : %.csv
# 	./nlpltc $< > $@

# %.pdf : %.tex
# 	pdflatex $<

# clean:
# 	rm -f *.pdf
# 	rm -f *.tex
# 	rm -f *.log
# 	rm -f *.aux
