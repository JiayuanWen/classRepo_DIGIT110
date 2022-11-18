<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml"
        html-version="5" 
        omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    <xsl:variable name="travelColl" 
        as="document-node()+" 
        select="collection('xml-letters/?select=*.xml')"/>
    <xsl:variable name="count"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Behrend Travel Letters</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <!--ebb: The line above helps your HTML scale to fit lots of different devices. -->
                <link rel="stylesheet" type="text/css" href="wen_11_18_XSLT-Exercise-5.css"/>
                
            </head>
            <body>
                <img alt="Penn State logo" width="170" src="images/psu-mark.svg"/>
                <h1>The Behrends' Travel Adventures in Europe</h1>
                <section id="toc">
                    <h2>Contents</h2>
                    
                    <!-- ebb: Let's set up the HTML table here. -->
                    <table> 
                        <tr>
                            <th>Letter Date and opening</th><!--first column table heading-->
                            <th>Places Mentioned</th><!--third column table heading-->
                            <th>People Mentioned</th><!--second column table heading-->
                            
                        </tr>
                        <xsl:apply-templates select="$travelColl//letter" mode="toc">
                            <xsl:sort select="//date/@when"/>
                        </xsl:apply-templates>
                        
                    </table>
                </section>
                
                <section id="fulltext">
                    <xsl:apply-templates select="$travelColl//letter">
                        <xsl:sort select="//date/@when"/>
                    </xsl:apply-templates>
                    
                </section>
            </body>
        </html>
    </xsl:template>
   
    <xsl:template match="letter" mode="toc">
        <tr>
            <th class="table-colume-date-letter"><!--ebb: Here we use our $travelColl variable pointing into the collection AND use modal XSLT set the toc mode for Table of Contents: -->
                <a href="#{//letter/@xml:id}">
                    <xsl:apply-templates select="//date/@when => string-join(', ')" mode="toc"/><a>: </a>
                    <xsl:apply-templates select="//p[1] ! substring(.,1,50)" mode="toc"/><a>...</a>
                </a>
            </th>
            <th class="table-colume-place">
                <xsl:apply-templates select="//placeName => distinct-values() => sort() => string-join(', ')" mode="toc"/>
            </th>
            <th class="table-colume-person">
                <xsl:apply-templates select="//persName => distinct-values() => sort() => string-join(', ')" mode="toc"/>
            </th>
            
        </tr>         
    </xsl:template>
    
    <xsl:template match="letter">
        <div class="letter" id="{//letter/@xml:id}">
            <h3><xsl:apply-templates select="//date"/></h3>
            <br/>
             <xsl:apply-templates select="//p"/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>