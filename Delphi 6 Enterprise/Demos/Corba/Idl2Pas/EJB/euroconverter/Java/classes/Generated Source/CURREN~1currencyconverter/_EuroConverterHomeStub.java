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
public class _EuroConverterHomeStub extends sidl.javax.ejb._EJBHomeStub implements currencyconverter.EuroConverterHome {
  final public static java.lang.Class _opsClass = currencyconverter.EuroConverterHomeOperations.class;

  public java.lang.String[] _ids () {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "IDL:currencyconverter/EuroConverterHome:1.0",
    "IDL:borland.com/sidl/javax/ejb/EJBHome:1.0"
  };

  /**
   * <pre>
   *   currencyconverter.EuroConverter create ()
    raises (sidl.javax.ejb.CreateException);
   * </pre>
   */
  public currencyconverter.EuroConverter create () throws  sidl.javax.ejb.CreateException {

    while (true) {
      if (!_is_local()) {
        org.omg.CORBA.portable.OutputStream _output = null;
        org.omg.CORBA.portable.InputStream  _input  = null;
        currencyconverter.EuroConverter _result;
        try {
          _output = this._request("create", true);
          _input = this._invoke(_output);
          _result = currencyconverter.EuroConverterHelper.read(_input);
          return _result;
        }
        catch (org.omg.CORBA.portable.ApplicationException _exception) {
          final org.omg.CORBA.portable.InputStream in = _exception.getInputStream();
          java.lang.String _exception_id = _exception.getId();
          if (_exception_id.equals(sidl.javax.ejb.CreateExceptionHelper.id())) {
            throw             sidl.javax.ejb.CreateExceptionHelper.read(_exception.getInputStream());
          }
          throw new org.omg.CORBA.UNKNOWN("Unexpected User Exception: " + _exception_id);
        }
        catch (org.omg.CORBA.portable.RemarshalException _exception) {
          continue;
        }
        finally {
          this._releaseReply(_input);
        }
      } else {
        final org.omg.CORBA.portable.ServantObject _so = _servant_preinvoke("create", _opsClass);
        if (_so == null) {
          continue;
        }
        final currencyconverter.EuroConverterHomeOperations _self = (currencyconverter.EuroConverterHomeOperations)_so.servant;
        try {
          return _self.create();
        }
        finally {
          _servant_postinvoke(_so);
        }
      }
    }
  }

}
