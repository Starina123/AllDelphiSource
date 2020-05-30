program Teedemo;

uses
  Forms,
  teemain in 'teemain.PAS' {TeeMainForm},
  Teebasic in 'teebasic.PAS' {DemoForm},
  Features in 'features.pas' {FeaturesForm},
  Udemocha in 'UDemoCha.pas' {SeriesForm},
  Basic in 'basic.pas' {BasicForm},
  Bubble in 'bubble.pas' {BubbleForm},
  Gantt in 'Gantt.pas' {GanttForm},
  Lastvalu in 'Lastvalu.pas' {DigitalForm},
  Linked in 'Linked.pas' {LinkedTablesForm},
  LogLab in 'loglab.pas' {LogLabelsForm},
  Mulaxis in 'mulaxis.pas' {CustomAxisForm},
  Pie in 'Pie.pas' {PieForm},
  Specs in 'Specs.pas' {ChartSpecs},
  Sqlbars in 'Sqlbars.pas' {SQLBarsForm},
  Stackare in 'stackare.pas' {AreasForm},
  Tablepie in 'Tablepie.pas' {TablePieForm},
  Uanizoom in 'Uanizoom.pas' {FormAnimatedZoom},
  Uarrows in 'uarrows.pas' {ArrowsForm},
  Uaxislab in 'Uaxislab.pas' {AxisLabelsForm},
  UBitmap in 'Ubitmap.pas' {BitmapForm},
  ucolor in 'ucolor.pas' {ColoredForm},
  Ucrossh in 'ucrossh.pas' {CrossHairForm},
  Udbhoriz in 'Udbhoriz.pas' {DBHorizBarForm},
  udemutil in 'Udemutil.pas',
  Udraw in 'Udraw.pas' {DrawForm},
  UFast in 'Ufast.pas' {FastLineForm},
  UHighLo in 'uhighlo.pas' {HighLowForm},
  Ukeyboa in 'ukeyboa.pas' {KeyboardForm},
  Ulegend in 'Ulegend.pas' {LegendForm},
  Umain in 'Umain.pas' {MiniForm},
  UMetafil in 'umetafil.pas' {MetafileForm},
  Uoverbar in 'Uoverbar.pas' {OverBarForm},
  Upages in 'Upages.pas' {PagesForm},
  Uprint in 'Uprint.pas' {PrintForm},
  Uscroll in 'Uscroll.pas' {ScrollForm},
  Uscrollb in 'Uscrollb.pas' {ScrollBarForm},
  Ushapes in 'Ushapes.pas' {ShapesForm},
  Ustack in 'Ustack.pas' {StackedForm},
  Uylegend in 'Uylegend.pas' {LegendXYForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTeeMainForm, TeeMainForm);
  Application.Run;
end.
