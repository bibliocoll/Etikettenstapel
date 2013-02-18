Etikettenstapel
===============

Stapelweises Drucken von Etiketten (Aleph)

Dieses Beispiel druckt Signaturen in ein DIN-A4-Etikettenblatt (ekz-Vorlage) mit 7x7 Spalten
Formatierung der Signaturen ist angepasst für RDG01, entsprechend ändern (Signatur im Bsp. besteht aus Substrings wegen selbst gewähltem Zeilenumbruch)
Bei dieser Methode sind Seitenumbruch/Seitenrand/Kopfzeilen auch bei vielen Seiten unproblematisch (PDF statt HTML/CSS)
hier transformiert mit: Fop/Apache.

Voraussetzungen
===============
Apache FOP (http://xmlgraphics.apache.org/fop/)
evtl. muss fop.conf an lokales System angepasst werden, z.b. wo die Schriften sind (<directory>C:\WINDOWS\Fonts</directory>)

Howto 
=====
Service: Datensätze suchen CCL (ret-03), z.B. SIG=(POL*) oder p-ret-01 oder GUI Suche, Speichern (S.)
Service: Datensätze suchen/Datensätze sortieren (ret-21), z.B. 544##$$a
Service: Exemplare/Exemplaretiketten drucken (item-03), unten RDG01 angeben
Task-Manager, erzeugte Datei mit Druck-Konfiguration "XML-Ansicht im Browser" drucken, Quelle speichern als "signaturenexport.xml" in lokales Verzeichnis "SignaturenAlephExport"
Lokales Verzeichnis "SignaturenAlephExport": Drag&Drop von "signaturenexport.xml" nach "xml2pdf.cmd"
(= java -jar build\fop.jar -c fop.conf -xml signaturenexport.xml -xsl xml2pdf.xsl -pdf signaturen-formatiert.pdf)
oder Skript auf jede andere mögliche Weise ausführen, z.b. erzeugt folgendes cmd-Shellskript (Windows-Shell) aus jeder .xml-Datei im Verzeichnis ein PDF:
FOR %%I IN (*.xml) DO (
java -jar fop.jar -c fop.conf -xml %%I -xsl default.xsl -pdf %%~nI.pdf
)
(z.B. speichern als "xml2pdf.cmd")
