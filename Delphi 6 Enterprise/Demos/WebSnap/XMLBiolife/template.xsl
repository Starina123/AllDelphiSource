<?xml version="1.0"?>

<xsl:transform
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">

<xsl:template match="/">
  <html>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="XMLBuilder">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="Warnings">
  <table border="1" width="90%">
    <td>
      <h2>Design-time warnings</h2>
      <ul>
        <xsl:for-each select="Warning">
          <li>
            <xsl:value-of select="@Message"/>
          </li>
        </xsl:for-each>
      </ul>
    </td>
  </table>
</xsl:template>

<xsl:template match="Form/Errors">
  <xsl:if test="count(Error) > 0">
    <table border="1" width="90%">
      <td>
        <h2>Errors</h2>
        <ul>
          <xsl:for-each select="Error">
            <li>
              <xsl:value-of select="@Message"/>
            </li>
          </xsl:for-each>
        </ul>
      </td>
    </table>
  </xsl:if>
</xsl:template>

<xsl:template name="MakeHeading">
  <xsl:param name="ApplicationTitle"/>
  <xsl:param name="PageTitle"/>
  <xsl:param name="LoginAction"/>
  <xsl:param name="LogoutAction"/>
  <xsl:param name="Pages"/>
  <xsl:param name="PageName"/>
  <xsl:param name="UserName"/>
  <xsl:if test="$ApplicationTitle != ''">
    <h2><xsl:value-of select="$ApplicationTitle"/></h2>
  </xsl:if>
  <xsl:if test="$PageTitle != ''">
    <h2><xsl:value-of select="$PageTitle"/></h2>
  </xsl:if>
  <xsl:if test="$UserName != ''">
    <b>Welcome <xsl:value-of select="$UserName"/></b>
  </xsl:if>
  <xsl:if test="$LoginAction/@AsHref">
    <p></p>
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="$LoginAction/@AsHref"/></xsl:attribute>
      <xsl:text>Login</xsl:text>
    </xsl:element>
  </xsl:if>
  <xsl:if test="$LogoutAction/@AsHref != ''">
    <p></p>
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="$LogoutAction/@AsHref"/></xsl:attribute>
      <xsl:text>Logout</xsl:text>
    </xsl:element>
  </xsl:if>
  <xsl:if test="count($Pages)>0">
    <p></p>
    <table>
      <xsl:for-each select="$Pages/Page">
          <td>
            <xsl:if test="position() != 1">
              <xsl:text> | </xsl:text>
            </xsl:if>
            <xsl:element name="a">
              <xsl:if test="@Name != $PageName">
                <xsl:attribute name="href">
                  <xsl:value-of select="@Href"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="@Title"/>
            </xsl:element>
          </td>
      </xsl:for-each>
    </table>
  </xsl:if>
</xsl:template>

<xsl:template match="ApplicationInfo">
  <xsl:call-template name="MakeHeading">
    <xsl:with-param name="ApplicationTitle" select="Application/@Title" />
    <xsl:with-param name="PageTitle" select="Page/@Title" />
    <xsl:with-param name="PageName" select="Page/@Name" />
    <xsl:with-param name="Pages" select="Pages" />
    <xsl:with-param name="LoginAction" select="LoginAction"/>
    <xsl:with-param name="LogoutAction" select="LogoutAction"/>
    <xsl:with-param name="UserName" select="EndUser/@DisplayName"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="Form">
  <xsl:element name="form">
    <xsl:attribute name="name">
      <xsl:value-of select="@Name"/>
    </xsl:attribute>
    <xsl:if test="@Method != ''">
      <xsl:attribute name="method">
        <xsl:value-of select="@Method"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@Action != ''">
      <xsl:attribute name="action">
        <xsl:value-of select="@Action"/>
      </xsl:attribute>
    </xsl:if>
    <!-- Need a multipart form to support file upload -->
    <xsl:if test="current()//Layout/Field/@ControlStyle='File'">
      <xsl:attribute name="enctype">multipart/form-data</xsl:attribute>
    </xsl:if>
    <input type="hidden" name="__action"/>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="Form/FieldGroup/Layout">
  <table>
    <xsl:apply-templates/>
  </table>
</xsl:template>

<xsl:template match="FieldGroup/Data/HiddenFields/Field">
  <xsl:element name="input">
    <xsl:attribute name="type">hidden</xsl:attribute>
    <xsl:attribute name="name">
      <xsl:value-of select="@Name"/>
    </xsl:attribute>
    <xsl:attribute name="value">
      <xsl:value-of select="@Value"/>
    </xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template match="FieldGroup/Data/HiddenRecordFields/Field">
  <xsl:element name="input">
    <xsl:attribute name="type">hidden</xsl:attribute>
    <xsl:attribute name="name">
      <xsl:value-of select="@Name"/>
    </xsl:attribute>
    <xsl:attribute name="value">
      <xsl:value-of select="@Value"/>
    </xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template match="CommandGroup/Layout">
