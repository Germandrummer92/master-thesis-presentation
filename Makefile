## Encoding: ISO8859-1 ##

MASTER = IKS_vorlage_beamer
ZIPNAME = IKS-Praesentation-LaTeX-Beamer.zip
.PHONY: clean

pdf: *.tex *.bib
	pdflatex $(MASTER).tex
	bibtex $(MASTER)
	pdflatex $(MASTER).tex
	pdflatex $(MASTER).tex

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.toc
	rm -f *.bbl
	rm -f *.blg
	rm -f *.zip
	rm -f *~

zip: clean
	zip $(ZIPNAME) *
	zip $(ZIPNAME) logos/*
	zip $(ZIPNAME) bilder/*

bundle: pdf clean zip

