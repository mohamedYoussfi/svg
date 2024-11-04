<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meteo1</title>
            </head>
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
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
