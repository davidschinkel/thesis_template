
# Dies erzeugt eine Liste der unterorder und nimmt dann an, dass aus jedem ein gleichnamiges .pdf
# gemacht werden soll. $(TARGETS) ist dann also eine Liste der zu erzeugenden .pdf-Dateien.
TARGETS := $(addsuffix .pdf,$(basename $(subst /.,,$(wildcard */.))))

# Dies legt fest, dass standardmäßig alle diese PDF-Dateien erzeugt werden sollen.
# Weil keine Datei "all" angelegt wird, wird jedes PDF bei jedem Aufruf neu geprüft.
all: $(TARGETS)

# Besonderer Schalter, der dafür sorgt, dass Ziele die nur "zwischendrin" benötigt wurden, aber
# aber nicht explizit angefordert wurden, am Ende nicht wieder gelöscht werden.
# In diesem Falle die */plot.tex-Files.
.SECONDARY:

# Das Target clean hat die Aufgabe, alle erzeugten Dateien zu löschen, damit man nötigenfalls
# einen sauberen Start bekommt, wenn irgendwas klemmt. .PHONY bedeutet, dass das Target
# bei jedem Aufruf neu erzeugt wird
.PHONY: clean FORCE_MAKE
clean:
	for d in $(wildcard ./*.gptex); do $(MAKE) -C $$d -f ../GnuplotTex.mk clean; done
	rm -f $(wildcard ./*.pdf)

# Das %-Symbol in einer Regel ist ein Platzhalter, diese Regel erzeugt also %.pdf aus einem
# schon existierenden %/plot.tex
# Diese Kommandos stehen, wegen der "; \"-Zeilenenden quasi als ein Kettenbefehl hintereinander
# das ist nötig, damit der Ordnerwechsel auf alle Kommandos wirkt

# Dies ist für TIKZ und PGFPLOTS
%.pdf: %.pgfplots/plot.tex ../preamble.tex
	cd $*.pgfplots; \
	pdflatex plot.tex; \
	pdfcrop plot.pdf plot.pdf; \
	mv plot.pdf ../$*.pdf


# Dies ist für GnuPlot und Latex
%.gptex/plot.pdf: %.gptex/plot.plt FORCE_MAKE
	$(MAKE) -C $*.gptex -f ../GnuplotTex.mk plot.pdf

%.pdf: %.gptex/plot.pdf
	cp -l $< $@~
	mv $@~ $@
