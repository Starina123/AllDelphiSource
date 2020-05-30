<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="Recipe">
	<HTML>
	<HEAD>
	<TITLE>
	<xsl:value-of select="Name"/>
	</TITLE>
	</HEAD>
	<BODY>
	<H3>
	<xsl:value-of select="Name"/>
	</H3>
	<U>
	<xsl:value-of select="Description"/>
	</U>
	<xsl:apply-templates/>
	</BODY>
	</HTML>
</xsl:template>

<!-- Format ingredients -->
<xsl:template match="Ingredients">
	<H4>Ingredients</H4>
	<TABLE BORDER="1">
	<TR BGCOLOR="#308030"><TH>Qty</TH><TH>Units</TH><TH>Item</TH></TR>
	<xsl:for-each select="Ingredient">
	<TR>

	<!-- handle empty Qty elements separately -->
	<xsl:if test='Qty[not(.="")]' > 
		<TD><xsl:value-of select="Qty"/></TD>
	</xsl:if>
	
	<xsl:if test='Qty[.=""]' > 
		<TD BGCOLOR="#404040"> </TD>
	</xsl:if>
	
	<TD><xsl:value-of select="Qty/@unit"/></TD>
	<TD><xsl:value-of select="Item"/>
	<xsl:if test="Item[@optional='1']">
	   <SPAN> <em><u>optional</u></em></SPAN>
	</xsl:if>
	</TD>
	</TR>
	</xsl:for-each>

	</TABLE>
</xsl:template>

<!-- Format instructions -->
<xsl:template match="Instructions">
	<H4>Instructions</H4>
	<OL>
	<xsl:apply-templates select="Step"/>
	</OL>
</xsl:template>

<xsl:template match="Step">
<LI><xsl:value-of select="."/></LI>
</xsl:template>

</xsl:stylesheet>