<table>
<xsl:apply-templates/>
</table>
</xsl:template>

<xsl:template name="MakeInputField">
  <xsl:param name="type"/>
  <xsl:element name="input">
    <xsl:attribute name="type"><xsl:value-of select="$type"/></xsl:attribute>
    <xsl:attribute name="name">
      <xsl:value-of select="@InputName"/>
    </xsl:attribute>
    <xsl:attribute name="size">
      <xsl:value-of select="@DisplayWidth"/>
    </xsl:attribute>
    <xsl:if test="@MaxLength > 0">
      <xsl:attribute name="maxlength">
        <xsl:value-of select="@MaxLength"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:attribute name="value">
      <xsl:value-of select="../../Data/Field[@Name=current()/@Name]/@EditText"/>
    </xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeTextInputField">
  <xsl:call-template name="MakeInputField">
    <xsl:with-param name="type">text</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="MakePasswordInputField">
  <xsl:call-template name="MakeInputField">
    <xsl:with-param name="type">password</xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="MakeSelectOption">
  <xsl:element name="option">
    <xsl:if test="@Selected">
      <xsl:attribute name="selected">selected</xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@Name!=''">
        <xsl:attribute name="value">
          <xsl:value-of select="@Value"/>
        </xsl:attribute>
        <xsl:value-of select="@Name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@Value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeSelectOptions">
  <xsl:for-each select="Values/Item">
    <xsl:call-template name="MakeSelectOption"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="MakeSelect">
  <xsl:param name="Multiple" select="0"/>
  <xsl:element name="select">
    <xsl:attribute name="name">
      <xsl:value-of select="@Name"/>
    </xsl:attribute>
    <xsl:if test="$Multiple != 0">
      <xsl:attribute name="multiple">multiple</xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@SelectRows = -1">
        <xsl:attribute name="size">
          <xsl:value-of select="count(Values/Item)"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@SelectRows > 0">
        <xsl:attribute name="size">
          <xsl:value-of select="@SelectRows"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="MakeSelectOptions"/>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeSelectMultipleField">
  <xsl:call-template name="MakeSelect">
    <xsl:with-param name="Multiple" select="1"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="MakeSelectField">
  <xsl:call-template name="MakeSelect"/>
</xsl:template>

<xsl:template name="MakeRadioItem">
  <xsl:element name="input">
    <xsl:attribute name="type">radio</xsl:attribute>
    <xsl:if test="@Selected">
      <xsl:attribute name="checked">checked</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="name"><xsl:value-of select="../../@InputName"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="@Name!=''">
        <xsl:attribute name="value">
          <xsl:value-of select="@Value"/>
        </xsl:attribute>
        <xsl:value-of select="@Name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@Value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeRadioField">
  <table>
  <xsl:for-each select="Values/Item">
    <tr>
    <xsl:call-template name="MakeRadioItem"/>
    </tr>
  </xsl:for-each>
  </table>
</xsl:template>

<!-- Nearly exactly the same as MakeRadioItem -->
<xsl:template name="MakeCheckBoxItem">
  <xsl:element name="input">
    <xsl:attribute name="type">checkbox</xsl:attribute>
    <xsl:if test="@Selected">
      <xsl:attribute name="checked">checked</xsl:attribute>
    </xsl:if>
    <xsl:attribute name="name"><xsl:value-of select="../../@InputName"/></xsl:attribute>
    <xsl:choose>
      <xsl:when test="@Name!=''">
        <xsl:attribute name="value">
          <xsl:value-of select="@Value"/>
        </xsl:attribute>
        <xsl:value-of select="@Name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@Value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeCheckBoxField">
  <table>
  <xsl:for-each select="Values/Item">
    <tr>
    <xsl:call-template name="MakeCheckBoxItem"/>
    </tr>
  </xsl:for-each>
  </table>
</xsl:template>

