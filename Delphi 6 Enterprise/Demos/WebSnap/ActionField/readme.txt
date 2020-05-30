WebSnap Demos
ActionField directory

An action field is a cross between a field and an action.  A checkbox is used for the UI, making it
like a field.  When the HTTP request is processed a command is executed, making it like an action.
Action fields implement the IExecuteValue interface.

The dclactionfield package implements an action field that can be used to mark a dataset row
for deletion.  The package also registers a component that is used with the TAdapterPageProducer
to display the action field.

Here are the component descriptions:

  TDataSetAdapterDeleteRowField - This component can be added to a TDataSetAdapter.  It is used to mark a row
  for deletion. TDataSetAdapterDeleteRow field implements the IExecuteValue interface.

  TAdapterDisplayActionField - This component can be added as a child of TAdapterPageProducer to
  display adapter components implementing IExecuteValue.  It generates HTML and JavaScript
  to display a checkbox.

The ActionFieldTest demo uses these two components.
