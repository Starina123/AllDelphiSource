This IssuesSample demonstrates how to use WebServices to pass complex
data back and forth between a WebServices Client and Server.  It consists 
of three basic parts:

A.  IssuesServerUnit.pas
    1.  defines and IIssues interface derived from IInvokable.  
    2.  defines and implements a TIssues class derived from TInvokableClass 
        and IIssues.  RetrieveIssues and GetIssues have identical 
        functionality, which is to retrieve Issues data from the Interbase
        server, convert it to a TIssuesArray, and send it back to client.
        The former retrieves TIssuesArray array as var parameter, while
        the latter gets it as a Result.  The PutIssues method is used
        to apply changes back to the server.
    3.  defines and implements a set of Classes derived from TRemotable
        which are used as parameters to IIssues methods.
    4.  in the initialization section, registers the Interface IIssues,
        the invokable class TIssue, and all the types which are to be
        passed as Soap parameters or Results.
    5.  implements to utility functions which are used to move from a
        DataSet to a TIssuesArray.

    Note: The server requires that you have Interbase installed, that you
          have dbExpress installed, and that you are able to connect to 
          Interbase through dbExpress using a connectionName 'IBLOCAL'.
          See dbExpress documentation for instructions on how to set this 
          up.  No tables should be required: the server check's for the
          existence of the SOAPISSUES table and creates it if it is not
          found.

B.  IssuesClientUnit.pas
    1.  creates a TLinkedRIO object, and uses it (cast as an IIssues)
        to retrieve data from the IssuesArray.
    2.  uses utility functions to convert IssuesArray to DataSet Data,
        sets this to the ClientDataSet.
    3.  Using DBGrid, it allows change to be made, and it builds a
        TIssuesArray Delta.
    4.  When Update Button is hit, calls the IIssues.PutIssues method.
    5.  If errors occur, display them in a dialog.

C.  IssuesError.pas - a class which holds onto Error Message and the
    record on which it occurs.

