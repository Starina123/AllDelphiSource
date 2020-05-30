WebSnap Demos
DumpModules directory

This example contains JavaScript to traverse the modules, adapters, fields, and actions
in a web application.

The pertinent JavaScript is in DumpModulesInc.html.

Notes
=====

Modify the style sheet in DumpModulesInc.html to change colors or fonts.

Only modules that have been instantiated will be dumped.  In this sample app, the CountryTable
page is registered with the crAlways create flag.

The buttons on the CountryTable page do not work.  See the CountryEditor example for a working
version of this table.

The dumpmodules page does not display properly at design time because it uses
script objects that are only populated at runtime.


