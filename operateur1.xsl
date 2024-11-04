<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Opérateur 1</title>
            </head>
            <body>
                <xsl:for-each select="operateur/client">
                    <ul>
                        <li>Nom : <xsl:value-of select="@nom"/></li>
                    </ul>
                    <table border="1" width="90%">
                        <tr>
                            <th>Num</th><th>Date Ab</th><th>Type</th>
                            <th>Total Factures</th>
                            <th>Total Factures Non réglée</th>
                            <th>Nombre de Factures</th>
                        </tr>
                        <xsl:for-each select="abonnement">
                            <tr>
                                <td><xsl:value-of select="@numero"/></td>
                                <td><xsl:value-of select="@dateAb"/></td>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="sum(facture/@montant)"/></td>
                                <td><xsl:value-of select="sum(facture[@reglee='NON']/@montant)"/></td>
                                <td><xsl:value-of select="count(facture)"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="5">Nombre de factures</td>
                            <td><xsl:value-of select="count(abonnement/facture)"/></td>
                        </tr>
                        <tr>
                            <td colspan="5">Nombre des montants de factures</td>
                            <td><xsl:value-of select="sum(abonnement/facture/@montant)"/></td>
                        </tr>
                        <tr>
                            <td colspan="5">Moyenne montant de facture</td>
                            <td><xsl:value-of select="sum(abonnement/facture/@montant) div count(abonnement/facture)"/></td>
                        </tr>
                        <tr>
                            <td colspan="5">Moyenne montant de facture</td>
                            <td><xsl:value-of select="avg(abonnement/facture/@montant)"/></td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>