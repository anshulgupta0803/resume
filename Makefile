FILE_PREFIX=AnshulGupta
LATEX=pdflatex
LATEX_ARGS=-synctex=1 -interaction=nonstopmode
BIBTEX=biber

all: $(FILE_PREFIX).pdf

$(FILE_PREFIX).pdf: $(FILE_PREFIX).tex altacv.cls page1sidebar.tex page2sidebar.tex
	$(LATEX) $(LATEX_ARGS) $(FILE_PREFIX).tex
	$(BIBTEX) $(FILE_PREFIX)
	$(LATEX) $(LATEX_ARGS) $(FILE_PREFIX).tex
	$(LATEX) $(LATEX_ARGS) $(FILE_PREFIX).tex

clean:
	$(RM) *aux *bbl *bcf *blg *log *out *xml *.synctex.gz

cleanall: clean
	$(RM) $(FILE_PREFIX).pdf
