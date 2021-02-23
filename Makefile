SINGLE_PAGE=AnshulGupta
DOUBLE_PAGE=AnshulGupta-2page
LATEX=pdflatex
LATEX_ARGS=-synctex=1 -interaction=nonstopmode
BIBTEX=biber

all: $(SINGLE_PAGE).pdf $(DOUBLE_PAGE).pdf

$(SINGLE_PAGE).pdf: $(SINGLE_PAGE).tex altacv.cls page1sidebar-1page.tex
	$(LATEX) $(LATEX_ARGS) $(SINGLE_PAGE).tex
	$(BIBTEX) $(SINGLE_PAGE)
	$(LATEX) $(LATEX_ARGS) $(SINGLE_PAGE).tex
	$(LATEX) $(LATEX_ARGS) $(SINGLE_PAGE).tex

$(DOUBLE_PAGE).pdf: $(SINGLE_PAGE).tex altacv.cls page1sidebar-2page.tex page2sidebar-2page.tex
	$(LATEX) $(LATEX_ARGS) $(DOUBLE_PAGE).tex
	$(BIBTEX) $(DOUBLE_PAGE)
	$(LATEX) $(LATEX_ARGS) $(DOUBLE_PAGE).tex
	$(LATEX) $(LATEX_ARGS) $(DOUBLE_PAGE).tex

clean:
	$(RM) *aux *bbl *bcf *blg *log *out *xml *.synctex.gz

cleanall: clean
	$(RM) $(SINGLE_PAGE).pdf $(DOUBLE_PAGE).pdf