<xsl:template name="MakeFileField">
  <xsl:element name="input">
    <xsl:attribute name="type">file</xsl:attribute>
    <xsl:attribute name="name">
      <xsl:value-of select="@InputName"/>
    </xsl:attribute>
    <xsl:attribute name="size">
      <xsl:value-of select="@DisplayWidth"/>
    </xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeImage">
  <xsl:param name="Href"/>
  <xsl:param name="DisplayText"/>
  <xsl:param name="Layout"/>
  <xsl:element name="img">
    <xsl:attribute name="src">
      <xsl:value-of select="$Href"/>
    </xsl:attribute>
    <xsl:attribute name="alt">
      <xsl:value-of select="$DisplayText"/>
    </xsl:attribute>
    <xsl:if test="$Layout/@ImageWidth != -1">
      <xsl:attribute name="width">
        <xsl:value-of select="$Layout/@ImageWidth"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$Layout/@ImageHeight != -1">
      <xsl:attribute name="height">
        <xsl:value-of select="$Layout/@ImageHeight"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeImageField">
  <xsl:call-template name="MakeImage">
    <xsl:with-param name="Href" select="../../Data/Field[@Name=current()/@Name]/Image/@Href"/>
    <xsl:with-param name="DisplayText" select="../../Data/Field[@Name=current()/@Name]/@DisplayText"/>
    <xsl:with-param name="Layout" select="current()"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="MakeTextAreaField">
  <xsl:element name="textarea">
    <xsl:attribute name="name">
      <xsl:value-of select="@InputName"/>
    </xsl:attribute>
    <xsl:if test="@DisplayRows != -1">
      <xsl:attribute name="rows">
        <xsl:value-of select="@DisplayRows"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@DisplayColumns != -1">
      <xsl:attribute name="cols">
        <xsl:value-of select="@DisplayColumns"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@TextAreaWrap != ''">
      <xsl:attribute name="wrap">
        <xsl:value-of select="@TextAreaWrap"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:value-of select="../../Data/Field[@Name=current()/@Name]/@EditText"/>
  </xsl:element>
</xsl:template>

<xsl:template name="MakeTextField">
  <p>
    <xsl:value-of select="../../Data/Field[@Name=current()/@Name]/@EditText"/>
  </p>
</xsl:template>

<xsl:template name="MakeListField">
  <ul>
    <xsl:for-each select="Values/Item">
      <li>
        <xsl:value-of select="@DisplayText"/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="FieldGroup/Layout/Field">
<tr>
  <xsl:element name="th">
    <xsl:if test="@CaptionAlign != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="@CaptionAlign"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@CaptionVAlign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="@CaptionVAlign"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:value-of select="@Caption"/>
  </xsl:element>
  <xsl:element name="td">
    <xsl:if test="@Align != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="@Align"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@VAlign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="@VAlign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:choose>
      <xsl:when test="@ControlStyle='TextInput'">
        <xsl:call-template name="MakeTextInputField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='PasswordInput'">
        <xsl:call-template name="MakePasswordInputField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='Select'">
        <xsl:call-template name="MakeSelectField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='SelectMultiple'">
        <xsl:call-template name="MakeSelectMultipleField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='Radio'">
        <xsl:call-template name="MakeRadioField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='CheckBox'">
        <xsl:call-template name="MakeCheckBoxField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='TextArea'">
        <xsl:call-template name="MakeTextAreaField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='File'">
        <xsl:call-template name="MakeFileField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='Text'">
        <xsl:call-template name="MakeTextField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='Image'">
        <xsl:call-template name="MakeImageField">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@ControlStyle='List'">
        <xsl:call-template name="MakeListField">
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Unknown controlstyle</xsl:text><xsl:value-of select="@ControlStyle"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</tr>
</xsl:template>

<xsl:template name="MakeActionCommand">
  <xsl:param name="Data" select="../../Data/Action[@Name=current()/@Name]"/>
  <xsl:param name="Layout" select="."/>
  <xsl:param name="Caption" select="$Layout/@Caption"/>
<td>
  <xsl:choose>
    <xsl:when test="$Layout/@ControlStyle='Button'">
      <xsl:element name="input">
        <xsl:attribute name="type">submit</xsl:attribute>
        <xsl:attribute name="name">
          <xsl:value-of select="$Layout/@Name"/>
        </xsl:attribute>
        <xsl:attribute name="value">
          <xsl:value-of select="$Caption"/>
        </xsl:attribute>
        <xsl:variable name="FormName" select="ancestor::Form/@Name"/>
        <xsl:attribute name="onclick">
          <xsl:value-of select="$FormName"/>.__action.value='<xsl:value-of select="$Data/@AsFieldValue"/>';<xsl:value-of select="$FormName"/>.submit();return false;
        </xsl:attribute>
      </xsl:element>
    </xsl:when>
    <xsl:when test="$Layout/@ControlStyle='Anchor'">
      <xsl:element name="a">
        <xsl:attribute name="href"><xsl:value-of select="$Data/@AsHref"/></xsl:attribute>
        <xsl:value-of select="$Caption"/>
      </xsl:element>
    </xsl:when>
    <xsl:when test="$Layout/@ControlStyle='Image'">
      <xsl:element name="img">
        <xsl:attribute name="src">
          <xsl:value-of select="$Data/@AsHref"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="$Caption"/>
        </xsl:attribute>
        <xsl:if test="$Layout/@ImageWidth != -1">
          <xsl:attribute name="width">
            <xsl:value-of select="$Layout/@ImageWidth"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="$Layout/@ImageHeight != -1">
          <xsl:attribute name="height">
            <xsl:value-of select="$Layout/@ImageHeight"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:element>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>Unknown controlstyle</xsl:text><xsl:value-of select="$Layout/@ControlStyle"/>
    </xsl:otherwise>
  </xsl:choose>
