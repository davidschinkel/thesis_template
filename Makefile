
# Makefiles definieren Ziele, das sind i.d.R. Dateien die zu erzeugen sind.
# Ziele können von anderen Zielen abhängen, die zuerst zu erzeugen sind.
# Danach folgen noch kommandos, die das Ziel aus anderen Dateien Erzeugen.
# Die allgemeine Syntax ist:
# ein_ziel: anderes_ziel_als_vorraussetzung noch_ein_ziel_als_vorraussetzung...
# (tab)Kommandos zum erzeugen des Ziels, wenn die vorraussetzungen vorhanden sind
#
# dabei ist es wirklich wichtig, dass da ein (tab) ist, make funktioniert sonst nicht.
#
# Ruft man "make ein_ziel" auf, versucht make das ziel "ein_ziel" zu erzeugen.
# Es geht dabei davon aus, dass eine Datei "ein_ziel" zu erzeugen ist. Gibt es diese schon
# und ist neuer als ihre Vorraussetzungen, wird nichts getan!
# Das ist die Stärke von make: Es untersucht, was sich geändert hat, und erzeugt nur
# die betroffenen Dinge neu.

# Das erste ziel, was im Makefile festgelegt wird, ist das standardmäßige Ziel,
# was erzeugt wird, wenn make ohne Argument aufgerufen wird.

all: document.pdf

# Den Unterordner plot jedes mal bearbeiten, wenn er benötigt wird, in dem im Unterordner make aufgerufen wird
# Die Schreibweise $(MAKE) sorgt dafür, dass make spezielle Vorkehrungen für das rekursive
# Verwenden von make trifft und sollte in Makefiles immer so verwendet werden.
.PHONY: plot clean all FORCE_MAKE
clean:
	latexmk -C
	cd plot && $(MAKE) clean
	rm -f ./tmp/document.*

plot:
	cd plot && $(MAKE)

# %.pdf wird aus %.tex, indem latexmk aufgerufen wird. $< steht dabei dann für den
# Namens-Stamm der Datei. Der Unterordner wird dafür auch benötigt (was nach oberer Regel
# dazu führt, dass dort make aufgerufen wird. -shell-escape ist nötig, weil
# das Paket epstopdf dies braucht um automatisch eps in pdf umzuwandeln.
%.pdf: %.tex plot FORCE_MAKE
	latexmk -dvi- -pdf -jobname=tmp/document document.tex -pdflatex='pdflatex -synctex=1 -shell-escape' $<
	cp tmp/*.pdf .
	cp tmp/*.synctex.gz .
