Dies ist eine Vorlage um ein komplexes Dokument in LaTex zu erstellen.
Das Dokument wird durch das Ausführen von make im Hauptverzeichnis erstellt.

Konzeptionell ist folgende Arbeitsweise angedacht:

- Einzelne Abschnitte werden als eigene .tex-Dateien im Hauptverzeichnis 
gespeichert und mittels include in die document.tex eingebunden. 
- Jedes Bild bekommt im Ordner plot einen eigenen Ordner mit dem Namensschema
name.typ, dabei ist "name" eine frei zu wählende Bezeichnung und "typ" ein
Bezeichner für die Sprache/Methode in welcher das Bild erzeugt werden soll, dies
kann z.B. pgfplots, gnuplot, python, ... sein.
- In den Ordnern liegen die Rohdaten um das Bild zu erzeugen (und ggf. auch 
Konfigurationsdateien um die Rohdaten erzeugen zu können) und ein Skript welches
aus den Rohdaten ein pdf erstellt. 

Wird das Makefile im Hauptverzeichnis aufgerufen, ruft dieses das Makefile im
plot-Ordner auf. Dieses Makefile scannt alle Ordner und ruft entsprechend des 
Typ (in name.typ) mit den korrekten Befehlen das Skript zum erzeugen des Bildes
als pdf auf. Dann wird es als name.pdf in den plot Ordner kopiert.

In diesem Beispiel sind Befehle für TIKZ/PGFPLOTS als Typ "pgfplots" eingebaut,
für weitere Typen muss das makefile entsprechend erweitert werden.