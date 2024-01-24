TEX := uplatex
DVIPDFMX := dvipdfmx
BIB := upbibtex

MAIN := main
ABST := ISEE_abstract
AUTHOR_INFO := AuthorInfo
PRE := preamble
COVER := cover_page
COVER2 := cover_page_copy
TEXS := $(wildcard *.tex)
TEXS := $(filter-out $(COVER).tex $(COVER)2.tex $(ABST).tex, $(TEXS))

DIFF := latexdiff-vc -e utf-8 --git --flatten -t CFONT --force
DIFFREV := HEAD
DIFFMAIN := $(MAIN)-diff$(DIFFREV)

BUILD_DIR := build
BST := jecon.bst

STYS := $(wildcard *.sty)
FIGS := $(wildcard fig/*)

PDFS := $(wildcard fig/*pdf)
PNGS := $(wildcard fig/*png)

FIGS := $(filter-out fig/*~, $(FIGS))

BIBS := $(wildcard *bib)

BBL  := $(BUILD_DIR)/$(MAIN).bbl
DIFFBBL  := $(BUILD_DIR)/$(DIFFMAIN).bbl

CWD  := $(shell pwd)

.PHONY: all clean diff

all: $(MAIN).pdf $(ABST).pdf $(COVER).pdf $(COVER2).pdf

# Avoid automatic deletion of intermidate files
.PRECIOUS: $(BUILD_DIR)/%.dvi

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.aux: %.tex $(BUILD_DIR)
	$(TEX) -output-directory=$(BUILD_DIR) $(MAIN)

$(BBL): $(BUILD_DIR)/$(MAIN).aux $(BIBS) $(BST)
# pbibtex in Tex Live 2019 (macOS) uses the current working directory for search path,
# but that in TeX Live 2018 (Linux) doesn't. So cd and BIBINPUTS/BSTINPUTS are needed.
	cd $(BUILD_DIR);\
	BIBINPUTS='$(CWD):${BIBINPUTS}' BSTINPUTS='$(CWD):${BSTINPUTS}' $(BIB) -terse $(MAIN);\
	cd -

$(BUILD_DIR)/%.dvi: %.tex $(AUTHOR_INFO).tex $(PRE).tex $(STYS)
	$(TEX) -output-directory=$(BUILD_DIR) $<

$(BUILD_DIR)/$(MAIN).dvi: $(TEXS) $(STYS) $(FIGS) $(BBL)
	$(TEX) -output-directory=$(BUILD_DIR) $(MAIN)

	if egrep 'No file $(BUILD_DIR)/$(MAIN).toc.' $(BUILD_DIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(MAIN);\
	fi

	if egrep 'LaTeX Warning: There were undefined references.' $(BUILD_DIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(MAIN);\
	fi

	if egrep 'There were undefined citations.' $(BUILD_DIR)/$(MAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(MAIN);\
	fi

%.pdf: $(BUILD_DIR)/%.dvi
	$(DVIPDFMX) -o $@ $<

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(DIFFMAIN).pdf $(DIFFMAIN).tex
	rm -f *.pdf

# For latexdiff
diff: $(BUILD_DIR) $(DIFFMAIN).pdf

$(DIFFBBL): $(BUILD_DIR)/$(DIFFMAIN).aux $(BIBS) $(BST)
	cd $(BUILD_DIR);\
	BIBINPUTS='$(CWD):${BIBINPUTS}' BSTINPUTS='$(CWD):${BSTINPUTS}' $(BIB) -terse $(DIFFMAIN);\
	cd -

$(DIFFMAIN).tex: $(TEXS)
	$(DIFF) -r $(DIFFREV) $(MAIN).tex

$(BUILD_DIR)/$(DIFFMAIN).aux:
	$(TEX) -output-directory=$(BUILD_DIR) $(DIFFMAIN)

$(BUILD_DIR)/$(DIFFMAIN).dvi: $(DIFFMAIN).tex $(STYS) $(FIGS) $(DIFFBBL)
	$(TEX) -output-directory=$(BUILD_DIR) $(DIFFMAIN)

	if egrep 'No file $(BUILD_DIR)/$(DIFFMAIN).toc.' $(BUILD_DIR)/$(DIFFMAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(DIFFMAIN);\
	fi

	if egrep 'LaTeX Warning: There were undefined references.' $(BUILD_DIR)/$(DIFFMAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(DIFFMAIN);\
	fi

	if egrep 'There were undefined citations.' $(BUILD_DIR)/$(DIFFMAIN).log;\
	then\
		$(TEX) -output-directory=$(BUILD_DIR) $(DIFFMAIN);\
	fi
