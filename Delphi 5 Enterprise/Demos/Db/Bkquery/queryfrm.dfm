�
 TADHOCFORM 0�  TPF0
TAdhocForm	AdhocFormLeft� TopmBorderStylebsSingleCaptionAdhoc Background Query DemoClientHeight)ClientWidth!Color	clBtnFace
ParentFont	OldCreateOrder	PositionpoScreenCenterOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TLabelLabel1LeftTopWidthJHeightCaption&Database Alias:FocusControl
AliasCombo  TLabelLabel2LeftTop8WidthHeightCaption&Query:FocusControl	QueryEdit  TLabelLabel3Left� TopWidth8HeightCaption&User Name:FocusControlNameEdit  TLabelLabel4Left0TopWidth1HeightCaption
&Password:FocusControlPasswordEdit  TLabelLabel5LeftTopWidthHHeightCaption&Retrieve query:FocusControlSavedQueryCombo  TBevelBevel1LeftTopWidth�HeightShapebsFrame  	TComboBox
AliasComboLeftTop Width� Height
ItemHeightTabOrder Text
AliasCombo  TMemo	QueryEditLeftTopHWidth�Height� Lines.Strings?select Company, Sum(ItemsTotal) - Sum(AmountPaid) as AmountDue   from customer, orders '  where Customer.CustNo = Orders.CustNo  group by Company TabOrder  TEditNameEditLeft� Top Width� HeightTabOrder  TEditPasswordEditLeft0Top Width� HeightPasswordChar*TabOrderText	masterkey  TButton
ExecuteBtnLeft�TopWidthKHeightCaption&ExecuteDefault	TabOrderOnClickExecuteBtnClick  TButtonCloseBtnLeft�Top� WidthKHeightCancel	Caption&CloseTabOrderOnClickCloseBtnClick  	TComboBoxSavedQueryComboLeft`Top WidthYHeightStylecsDropDownList
ItemHeightTabOrderOnChangeSavedQueryComboChange  TButtonSaveBtnLeft�TopHWidthKHeightCaption&SaveTabOrderOnClickSaveBtnClick  TButton	SaveAsBtnLeft�TophWidthKHeightCaptionSave &asTabOrderOnClickSaveAsBtnClick  TButtonNewBtnLeft�Top(WidthKHeightCaption&NewTabOrder	OnClickNewBtnClick   