</td>
</xsl:template>

<xsl:template name="MakeActionCommandArray">
  <xsl:param name="Data" select="../../Data/Action[@Name=current()/@Name]"/>
  <xsl:param name="Layout" select="."/>
  <xsl:for-each select="$Layout/Array/Item">
    <xsl:call-template name="MakeActionCommand">
     <xsl:with-param name="Data" select="$Data/Array/Item[@Index=current()/@Index]"/>
     <xsl:with-param name="Layout" select="$Layout"/>
     <xsl:with-param name="Caption" select="./@Caption"/>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>

<xsl:template match="Layout/Action">
  <xsl:choose>
    <xsl:when test="count(Array)>0">
      <xsl:call-template name="MakeActionCommandArray"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="MakeActionCommand"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="Form/Grid">
<table border="1">
<xsl:apply-templates/>
</table>
</xsl:template>

<xsl:template match="Grid/Layout/Field">
  <xsl:element name="th">
    <xsl:if test="@CaptionAlign != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="@CaptionAlign"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@CaptionVAlign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="@CaptionVAlign"/>
      </xsl:attribute>
    </xsl:if>
    <!-- jmt.  Should replace leading and trailing ' ' with &nbsp -->
    <xsl:value-of select="@Caption"/>
  </xsl:element>
</xsl:template>

<xsl:template match="Grid/Layout/CommandColumn">
  <xsl:element name="th">
    <xsl:choose>
      <xsl:when test="@Caption=''">
        &#xA0;
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@Caption"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@CaptionAlign != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="@CaptionAlign"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@CaptionVAlign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="@CaptionVAlign"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:element>
</xsl:template>

<xsl:template match="Grid/Data/Row">
  <tr>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template name="MakeTextColumn">
  <xsl:value-of select="@DisplayText"/>
  &#xA0;
</xsl:template>

<xsl:template name="MakeImageColumn">
  <xsl:call-template name="MakeImage">
    <xsl:with-param name="Href" select="Image/@Href"/>
    <xsl:with-param name="DisplayText" select="@DisplayText"/>
    <xsl:with-param name="Layout" select="../../../Layout/Field[@Name=current()/@Name]"/>
  </xsl:call-template>
</xsl:template>

<!-- Same as MakeListField -->
<xsl:template name="MakeListColumn">
  <ul>
    <xsl:for-each select="Values/Item">
      <li>
        <xsl:value-of select="@DisplayText"/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="Row/Field">
  <xsl:variable name="Layout" select="../../../Layout/Field[@Name=current()/@Name]"/>
  <xsl:element name="td">
    <xsl:if test="$Layout/@Align != ''">
      <xsl:attribute name="align">
        <xsl:value-of select="$Layout/@Align"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$Layout/@VAlign != ''">
      <xsl:attribute name="valign">
        <xsl:value-of select="$Layout/@VAlign"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:variable name="Style">
      <xsl:value-of select="$Layout/@ControlStyle"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$Style='Text'">
        <xsl:call-template name="MakeTextColumn">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Style='Image'">
        <xsl:call-template name="MakeImageColumn">
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$Style='List'">
        <xsl:call-template name="MakeListColumn">
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Unknown style</xsl:text><xsl:value-of select="$Style"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template match="Row/CommandColumn">
  <td>
    <table>
      <xsl:apply-templates/>
    </table>
  </td>
</xsl:template>

<xsl:template match="Row/CommandColumn/Action">
  <tr>
    <xsl:choose>
      <xsl:when test="count(Array)>0">
        <xsl:call-template name="MakeActionCommandArray">
          <xsl:with-param name="Layout"
             select="../../../../Layout/CommandColumn/Action[@Name=current()/@Name]"/>
          <xsl:with-param name="Data"
             select="."/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="MakeActionCommand">
          <xsl:with-param name="Layout"
             select="../../../../Layout/CommandColumn/Action[@Name=current()/@Name]"/>
          <xsl:with-param name="Data"
             select="."/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </tr>
</xsl:template>


</xsl:transform>






