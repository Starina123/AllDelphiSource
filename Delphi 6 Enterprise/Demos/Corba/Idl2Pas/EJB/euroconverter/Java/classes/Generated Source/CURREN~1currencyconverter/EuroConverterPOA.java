package currencyconverter;

public abstract class EuroConverterPOA extends org.omg.PortableServer.Servant implements 
  org.omg.CORBA.portable.InvokeHandler, currencyconverter.EuroConverterOperations {

  public currencyconverter.EuroConverter _this () {
   return currencyconverter.EuroConverterHelper.narrow(super._this_object());
  }

  public currencyconverter.EuroConverter _this (org.omg.CORBA.ORB orb) {
    return currencyconverter.EuroConverterHelper.narrow(super._this_object(orb));
  }

  public java.lang.String[] _all_interfaces (final org.omg.PortableServer.POA poa, final byte[] objectId) {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "RMI:currencyconverter.EuroConverter:0000000000000000",
    "RMI:javax.ejb.EJBObject:0000000000000000"
  };

  private static java.util.Dictionary _methods = new java.util.Hashtable();

  static {
    _methods.put("hfl2float", new com.inprise.vbroker.CORBA.portable.MethodPointer(0, 0));
    _methods.put("_get_handle", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 0));
    _methods.put("_get_EJBHome", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 1));
    _methods.put("_get_primaryKey", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 2));
    _methods.put("remove", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 3));
    _methods.put("isIdentical", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 4));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (java.lang.String opName,
                                                      org.omg.CORBA.portable.InputStream _input,
                                                      org.omg.CORBA.portable.ResponseHandler handler) {
    com.inprise.vbroker.CORBA.portable.MethodPointer method =
      (com.inprise.vbroker.CORBA.portable.MethodPointer) _methods.get(opName);
    if (method == null) {
      throw new org.omg.CORBA.BAD_OPERATION();
    }
    switch (method.interface_id) {
      case 0: {
        return currencyconverter.EuroConverterPOA._invoke(this, method.method_id, _input, handler);
      }
      case 1: {
        return javax.ejb.EJBObjectPOA._invoke(this, method.method_id, _input, handler);
      }
    }
    throw new org.omg.CORBA.BAD_OPERATION();
  }

  public static org.omg.CORBA.portable.OutputStream _invoke (currencyconverter.EuroConverterOperations _self,
                                                             int _method_id,
                                                             org.omg.CORBA.portable.InputStream _input,
                                                             org.omg.CORBA.portable.ResponseHandler _handler) {
    org.omg.CORBA.portable.OutputStream _output = null;
    try {
      switch (_method_id) {
      case 0: {
        float arg0;
        arg0 = _input.read_float();
        float _result = _self.hfl2float(arg0);
        _output = _handler.createReply();
        _output.write_float((float)_result);
        return _output;
      }
      }
      throw new org.omg.CORBA.BAD_OPERATION();
    }
    catch (org.omg.CORBA.SystemException ex) {
      throw ex;
    }
    catch (Throwable ex) {
      throw new org.omg.CORBA.portable.UnknownException(ex);
    }
  }
}
