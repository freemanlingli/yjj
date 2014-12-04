<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:import href="../../../../docbook-xsl-1.78.1/html/docbook.xsl" />
	<xsl:param name="html.stylesheet" select="'media/css/style1.css'" />
	
	<xsl:output method="html" encoding="UTF-8" indent="yes" />  <!--indent: fo中就是带缩进的了，格式就很清晰了，就容易找错误位置，方便调试错误了 -->
	<!-- Use nice graphics for admonitions -->
	<xsl:param name="admon.graphics">1</xsl:param>
	<xsl:param name="admon.graphics.path">images/admons/</xsl:param>
	<!-- 是否section有数字编号  -->
	<xsl:param name="section.autolabel" select="0"/>
	<xsl:param name="l10n.gentext.language" select="'zh_CN'"/>
	<!-- 目录级别 -->
    <xsl:param name="toc.section.depth" select="2"/>
	
    <!-- 标题摆放位置-->
	<xsl:param name="formal.title.placement">
		figure after
		example after
		equation before
		table after
		procedure before
		task before
	</xsl:param>
   <!--只在有必要生成目录的地方生成TOCS,章节里面没有目录 但是连
   图片和表格目录也没有  Generate the TOCs for named components only 
    <xsl:param name="generate.toc">
        book toc,title,figure,table,example,equation
        appendix  toc,title,figure,table,example,equation
    </xsl:param>	
    -->
  <!-- 
  <xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>  
 -->
 <!--###################################################
                        Callouts
   ################################################### -->

    <!-- Use images for callouts instead of (1) (2) (3) -->
    <xsl:param name="callout.graphics">1</xsl:param>

    <!-- Place callout marks at this column in annotated areas -->
    <xsl:param name="callout.defaultcolumn">90</xsl:param>
   
   
    <xsl:template match="author" mode="titlepage.mode">
        <xsl:if test="name(preceding-sibling::*[1]) = 'author'">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <span class="{name(.)}">
            <xsl:call-template name="person.name"/> 
            <br></br><xsl:value-of select="affiliation"/>
            <xsl:apply-templates mode="titlepage.mode" select="./contrib"/>
        </span>
    </xsl:template>
    
    <xsl:template match="authorgroup" mode="titlepage.mode">
        <div class="{name(.)}">
            <!-- 
            <p>资料整理：www.trainyjj.com  老凌</p>
            <p/> -->
            <xsl:apply-templates mode="titlepage.mode"/>
        </div>
    </xsl:template>	
		
	<xsl:param name="body.font.size">12pt</xsl:param>  <!--设置内容字体大小12pt-->
	<xsl:param name="paper.type" select="'A4'"/>   <!--纸张大小A4-->
	<xsl:param name="draft.mode" select="'no'"/>
	<xsl:param name="body.start.indent">0pt</xsl:param> <!--正文不缩进-->
	<xsl:param name="line-height">1.5em</xsl:param> <!--行高1.5倍-->
	<xsl:param name="bibliography.numbered" select="1" /> <!--参考资料加编号-->
	<xsl:param name="alignment">left</xsl:param> <!--默认左对齐-->
	<xsl:attribute-set name="toc.line.properties">  <!--设置目录中的字体大小9pt-->
	  <xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>
	
 

	<xsl:attribute-set name="normal.para.spacing"> <!--段首缩进--> 
	  <xsl:attribute name="text-indent">12em</xsl:attribute> 
	</xsl:attribute-set>

</xsl:stylesheet>
