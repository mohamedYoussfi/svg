<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="meteo/mesure[@date='2006-1-1']">
                    <h3>Date Mesure : <xsl:value-of select="@date"/></h3>
                    <table border="1" width="80%">
                        <tr>
                            <th>Nom</th><th>Température</th>
                        </tr>
                        <xsl:for-each select="ville">
                            <tr>
                                <td><xsl:value-of select="@nom"/></td>
                                <td><xsl:value-of select="@temperature"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td>Température Moyenne</td>
                            <td><xsl:value-of select="avg(ville/@temperature)"/></td>
                        </tr>
                    </table>
                    <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="800" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <line x1="10" y1="800" x2="800" y2="800" stroke="blue" stroke-width="2"></line>
                        <line x1="10" y1="10" x2="10" y2="800" stroke="blue" stroke-width="2"></line>  
                      
                        <xsl:for-each select="ville">
                            <xsl:variable name="index" select="position()"/>
                            <xsl:variable name="temp" select="@temperature"/>
                            <xsl:variable name="echelle" select="10"/>
                            <xsl:variable name="hauteur" select="$temp*$echelle"/>
                            <text font-size="18" stroke="black" x="{$index*90}" y="820">
                                <xsl:value-of select="@nom"/>
                            </text>
                            <rect  x="{$index*90}" y="{800-$hauteur}"
                                width="30" height="{$hauteur}"
                                fill="yellow" stroke="blue" stroke-width="1">
                                <animate attributeName="height" dur="1s" from="0" to="{$hauteur}"></animate>
                                <animate attributeName="y" dur="1s" from="800" to="{800-$hauteur}"></animate>
                            </rect>
                            <text font-size="18" stroke="black" x="{$index*90}" y="{800-($hauteur+10)}">
                                <xsl:value-of select="@temperature"/>
                               
                                <animate attributeName="y" dur="1s" from="800" to="{800-($hauteur+10)}"></animate>
                            </text>
                        </xsl:for-each>
                    </svg>
                </xsl:for-each>
                
            </body>
        </html>
       
    </xsl:template>
</xsl:stylesheet>