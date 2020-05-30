
package currencyconverter;

public class _EuroConverter_Stub extends javax.ejb._EJBObject_Stub implements currencyconverter.EuroConverter, EuroConverterOperations {
  final public static java.lang.Class _opsClass = currencyconverter.EuroConverterOperations.class;

  public java.lang.String[] _ids () {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "RMI:currencyconverter.EuroConverter:0000000000000000",
    "RMI:javax.ejb.EJBObject:0000000000000000"
  };

  public float hfl2float (float arg0) throws java.rmi.RemoteException {

    try {
      while (true) {
        if (!_is_local()) {
          org.omg.CORBA.portable.OutputStream _output = null;
          org.omg.CORBA.portable.InputStream  _input  = null;
          float _result;
          try {
            _output = this._request("hfl2float", true);
            _output.write_float((float)arg0);
            _input = this._invoke(_output);
            _result = _input.read_float();
            return _result;
          }
          catch (org.omg.CORBA.portable.ApplicationException _exception) {
            final org.omg.CORBA.portable.InputStream in = _exception.getInputStream();
            java.lang.String _exception_id = _exception.getId();
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
          final org.omg.CORBA.portable.ServantObject _so = _servant_preinvoke("hfl2float", _opsClass);
          if (_so == null) {
            continue;
          }
          final currencyconverter.EuroConverterOperations _self = (currencyconverter.EuroConverterOperations)_so.servant;
          try {
            return _self.hfl2float(arg0);
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
