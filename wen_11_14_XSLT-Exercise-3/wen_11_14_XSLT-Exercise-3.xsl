<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="wen_11_14_XSLT-Exercise-3.css"/>
                
                <title><xsl:apply-templates select="//cover/title"/></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//cover/title"/></h1>
                <h2><xsl:apply-templates select="//cover/attribution"/></h2>
                <h3><xsl:apply-templates select="//cover/subtitle"/></h3>
                
                <div class="paraBody">
                    <xsl:apply-templates select="//body"/>
                </div>
            </body> 
            
        </html>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <span class="event">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="QuestItem">
        <span class="item"> 
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="character">
        <span class="chara">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="epithet">
        <span class="epit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="faction">
        <span class="facti">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="location">
        <span class="loca">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>