<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!-- Style fuer Ausgabe XSL:FO oder XSL:FO/PDF, Transformation mit fop -->
<!-- Version/Time-stamp: "2013-02-18 12:13:33 zimmel" -->
<!-- Dateiname: xml2pdf.xsl -->
 
<!-- Bsp.: java -jar build/fop.jar -c fop.conf -xml signaturenexport.xml -xsl xml2pdf.xsl -pdf signaturen-formatiert.pdf -->
<!-- Nicht-Standard-PDF/PS-Fonts (z.B. Garamond) werden in fop.conf angegebe und mit -c eingebunden -->
 
<xsl:strip-space elements="*"/>
 
<xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="0.5cm" margin-bottom="0.4cm" margin-left="1.5cm" margin-right="1.5cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body" font="18pt Garamond">
          <fo:block font-size="18pt" font-weight="bold">
            <fo:table table-layout="fixed" width="100%" border-collapse="separate">
              <fo:table-column column-width="2.6cm"/>
              <fo:table-column column-width="2.6cm"/>
	      <fo:table-column column-width="2.6cm"/>
	      <fo:table-column column-width="2.6cm"/>
	      <fo:table-column column-width="2.6cm"/>
	      <fo:table-column column-width="2.6cm"/>
              <fo:table-column column-width="2.6cm"/>
              <fo:table-body>
                <xsl:apply-templates select="printout"/>
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
 
</xsl:template>
 
 
<xsl:template match="printout">
 
 <xsl:for-each select="section-01/z13-call-no">
 
   <xsl:choose>
       <!-- nach 7 Aufrufen der jew. naechsten z13-call-no neue tr erzeugen und Zaehler zuruecksetzen -->
 
       <xsl:when test="position() mod 7 = 1">
 
         <!-- Seitenumbruch: nach 49 Signaturen (1 Seite) in der ersten Zeile auf neuer Seite tr hoehermachen -->
       <xsl:choose>
         <xsl:when test="position() mod 49 = 1">
          <fo:table-row height="4.09cm">
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <!-- Signaturen durch Substrings auseinandernehmen und neu zusammensetzen fuer den gewuenschten Zeilenumbruch -->
               <!-- 1. Zeile: beginnt mit Zeichen 1, ist 3 Zeichen lang (Systemstelle) -->
               <xsl:value-of select="substring(.,1,3)"/></fo:block><fo:block>
               <!-- 2. Zeile: beginnt mit Zeichen 5, ist 6 Zeichen lang (Unterstelle) -->
               <xsl:value-of select="translate(substring(.,5,6),':','')"/></fo:block><fo:block>
               <!-- 3. Zeile: beginnt nach dem Doppelpunkt, beliebig lang -->
               <xsl:value-of select="substring-after(.,':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[1],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[1],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[1],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[2],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[2],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[2],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[3],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[3],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[3],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[4],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[4],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[4],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[5],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[5],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[5],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[6],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[6],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[6],':')"/>
             </fo:block></fo:table-cell>
	 </fo:table-row>
 
         </xsl:when>
 
         <!-- hier folgen die restlichen Zeilen (nach dem Seitenumbruch -->
         <xsl:otherwise>
 
          <fo:table-row height="4.09cm">
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <!-- Signaturen durch Substrings auseinandernehmen und neu zusammensetzen fuer den gewuenschten Zeilenumbruch -->
               <!-- 1. Zeile: beginnt mit Zeichen 1, ist 3 Zeichen lang (Systemstelle) -->
               <xsl:value-of select="substring(.,1,3)"/></fo:block><fo:block>
               <!-- 2. Zeile: beginnt mit Zeichen 5, ist 6 Zeichen lang (Unterstelle) -->
               <xsl:value-of select="translate(substring(.,5,6),':','')"/></fo:block><fo:block>
               <!-- 3. Zeile: beginnt nach dem Doppelpunkt, beliebig lang -->
               <xsl:value-of select="substring-after(.,':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[1],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[1],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[1],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[2],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[2],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[2],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[3],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[3],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[3],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[4],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[4],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[4],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[5],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[5],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[5],':')"/>
             </fo:block></fo:table-cell>
             <fo:table-cell height="4.09cm" text-align="center" display-align="center"><fo:block>
               <xsl:value-of select="substring(following::z13-call-no[6],1,3)"/></fo:block><fo:block>
               <xsl:value-of select="translate(substring(following::z13-call-no[6],5,6),':','')"/></fo:block><fo:block>
               <xsl:value-of select="substring-after(following::z13-call-no[6],':')"/>
             </fo:block></fo:table-cell>
           </fo:table-row>
 
         </xsl:otherwise>
       </xsl:choose>
     </xsl:when>
 
    <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
 
 </xsl:for-each>
 
 
  </xsl:template>
 
 
</xsl:stylesheet>