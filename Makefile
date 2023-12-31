.PHONY: all, clean

all: forwards-and-backwards.pdf submission-version.pdf cover-letter.pdf review-responses.pdf 

forwards-and-backwards.pdf : refs.bib review-responses.tex

submission-version.pdf : forwards-and-backwards.pdf
	pdfjam --outfile $@ $< 1-83

cover-letter.pdf : forwards-and-backwards.pdf
	pdfjam --outfile $@ $< 84

review-responses.pdf : forwards-and-backwards.pdf
	pdfjam --outfile $@ $< 85-

clean: 
	-rm *.aux *.log *.bbl *.blg

diff-to-submission.pdf : forwards-and-backwards-diff55fcac38e3f62d98542a20fd49380eb980927714.pdf
	cp $< $@

forwards-and-backwards-diff%.tex : forwards-and-backwards.tex refs.bib review-responses.tex
	latexdiff-git -r $* --force forwards-and-backwards.tex

%.pdf : %.tex %.bbl
	while ( pdflatex -interaction nonstopmode -shell-escape $<;  grep -q "Rerun to get" $*.log ) do true ; done
	touch $*.bbl
	touch $@

%.aux : %.tex
	-pdflatex -interaction nonstopmode -shell-escape $<

%.bbl : %.aux refs.bib
	bibtex $<

%.png : %.pdf
	convert -density 300 $< -flatten $@

%.pdf : %.svg
	inkscape $< --export-area-drawing --export-filename=$@
	# chromium --headless --no-pdf-header-footer --print-to-pdf=$@ $<
	# ./svg2pdf.sh $< $@

%.pdf : %.eps
	# inkscape $< --export-filename=$@
	epspdf $<

%.pdf : %.ink.svg
	inkscape $< --export-filename=$@

