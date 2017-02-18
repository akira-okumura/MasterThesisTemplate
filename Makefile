TEX := uplatex
DVIPDFMX := dvipdfmx
EXTRACTBB := extractbb
BIB := pbibtex

MAIN := main
COVER := cover_page
TEXS := $(wildcard *.tex)
TEXS := $(filter-out $(COVER).tex, $(TEXS))

STYS := $(wildcard *.sty)
FIGS := $(wildcard fig/*)

PDFS := $(wildcard fig/*pdf)
PNGS := $(wildcard fig/*png)
XBBS := $(patsubst %.pdf, %.xbb, $(PDFS)) $(patsubst %.png, %.xbb, $(PNGS))

FIGS := $(filter-out fig/*~, $(FIGS))

BBL  := $(MAIN).bbl

.PHONY: all clean

all: $(MAIN).pdf $(COVER).pdf

%.xbb: %.pdf
	$(EXTRACTBB) $<

%.xbb: %.png
	$(EXTRACTBB) $<

%.aux: %.tex
	$(TEX) $(MAIN)

$(BBL): $(MAIN).aux thesis.bib jecon.bst
	$(BIB) $(MAIN)

$(COVER).dvi: $(COVER).tex AuthorInfo.tex $(STYS)
	$(TEX)	$(COVER)

$(MAIN).dvi: $(TEXS) $(STYS) $(FIGS) $(SRCS) $(XBBS) $(BBL)
	$(TEX)	$(MAIN)

	if egrep 'No file $(MAIN).toc.' $(MAIN).log;\
	then\
		$(TEX)	$(MAIN);\
	fi

	if egrep 'LaTeX Warning: There were undefined references.' $(MAIN).log;\
	then\
		$(TEX) $(MAIN);\
	fi

$(COVER).pdf: $(COVER).dvi
	$(DVIPDFMX) $^

$(MAIN).pdf: $(MAIN).dvi
	$(DVIPDFMX) $^

clean:
	rm -f *.pdf *.dvi *.aux *.log *.lot *.lof *.out *.toc tex/*.aux *~ src/*~ tex/*~ $(XBBS) *.bbl *.blg
