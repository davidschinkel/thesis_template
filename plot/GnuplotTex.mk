
all: plot.pdf

.SECONDARY:

.PHONY: clean
clean:
	rm -f plot.pdf data.sh.run contours.plt.run plot.tex $(wildcard *-inc.eps) $(wildcard *-inc-eps-converted-to.pdf) $(wildcard *.aux) $(wildcard *.log) gnuplot.cfg $(wildcard *.fdb_latexmk) $(wildcard *.fls)

%.pdf: %.tex
	latexmk -dvi- -pdf -pdflatex='pdflatex -shell-escape -interaction=nonstopmode' $<


DATARUN=$(addsuffix .run,$(wildcard data.sh))

plot.tex: plot.plt gnuplot.cfg ../default.plt $(DATARUN) $(addsuffix .run,$(wildcard contours.plt))
	gnuplot $<

gnuplot.cfg: ../gnuplot.cfg
	ln -s $<

contours.plt.run: contours.plt $(DATARUN) $(wildcard contours.cfg)
	gnuplot $<
	touch $@

data.sh.run: data.sh
	./$<
	touch $@
