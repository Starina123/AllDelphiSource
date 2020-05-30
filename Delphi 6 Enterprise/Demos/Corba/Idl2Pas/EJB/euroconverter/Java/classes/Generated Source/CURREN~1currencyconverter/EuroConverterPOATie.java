
package currencyconverter;

/**
 * <ul>
 * <li> <b>IDL Source</b>    "C:/Projects/DelphiProjects/EuroConverter/ejb.idl"
 * <li> <b>IDL Name</b>      ::currencyconverter::EuroConverter
 * <li> <b>Repository Id</b> IDL:currencyconverter/EuroConverter:1.0
 * </ul>
 * <b>IDL definition:</b>
 * <pre>
 * interface EuroConverter : sidl.javax.ejb.EJBObject {
  ...
};
 * </pre>
 */
public class EuroConverterPOATie extends EuroConverterPOA {
  private currencyconverter.EuroConverterOperations _delegate;
  private org.omg.PortableServer.POA _poa;

  public EuroConverterPOATie (final currencyconverter.EuroConverterOperations _delegate) {
    this._delegate = _delegate;
  }

  public EuroConverterPOATie (final currencyconverter.EuroConverterOperations _delegate, 
                              final org.omg.PortableServer.POA _poa) {
    this._delegate = _delegate;
    this._poa = _poa;
  }

  public currencyconverter.EuroConverterOperations _delegate () {
    return this._delegate;
  }

  public void _delegate (final currencyconverter.EuroConverterOperations delegate) {
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
   *   sidl.javax.ejb.EJBHome getEJBHome ();
   * </pre>
   */
  public sidl.javax.ejb.EJBHome getEJBHome () {
    return this._delegate.getEJBHome();
  }

  /**
   * <pre>
   *   any getPrimaryKey ();
   * </pre>
   */
  public org.omg.CORBA.Any getPrimaryKey () {
    return this._delegate.getPrimaryKey();
  }

  /**
   * <pre>
   *   void remove ()
    raises (sidl.javax.ejb.RemoveException);
   * </pre>
   */
  public void remove () throws  sidl.javax.ejb.RemoveException {
    this._delegate.remove();
  }

  /**
   * <pre>
   *   float hfl2float (in float arg0);
   * </pre>
   */
  public float hfl2float (float arg0) {
    return this._delegate.hfl2float(arg0);
  }

}
