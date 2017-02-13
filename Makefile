TEX := platex
DVIPDFMX := dvipdfmx
EXTRACTBB := extractbb
BIB := pbibtex

MAIN := main
TEXS := $(wildcard *.tex)
STYS := $(wildcard *.sty)
FIGS := $(wildcard fig/*)

PDFS := $(wildcard fig/*pdf)
PNGS := $(wildcard fig/*png)
XBBS := $(patsubst %.pdf, %.xbb, $(PDFS)) $(patsubst %.png, %.xbb, $(PNGS))

FIGS := $(filter-out fig/*~, $(FIGS))

BBL  := $(MAIN).bbl

.PHONY: all clean

all: $(MAIN).pdf

%.xbb: %.pdf
	$(EXTRACTBB) $<

%.xbb: %.png
	$(EXTRACTBB) $<

%.aux: %.tex
	$(TEX) $(MAIN)

$(BBL): $(MAIN).aux thesis.bib jecon.bst
	$(BIB) $(MAIN)

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

$(MAIN).pdf: $(MAIN).dvi
	$(DVIPDFMX) $^

clean:
	rm -f $(MAIN).pdf $(MAIN).dvi *.aux $(MAIN).log $(MAIN).lot $(MAIN).lof $(MAIN).out $(MAIN).toc tex/*.aux *~ src/*~ tex/*~ $(XBBS) $(MAIN).bbl $(MAIN).blg
