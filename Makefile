TEX := uplatex
DVIPDFMX := dvipdfmx
BIB := pbibtex
EXTRACTBB := extractbb

MAIN := main
ABST := ISEE_abstract
PRE := preamble
COVER := cover_page
COVER2 := cover_page_copy
TEXS := $(wildcard *.tex)
TEXS := $(filter-out $(COVER).tex $(COVER)2.tex $(ABST).tex, $(TEXS))

TEMPDIR := tmpMake
STYLEFILE := jecon.bst

STYS := $(wildcard *.sty)
FIGS := $(wildcard fig/*)

PDFS := $(wildcard fig/*pdf)
PNGS := $(wildcard fig/*png)

FIGS := $(filter-out fig/*~, $(FIGS))

BIBS := $(wildcard *bib)

BBL  := $(MAIN).bbl

.PHONY: all clean

all: $(MAIN).pdf $(ABST).pdf $(COVER).pdf $(COVER2).pdf

%.aux: %.tex
	mkdir -p $(TEMPDIR)
	$(TEX) -output-directory=$(TEMPDIR) $(MAIN)

$(BBL): $(MAIN).aux thesis.bib jecon.bst
	cp -u $(BIBS) ./$(TEMPDIR)
	$(TEX) -output-directory=$(TEMPDIR) $(MAIN)

$(ABST).dvi: $(ABST).tex AuthorInfo.tex $(STYS) $(PRE).tex
	$(TEX) -output-directory=$(TEMPDIR) $(ABST)

$(COVER).dvi: $(COVER).tex AuthorInfo.tex $(STYS) $(PRE).tex
	$(TEX) -output-directory=$(TEMPDIR) $(COVER)

$(COVER2).dvi: $(COVER2).tex AuthorInfo.tex $(STYS) $(PRE).tex
	$(TEX) -output-directory=$(TEMPDIR) $(COVER2)

$(MAIN).dvi: $(TEXS) $(STYS) $(FIGS) $(BBL)
	mkdir -p $(TEMPDIR)
	$(TEX) -output-directory=$(TEMPDIR) $(MAIN);
	cp -u $(STYLEFILE) ./$(TEMPDIR)
	(cd $(TEMPDIR); $(BIB) -terse $(MAIN);)

	if egrep 'No file $(TEMPDIR)/$(MAIN).toc.' $(TEMPDIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(TEMPDIR) $(MAIN);\
	fi

	if egrep 'LaTeX Warning: There were undefined references.' $(TEMPDIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(TEMPDIR) $(MAIN);\
	fi

	if egrep 'There were undefined citations.' $(TEMPDIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(TEMPDIR) $(MAIN);\
	fi

%.xbb: %.png
	$(EXTRACTBB) $<

%.xbb: %.pdf
	$(EXTRACTBB) $<

$(ABST).pdf: $(ABST).dvi
	$(DVIPDFMX) -o $@ ./$(TEMPDIR)/$^

$(COVER).pdf: $(COVER).dvi
	$(DVIPDFMX) -o $@ ./$(TEMPDIR)/$^

$(COVER2).pdf: $(COVER2).dvi
	$(DVIPDFMX) -o $@ ./$(TEMPDIR)/$^

$(MAIN).pdf: $(MAIN).dvi
	$(DVIPDFMX) -o $@ ./$(TEMPDIR)/$^

clean:
	rm -rf $(TEMPDIR)
	rm -f *.pdf *.dvi *.aux *.log *.lot *.lof *.out *.toc tex/*.aux *~ src/*~ tex/*~ *.bbl *.blg
