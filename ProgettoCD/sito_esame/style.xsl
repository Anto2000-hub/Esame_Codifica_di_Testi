<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output  method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Progetto Codifica Testi</title>                
            <!-- riferimento ai file css -->
            <link rel="stylesheet" type="text/css" href="stile.css"/>
            <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet"/>
            <link href="https://fonts.googleapis.com/css?family=Sarabun" rel="stylesheet"/>                         
        </head>
        <body>
            <footer>
                <nav class="navMenu">
                    <ul> 
                        <li><a href="#cart2">Cartolina 168</a></li>
                        <li><a href="#cart1">Cartolina 93</a></li>
                    </ul>
                </nav>
            </footer>
            <!-- div contenitore -->
            <xsl:element name="div">
                <xsl:apply-templates/>
            </xsl:element> 
        </body>
    </html>
</xsl:template>
    
    <!-- tei Header-->
    <xsl:template match="tei:teiCorpus/tei:teiHeader">
            <xsl:apply-templates/>
    </xsl:template>

    <!-- div intestazione che comprende titolo e nota iniziale -->
    <xsl:template match="tei:titleStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="id">intestazione</xsl:attribute>
            <xsl:element name="h1"> 
                <xsl:value-of select="tei:title"/>
            </xsl:element>
            <xsl:element name="p"> 
                <xsl:attribute name="class">nota</xsl:attribute> 
                <xsl:value-of select="//tei:projectDesc"/>
                <xsl:element name="a">
                    <xsl:attribute name="href">https://github.com/Angelodel80</xsl:attribute>
                    <xsl:text>Github.</xsl:text>
                </xsl:element>    
                <xsl:element name="br"/>
                <xsl:value-of select="//tei:note[@n='1']"/>
                <xsl:element name="br"/>
                    <xsl:text>Editor utilizzato: </xsl:text>
                    <xsl:value-of select="//tei:appInfo"/>.
            </xsl:element>  
        </xsl:element>         
    </xsl:template>
    
    <!-- INFORMAZIONI COMUNI -->
    <!-- edizione -->
    <xsl:template match="tei:editionStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="class">infosing</xsl:attribute>
            <xsl:element name="h4"> 
                <xsl:attribute name="class">singoli</xsl:attribute>    
                <xsl:text>EDIZIONE: </xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="*">
                    <xsl:element name="li">
                       <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- pubblicazione -->
    <xsl:template match="tei:publicationStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="class">infosing</xsl:attribute>
            <xsl:element name="h4"> 
                <xsl:attribute name="class">singoli</xsl:attribute>    
                <xsl:text>PUBBLICAZIONE: </xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="*">
                    <xsl:element name="li">
                       <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each> 
            </xsl:element>   
            
        </xsl:element>
    </xsl:template>

    <!-- collocazione, descrizione, personaggi e luoghi -->
    <xsl:template match="tei:sourceDesc">
        <xsl:element name="div">
            <xsl:attribute name="class">infosing </xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">singoli</xsl:attribute>
                <xsl:text>COLLOCAZIONE:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="tei:msDesc//tei:msIdentifier/*">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:apply-templates select="//tei:respStmt[@xml:id='ente']/tei:resp"/>
                    </xsl:element>
                   <xsl:value-of select="//tei:respStmt[@xml:id='ente']/tei:name"/>  
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">infosing </xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">singoli</xsl:attribute>
                <xsl:text>DESCRIZIONE:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="//tei:msContents/* | //tei:condition">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/> 
                    </xsl:element>
                </xsl:for-each>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Dimensioni: </xsl:text>
                    </xsl:element>
                    <xsl:number value="9"/>
                    <xsl:text>x</xsl:text>
                    <xsl:number value="14"/> 
                    <xsl:text>cm</xsl:text>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Quantità cartoline codificate: </xsl:text>
                    </xsl:element>
                    <xsl:number value="2"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">infosing </xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">singoli</xsl:attribute>
                <xsl:text>PERSONAGGI E LUOGHI:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="//tei:person/* | //tei:place/tei:placeName">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Contenitore singole cartoline -->
    <xsl:template match="//tei:TEI">
        <xsl:element name="div"> 
            <xsl:attribute name="id">
                <xsl:value-of select="concat('cart', '')"/>
                <xsl:number level="any"/> 
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- titolo cartolina e nota introduttiva -->
    <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc">
        <xsl:element name="h2">
            <xsl:value-of select="tei:sourceDesc//tei:title"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="class">nota</xsl:attribute>
                <xsl:value-of select="tei:notesStmt"/>
                <xsl:text> Codice identificativo: </xsl:text>
                <xsl:value-of select="//tei:idno"/><xsl:text>.</xsl:text>
        </xsl:element>
    </xsl:template>

    <!-- visualizzazione delle immagini mappate-->
    <xsl:template match="//tei:facsimile/tei:surface">
        <xsl:element name="div">
            <xsl:attribute name="class">contimg</xsl:attribute>
            <xsl:element name="div">
                 <xsl:attribute name="class">img</xsl:attribute>
                <xsl:element name="img">    
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute> 
                <xsl:apply-templates/>        
            </xsl:element>
         </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Fronte cartoline -->
    <xsl:template match="tei:figure">
        <xsl:element name="div">
            <xsl:attribute name="class">fronte</xsl:attribute>
            <xsl:element name="b">
            <xsl:text>FRONTE: </xsl:text> 
            </xsl:element>   
            <xsl:value-of select="tei:figDesc"/>
        </xsl:element>
    </xsl:template>

    <!-- Retro cartoline -->
    <xsl:template match="//tei:div[@type='retro']">
         <xsl:element name="div">
            <xsl:attribute name="class">retro</xsl:attribute>
            <xsl:element name="b">
            <xsl:text>RETRO: </xsl:text> 
            </xsl:element>   
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 

    <!-- template indirizzo e linee di divisione -->
    <xsl:template match="//tei:div[@type='destination']/tei:p[@style='indirizzo']">
        <xsl:apply-templates/>
        <xsl:element name="div">
            <xsl:attribute name="id">hr</xsl:attribute>
            <xsl:element name="hr"/>
            <xsl:element name="hr"/>
        </xsl:element>
    </xsl:template>

    <!-- numero laterale cartolina -->
    <xsl:template match="tei:num[@n='1']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- francobollo cartoline -->
    <xsl:template match="tei:stamp[@n='1']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:attribute name="class">francobolli</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Collegamenti testo-immagine -->
    <xsl:template match="tei:s">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:attribute name="class">contenuto</xsl:attribute>  
            <xsl:apply-templates/>
        </xsl:element>        
    </xsl:template>
    
    <!-- indirizzo destinatario -->
    <xsl:template match="tei:addrLine ">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
    <!-- data e firma -->
    <xsl:template match="tei:dateline | tei:signed">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')"/>
            </xsl:attribute>
            <xsl:attribute name="class">contenuto_dx</xsl:attribute>  
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- contenuto cartolina -->
    <xsl:template match="tei:div[@type = 'retro']/tei:div[@type = 'message']">
        <xsl:element name="div">
            <xsl:attribute name="class">testo_cartolina</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>            
    </xsl:template>
    
    <!-- Parole in grassetto -->
    <xsl:template match="tei:gi">
            <b>
                <xsl:apply-templates/>
            </b>
    </xsl:template>

    <xsl:template match="tei:respStmt">
        <b>
            <xsl:value-of select="tei:resp"/>
        </b>
        <xsl:apply-templates select="tei:name"/>
    </xsl:template>

    <!-- TUTTI I BLOCCHI RESI INVISIBILI -->
    <!-- info cartolina successiva/note/francobollo e timbro/espansione abbreviazioni -->
    <xsl:template match="//tei:profileDesc | tei:note[@n='1'] | tei:expan | tei:am | tei:encodingDesc | tei:stamp[@n='2']">
        <xsl:element name="p">
            <xsl:attribute name="class">invisibile</xsl:attribute>
             <xsl:apply-templates/>
        </xsl:element> 
    </xsl:template>
   
</xsl:stylesheet>        