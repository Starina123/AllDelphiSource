�
 TSQLBARSFORM 03  TPF0TSQLBarsFormSQLBarsFormLeft�Top�Width(HeightDCaptionTeeChart SQL Demo
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`ScaledWindowStatewsMaximizedOnCreate
FormCreate
TextHeight TDBChartDBChart1Left TopUWidth Height)Hint3Click on a Bar to see an example of event handling.BottomWall.ColorclRedFoot.Font.ColorclRedFoot.Font.Height�Foot.Font.NameArialFoot.Font.StylefsBold Foot.Frame.ColorclScrollBarLeftWall.Color��� Title.AlignmenttaLeftJustifyTitle.Brush.Color��� Title.Font.ColorclBlueTitle.Font.Height�Title.Font.NameArialTitle.Font.StylefsBoldfsItalic Title.Frame.Color@�� Title.Frame.WidthTitle.Text.Strings'Pyramid Bar Chart built from SQL Query. OnClickLegendDBChart1ClickLegend	BackColor��� BottomAxis.Grid.ColorclScrollBarChart3DPercentZ
ClipPointsFrame.VisibleLeftAxis.Grid.ColorclScrollBarLegend.ColorclAquaLegend.Font.ColorclBlackLegend.Font.Height�Legend.Font.NameArialLegend.Font.StylefsBoldfsItalic Legend.Frame.ColorclTealLegend.Frame.WidthLegend.TextStyleltsRightValueLegend.TopPosLegend.ShadowSizeRightAxis.Grid.ColorclScrollBarTopAxis.Grid.ColorclScrollBarAlignalClientParentShowHintShowHint	TabOrder  
TBarSeries
BarSeries1ColorEachPoint	Cursor	crUpArrowMarks.ArrowLengthMarks.Style
smsPercentMarks.Visible	
DataSourceQuery1XLabelsSourceNAMEOnClickBarSeries1ClickBarStyle	bsPyramidBarWidthPercentPSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameYYValues.Multiplier       ��?YValues.OrderloNoneYValues.ValueSourceWEIGHTOnGetBarStyleBarSeries1GetBarStyleLeftRTopv   TPanelPanel1Left Top Width Height)AlignalBottom	AlignmenttaLeftJustify
Font.ColorclRedFont.Height�	Font.NameArial
Font.StylefsItalic 
ParentFontTabOrder TBitBtnBitBtn1Left$TopWidthYHeight!
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder KindbkClose   TPanelPanel2Left Top Width HeightUAlignalTopTabOrder TLabelLabel1LeftTop6Width-HeightCaptionBar &Style:  TMemoMemo1LeftTop
WidthHeightCLines.Strings.select Name,Weight from ":dbdemos:animals.dbf"where Weight < 20  TabOrder   TBitBtnBitBtn2LeftTop
WidthoHeight!CaptionRun Query !!TabOrderOnClickBitBtn2Click
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUUUUUUUUUUUUUUUUUUUUUUUUUU�UUUUUUYUUUUUUW�UUUUU��UUUUUUww�UUUUU��UUUUUUww�UUUUY��UUUUWwwUUUU���UUUUwww�UUW���UUUWwuww�UUyUY�UUUwuUWw�UUUUUY�UUUUUWwUUUUUU�UUUUUUw�UUUUUY�UUUUUUWw�UUUUUUyUUUUUUw�UUUUUW�UUUUUUWw�UUUUUUY�UUUUUUWwUUUUUUUUUUUUUUUU	NumGlyphs  	TComboBox	ComboBox1LeftVTop2WidthHeightStylecsDropDownList
ItemHeightItems.Strings	RectanglePyramid
InvPyramidCilinderEllipseArrow TabOrderOnChangeComboBox1Change  	TCheckBoxCBRandomBarLeft�Top5WidthXHeightCaption<-- &RandomTabOrderOnClickCBRandomBarClick   TPanelPanel3Left Top~Width Height� AlignalBottomTabOrder TLabelLabel2Left� TopWidth� HeightCaption<--- Try to change values !!!
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBoldfsItalic 
ParentFont  TDBGridDBGrid1LeftTopWidth� Height� AlignalLeft
DataSourceDataSource1TabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TDataSourceDataSource1DataSetQuery1Left� Top$  TQueryQuery1Active	DatabaseNameDBDEMOSSQL.Stringsselect Name,Weight from ":dbdemos:animals.dbf"where Weight<20  RequestLive	Left� Top*   