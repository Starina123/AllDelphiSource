
package currencyconverter;

/**
 * <ul>
 * <li> <b>IDL Source</b>    "C:/Projects/DelphiProjects/EuroConverter/ejb.idl"
 * <li> <b>IDL Name</b>      ::currencyconverter::EuroConverterHome
 * <li> <b>Repository Id</b> IDL:currencyconverter/EuroConverterHome:1.0
 * </ul>
 * <b>IDL definition:</b>
 * <pre>
 * interface EuroConverterHome : sidl.javax.ejb.EJBHome {
  ...
};
 * </pre>
 */
public class EuroConverterHomePOATie extends EuroConverterHomePOA {
  private currencyconverter.EuroConverterHomeOperations _delegate;
  private org.omg.PortableServer.POA _poa;

  public EuroConverterHomePOATie (final currencyconverter.EuroConverterHomeOperations _delegate) {
    this._delegate = _delegate;
  }

  public EuroConverterHomePOATie (final currencyconverter.EuroConverterHomeOperations _delegate, 
                              final org.omg.PortableServer.POA _poa) {
    this._delegate = _delegate;
    this._poa = _poa;
  }

  public currencyconverter.EuroConverterHomeOperations _delegate () {
    return this._delegate;
  }

  public void _delegate (final currencyconverter.EuroConverterHomeOperations delegate) {
    this._delegate = delegate;
  }

  public org.omg.PortableServer.POA _default_POA () {
    if (_poa != null) {
      return _poa;
    } 
    else {
      return super._default_POA();
    }
  }

  /**
   * <pre>
   *   sidl.javax.ejb.EJBMetaData getEJBMetaData ();
   * </pre>
   */
  public sidl.javax.ejb.EJBMetaData getEJBMetaData () {
    return this._delegate.getEJBMetaData();
  }

  /**
   * <pre>
   *   void remove (in any primaryKey)
    raises (sidl.javax.ejb.RemoveException);
   * </pre>
   */
  public void remove (org.omg.CORBA.Any primaryKey) throws  sidl.javax.ejb.RemoveException {
    this._delegate.remove(primaryKey);
  }

  /**
   * <pre>
   *   string getSimplifiedIDL ();
   * </pre>
   */
  public java.lang.String getSimplifiedIDL () {
    return this._delegate.getSimplifiedIDL();
  }

  /**
   * <pre>
   *   currencyconverter.EuroConverter create ()
    raises (sidl.javax.ejb.CreateException);
   * </pre>
   */
  public currencyconverter.EuroConverter create () throws  sidl.javax.ejb.CreateException {
    return this._delegate.create();
  }

}
