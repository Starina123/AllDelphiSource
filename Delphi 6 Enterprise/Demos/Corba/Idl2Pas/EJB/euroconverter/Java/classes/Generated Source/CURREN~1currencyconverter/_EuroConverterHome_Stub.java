
package currencyconverter;

public class _EuroConverterHome_Stub extends javax.ejb._EJBHome_Stub implements currencyconverter.EuroConverterHome, EuroConverterHomeOperations {
  final public static java.lang.Class _opsClass = currencyconverter.EuroConverterHomeOperations.class;

  public java.lang.String[] _ids () {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "RMI:currencyconverter.EuroConverterHome:0000000000000000",
    "RMI:javax.ejb.EJBHome:0000000000000000"
  };

  public currencyconverter.EuroConverter create () throws java.rmi.RemoteException,  javax.ejb.CreateException {

    try {
      while (true) {
        if (!_is_local()) {
          org.omg.CORBA.portable.OutputStream _output = null;
          org.omg.CORBA.portable.InputStream  _input  = null;
          currencyconverter.EuroConverter _result;
          try {
            _output = this._request("create", true);
            _input = this._invoke(_output);
            //FIX: Cannot use helper class because of potential stub downloading
            _result = (currencyconverter.EuroConverter)javax.rmi.PortableRemoteObject.narrow(_input.read_Object(currencyconverter.EuroConverter.class), currencyconverter.EuroConverter.class);
            return _result;
          }
          catch (org.omg.CORBA.portable.ApplicationException _exception) {
            final org.omg.CORBA.portable.InputStream in = _exception.getInputStream();
            java.lang.String _exception_id = _exception.getId();
            if (_exception_id.equals("IDL:javax/ejb/CreateEx:1.0")) {
              _exception_id = in.read_string();
              throw (javax.ejb.CreateException)((org.omg.CORBA_2_3.portable.InputStream)in).read_value();
          }
          //FIX: Wrap original Exception here?
          throw new java.rmi.UnexpectedException("Unexpected User Exception: " + _exception_id);
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
  catch (org.omg.CORBA.portable.UnknownException ex) {
    if (ex.originalEx instanceof java.lang.RuntimeException) {
      throw (java.lang.RuntimeException) ex.originalEx;
    } else if (ex.originalEx instanceof Exception) {
      throw new java.rmi.ServerException(ex.getMessage(), (java.lang.Exception)ex.originalEx);
    } else {
      throw new java.rmi.ServerError(ex.getMessage(), (java.lang.Error) ex.originalEx);
    } 
  }
  catch (org.omg.CORBA.SystemException ex) {
    throw javax.rmi.CORBA.Util.mapSystemException(ex);
  }
}

}
