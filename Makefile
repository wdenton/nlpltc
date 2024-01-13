# A short Makefile to automate building of PDFs with nlpltc

alc:
	nlpltc -i catalogues/alc/librarything_artsandlettersclub.json -t catalogues/alc/alc.tex.erb -o catalogues/alc/alc-catalogue.tex
	pdflatex -output-directory catalogues/alc alc-catalogue.tex

test:
	nlpltc -i catalogues/test/test-export.json -t catalogues/test/test.tex.erb -o catalogues/test/test-catalogue.tex
	pdflatex -output-directory catalogues/test test-catalogue.tex

# clean:
# 	rm -f catalogues/*/*.{aux,log}
