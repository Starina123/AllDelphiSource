echo off
: This batch file registers all of the WebSnap example application that run
: under the Web App Debugger.  Run this bat file after all sample applications
: have been built.
:
: Parameters:
:   %1 - "unregserver" to unregister all servers, blank to register all servers

call _regone ActionFieldTest\ActionFieldTestSvr.exe %1
call _regone Biolife\Biolifetestsvr.exe %1
call _regone CountryEditor\CountryEditorTestSvr.exe %1
call _regone CountryReport\CountryReportTestSvr.exe %1
call _regone DBExpress\DBExpressTestSvr.exe %1
call _regone DumpModules\DumpModulesTestSvr.exe %1
call _regone ImgBtnCountryEditor\ImgBtnCountryEditorTestSvr.exe %1
call _regone InternetExpress\InternetExpressTestSvr.exe %1
call _regone LocateFileService\LocateFileServiceTestSvr.exe %1
call _regone MasterDetail\MasterDetailTestSvr.exe %1
call _regone MinApp\MinAppTestSvr.exe %1
call _regone PhotoGallery\PhotoGalleryTestSvr.exe %1
call _regone ScriptObjectTest\ScriptObjectTestSvr.exe %1
call _regone SessionTest\SessionTestTestSvr.exe %1
call _regone SimpleAdapter\SimpleAdapterTestSvr.exe %1
call _regone TestSvrInfo\TestSvrInfo.exe %1
call _regone Tutorials\TutorialTestSvr.exe %1
call _regone WebDispatcher\WebDispatcherTestSvr.exe %1
call _regone WebMail\WebMailApp.exe %1
call _regone XMLBiolife\XMLBiolifeTestSvr.exe %1
call _regone XSLProducer\XSLPageProducerTestSvr.exe %1
