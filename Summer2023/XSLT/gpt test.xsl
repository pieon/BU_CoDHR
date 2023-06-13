<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:jc="http://james.blushingbunny.net/ns.html" exclude-result-prefixes="xs xd tei jc"
    version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <!-- xsl:output here outputing text since we're producing CSV -->
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!--Match Root Node -->
    <xsl:template match="/">
        <xsl:text>"elementName", "elementContent", "typeAttributeIfPresent"&#xA;</xsl:text>
        <xsl:for-each select="//persName | //placeName | //geogFeat">
            <xsl:sort select="name()"/>
            <xsl:sort select="."/>
            <xsl:sort select="@type"/>
            <xsl:variable name="elementName" select="name()"/>
            <xsl:variable name="elementContent" select="."/>
            <xsl:variable name="typeAttributeIfPresent" select="@type"/>
            <xsl:value-of select="concat('&quot;', $elementName, '&quot;, &quot;', $elementContent, '&quot;, &quot;', $typeAttributeIfPresent, '&quot;&#xA;')"/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>