This DBServer demonstrates how to use WebServices to create your own
Database Server.  It has two parts:

A  SoapDBServerUnit
    1.  Defines IWebServicesDataSet interface derived from IInvokable.
        It has two methods, RetrieveDataSet and UpdateDataset.  The
        Interface is registered in the initialization section 
        (RegisterInterface).
    2.  Defines and Implements TWebServicesDataSet, which is derived
        from TInvokableClass and IWebServicesDataSet.  The class is
        registered in the initialization section (RegisterInvokableClass).
    3.  Defines and implements a number of Classes (TIndexDesc, TColDesc,
        TFieldValue and TSoapDataPacket) which are derived from TRemotable.
        These objects are registered in the initialization section
        (RegisterXSClass).
    4.  Defines arrays of the objects in 3 and registers these arrays
        in the initialization section (RegisterXSInfo).
    5.  Define and implements a set of functions and procedures to
        convert TSoapDataPacket to DataSet and vice versa.

    Note: The server requires that you have Interbase installed, that you
          have dbExpress installed, and that you are able to connect to 
          Interbase through dbExpress using a connectionName 'IBLOCAL'.
          See dbExpress documentation for instructions on how to set this 
          up.  No specific tables are required, and an error is returned
          if the query the table does not exist or if the table is
          invalid.

B.  SoapDBClientUnit.pas
    1.  creates a TLinkedRIO object, and uses it (cast as an IWebServicesDataSet)
        to call RetrieveDataSet and get the SoapDataPacket.
    2.  uses utility functions to convert SoapDataPacket to DataSet Data,
        sets this to the ClientDataSet.
    3.  Using DBGrid, it allows change to be made, and it builds a
        TSoapDataPacket Delta.
    4.  When Update Button is hit, calls the IWebServicesDataSet.UpdateDataSet
        method.

