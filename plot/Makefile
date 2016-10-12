
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
.PHONY: clean
clean:
	rm -f $(TARGETS) $(wildcard *.gptex/plot.tex) $(wildcard *.gptex/*-inc.eps) $(wildcard *.gptex/*-inc-eps-converted-to.pdf) $(wildcard *.gptex/*.aux) $(wildcard *.gptex/*.log)
	rm -f $(wildcard *.sh/plot/*)

# Das %-Symbol in einer Regel ist ein Platzhalter, diese Regel erzeugt also %.pdf aus einem
# schon existierenden %/plot.tex
# Diese Kommandos stehen, wegen der "; \"-Zeilenenden quasi als ein Kettenbefehl hintereinander
# das ist nötig, damit der Ordnerwechsel auf alle Kommandos wirkt

#Dies ist für TIKZ und PGFPLOTS
%.pdf: %.pgfplots/plot.tex ../preamble.tex
	cd $*.pgfplots; \
	pdflatex plot.tex; \
	pdfcrop plot.pdf plot.pdf; \
	mv plot.pdf ../$*.pdf




