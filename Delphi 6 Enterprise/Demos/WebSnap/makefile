
# ******************************************************************
# *                                                                *
# *     Delphi WebSnap demos                                       *
# *     MAKE script                                                *
# *                                                                *
# *     Copyright (C) 2001 Borland Software Corporation            *
# *                                                                *
# ******************************************************************

# The script assumes that it is being run from the demos\websnap 
# directory.

# To build the demos without debug information (the default),
# simply run MAKE.EXE from the directory containing this MAKEFILE. To
# build a debug version of the demos, specify a -DDEBUG command
# line parameter when running MAKE.EXE.

!if $d(DEBUG)
DCCDEBUG = -$$D+ -$$L+
!else
DCCDEBUG = -$$D-
!endif

DCC = ..\..\..\bin\dcc32
DCCSWTS = $(DCCDEBUG) -q  
BRCC = ..\..\..\bin\brcc32
UNITPATH=-U..\..\..\lib;..\..\..\projects\bpl;..\util;..\xmlbuilder;..\actionfield;..\scriptobject;..\imgbtnproducer
BPLOUTPUT=-le..\..\..\projects\bpl
DCPOUTPUT=-ln..\..\..\projects\bpl


RUNTIMEPACKAGES = testsvrinfodpk templateres xmlbuilder	templateres
DESIGNPACKAGES = actionfield disphandlers imgbtnproducer  producertemplates scriptobject 
PROJECTS = actionfieldtest biolife countryeditor countryreport dbexpress  \
  dumpmodules imgbtncountryeditor internetexpress locatefileservice masterdetail \
  minapp photogallery scriptobjecttest sessiontest simpleadapter testsvrinfo \
  tutorials webdispatcher webmail xmlbiolife xslproducer
  
default: $(RUNTIMEPACKAGES) $(DESIGNPACKAGES) $(PROJECTS)

$(DESIGNPACKAGES): $(RUNTIMEPACKAGES)
$(PROJECTS): $(DESIGNPACKAGES) $(RUNTIMEPACKAGES)

actionfield:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dcl$*.dpk
   cd ..
   
actionfieldtest:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) actionfieldtestsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) actionfieldisapi.dpr
   cd ..
   
biolife:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*apache.dpr
   cd ..
   
countryeditor:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
   
countryreport:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
   
dbexpress:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
   
dumpmodules:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   cd ..
   
imgbtncountryeditor:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
imgbtnproducer:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dcl$*.dpk
   cd ..

internetexpress:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
locatefileservice:
   echo --- building $*	----
   cd $*
   $(BRCC) htmlfiles.rc
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
masterdetail:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
minapp:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
photogallery:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
producertemplates:
   echo --- building $*	----
   cd $*
   $(BRCC) templates.rc
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dcldemotemplate.dpk
   cd ..

scriptobject:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dclsamplescriptobject.dpk
   cd ..

scriptobjecttest:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) scriptobjecttestsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) scriptobjecttestisapi.dpr
   cd ..
  
  
sessiontest:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
  
simpleadapter:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..

  
templateres:
   echo --- building $*	----
   cd util
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) templateres.dpk
   cd ..

testsvrinfodpk:
   echo --- building $*	----
   cd testsvrinfo
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dclsvrinfocomponents.dpk
   cd ..

testsvrinfo:
   echo --- building $*	----
   cd $*
   $(BRCC) htmlfiles.rc
   $(DCC) $(DCCSWTS) $(UNITPATH) testsvrinfo.dpr
   cd ..
  
  
tutorials:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) tutorialtestsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) tutorialisapi.dpr
   cd ..
  
webdispatcher:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   cd ..
  
webmail:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) webmailapp.dpr
   cd ..
  
xmlbiolife:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $*testsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*isapi.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) $*apache.dpr
   cd ..

xmlbuilder:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) xmlbuilder.dpk
   $(DCC) $(DCCSWTS) $(UNITPATH) $(BPLOUTPUT) $(DCPOUTPUT) dclxmlbuilder.dpk
   cd ..

xslproducer:
   echo --- building $*	----
   cd $*
   $(DCC) $(DCCSWTS) $(UNITPATH) xslpageproducertestsvr.dpr
   $(DCC) $(DCCSWTS) $(UNITPATH) xslpageproducerisapi.dpr
   cd ..
  
  
