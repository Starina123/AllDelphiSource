//$Header:   //delphidev/area2/vfoo/admin/tp/xtab/Mxconsts.pav   1.1   23 Jan 1998 19:37:52   klow  $
unit mxConsts;

{$R mxconsts.RES}

interface

resourcestring
	{ Strings used in the Pivot }
	 SAllValues = 'All Values';
	 SMovetoRow = 'Move to Row Area';
	 SMovetoCol = 'Move to Column Area';
	 sMakeDimOpen = 'Open Dimension';
	 sDrilled = 'Drilled In';
	 sCouldNotOpen = 'The information requested could not be loaded. ';
	 sNoSumsAvailable = 'No active summaries have been defined. ';
	 sNoSumsCouldBeLoaded = 'Not enough room available to load a summary. ';
	 sNoDimsAvailable = 'No available dimensions have been defined. ';
	 sNoDimsCouldBeLoaded = 'Not enough space available to load a dimension. ';

   sTemplatePrefix = 'Template: ';
	 { Strings used in the CrossTabGrid }
	 SGridCellError = '[Error]';
	 STotalCaption = 'Sum';
   sActivateLabel = 'Inactive Dimensions';
	 SRowCaption = 'R';
	 SColCaption = 'C';
	 SCaptionMenu1 = 'Display Data and Subtotals';
	 SCaptionMenu2 = 'Display Data Only';
	 SCaptionMenu3 = 'Display Subtotals Only';
	 SDrillIn = 'Drill in to this value';
	 sGridMenu1 = 'Subtotals on/off';
	 sGridMenu2 = 'Decision Cube Editor..';
	 sGridMenu3 = 'Decision Query Editor..';
	 sGridMenu4 = 'Show Detail Records..';

	 { Strings used in mxarrays }
	 sUnsupportedDataType = 'Unsupported data type : %s';
	 sRowOutOfRange       = 'Row index out of range : %d';
	 sColOutOfRange       = 'Column index out of range : %d';
	 sDupeItem            = 'Duplicate item in array';
	 sArrayIndexOutOfRange= 'Array index out of range : %d';
	 sLowCapacityError    = 'The DecisionCube Capacity is low. Please deactivate dimensions or change the data set.';
	 sQryNotInitialized   = 'Query could not be run. Check that the query, SQL text, and Database are correct.';
	 sSortedListError     = 'Operation not allowed on sorted string list.';
	 sDuplicateString     = 'String list does not allow duplicates.';
	sMaxAllowedSums      = 'The maximum allowed summaries of %d has been exceeded.';
	sGeneralArrayError   = 'General array error.';

	 {String used in the DecisionSource}
	 SDimIndexError = 'Illegal Dimension Index';

	 {String used in the DecisionCube}
	SIllegalValueForBin = 'Initial Value is not legal for this type of Grouping';
	SIllegalDimMap = 'Dimension Map is not the correct size';
	SDimMapActiveError = 'Cannot perform this action on an active Dimension Map';
	SNotAvailable = 'Not Available';
  SGetValueCounts = 'Information required to do Maximum Cell limit is not current.  Do you want to fetch it now?';
  SDateBinningNotAllowed = 'Date grouping is not allowed for fields of this type';
  sEmptyDataSet = 'Cannot build the Decision Cube with an empty data set';

	 { Strings use in Query UI}
	 sNoDataSet = 'Data set property is not assigned';
	 SNoAggs = 'No summaries are defined. ';
	 SNoDims = 'No dimension fields are defined. ';
	 SUnknownDims = 'The dimension types for this dataset cannot be determined automatically.  You must map the fields to dimensions or summaries with the Decision Cube Editor';
	 SGroupsMissing = 'All dimension fields must be grouped. ';
   SDecisionQueryError = 	'The query may be incorrectly defined, or you may need to map its fields to active dimensions or summaries with the Decision Cube Editor';
	 SDataSetError = 'The dataset may be incorrectly defined, or you may need to map its fields to active dimensions or summaries with the Decision Cube Editor';
   SQueryError = 'The query may be incorrectly defined, or you may need to map its fields to active dimensions or summaries with the Decision Cube Editor';
   SCountStar = 'COUNTALL';  //INTL must be in upper case
   SAddAvgWarning = 'Average is calculated using sum and count summaries for each field. The necessary summaries have been added.';
   SAddAvgStarWarning = 'Average is calculated using a field sum and count(*).  The necessary summaries have been added.';

	 { Query UI Designer strings}
	 SQueryLegal = 'Query is legal.';
	 sAddFieldExists = ' is already in the query';
	 SAggTypeNotAllowed = ' is not an allowed summary type';
	 SDimTypeNotAllowed = ' is not an allowed dimension type';
//	 SSumTypeNotAllowed = 'A summary of this type is not allowed.';
	 SAverageRequires = 'Average summaries use Sum and Count';
	 SWantToExit = 'Do you still want to Exit?';
	sQueryIllegal = 'The query you have created is not legal.';
	 SQueryEditIllegal = 'The query you have entered is not legal.  Please correct it before continuing.';
	 sRemoveFieldError = 'Could not remove the field';
    sAllFields = 'All Fields';
    sQueryFields = 'Query Fields';
    sEditDone = '&Edit Done';
    sEditQuery = '&Edit Query';

	{ Used by the query parser}
	SQParseRemovedField = 'One or more fields of a type which cannot be tabulated were removed from the query.';

	{ used by mxstore }
	sCubeLimitsExceeded   = 'Decision Cube size excedes limits';
	sMaxAllowedDims       = 'The maximum allowed dimensions of %d has been exceeded.';
	sMaxAllowedCells      = 'Total cell count of %d exceeds the maximum of %d.';
	sUnsupportedFieldType = 'Field %s has an unsupported data type: %s';
	sFetchValues          = 'Scanning data set values...';
	sUserCanceled         = 'User canceled DecisionCube population.';
	sBinningValues        = 'Grouping values ...';
	sCreatingIndexes      = 'Creating Cube index for %s ...';
	sCreateDerivedSummaryError = 'Unable to create derived summary.';
	sTrue = 'True';
	sFalse = 'False';
	sBinTypeMismatch       = 'The bin type does not match the fieldtype.';
	sFatalCacheError       = 'Fatal error in cache: code: %d';
	sStringTypeNoSupported = 'String Data type not supported for summaries';
	sDataSetTooLarge       = 'Dataset is too large';
	sBuildingDataStore     = 'Building data store...';

	{String used in MXtables and mxcommon and mxqparse}
	 sSumLabel = 'Sum of %s';
	 sCountLabel = 'Count of %s';
	 sMaxLabel = 'Maximum of %s';
	 sMinLabel = 'Minimum of %s';
	 sAverageLabel = 'Average of %s';
	 sVarLabel = 'Variance of %s';
	 sSDLabel = 'Standard Deviation of %s';
	 sAggLabel= 'Summary of %s';
	 sUnsupportedVarType = 'Unsupported Data Type %d';
	 sOtherValues = 'Other Values';

	 sSelectFromError = 'Query lacks a Select/From clause.';
	 sArgumentExpected = 'No argument provided for an operator or summary';
	 sGroupOnExpressionError = 'An expression cannot be used for a grouping field';

	 SOutofBounds = 'Out of Bounds';
	SIDAPILangID = '0009';

implementation

end.
