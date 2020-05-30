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
public class _EuroConverterStub extends sidl.javax.ejb._EJBObjectStub implements currencyconverter.EuroConverter {
  final public static java.lang.Class _opsClass = currencyconverter.EuroConverterOperations.class;

  public java.lang.String[] _ids () {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "IDL:currencyconverter/EuroConverter:1.0",
    "IDL:borland.com/sidl/javax/ejb/EJBObject:1.0"
  };

  /**
   * <pre>
   *   float hfl2float (in float arg0);
   * </pre>
   */
  public float hfl2float (float arg0) {

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
          throw new org.omg.CORBA.UNKNOWN("Unexpected User Exception: " + _exception_id);
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

}
