package currencyconverter;

public abstract class EuroConverterHomePOA extends org.omg.PortableServer.Servant implements 
  org.omg.CORBA.portable.InvokeHandler, currencyconverter.EuroConverterHomeOperations {

  public currencyconverter.EuroConverterHome _this () {
   return currencyconverter.EuroConverterHomeHelper.narrow(super._this_object());
  }

  public currencyconverter.EuroConverterHome _this (org.omg.CORBA.ORB orb) {
    return currencyconverter.EuroConverterHomeHelper.narrow(super._this_object(orb));
  }

  public java.lang.String[] _all_interfaces (final org.omg.PortableServer.POA poa, final byte[] objectId) {
    return __ids;
  }

  private static java.lang.String[] __ids = {
    "RMI:currencyconverter.EuroConverterHome:0000000000000000",
    "RMI:javax.ejb.EJBHome:0000000000000000"
  };

  private static java.util.Dictionary _methods = new java.util.Hashtable();

  static {
    _methods.put("create", new com.inprise.vbroker.CORBA.portable.MethodPointer(0, 0));
    _methods.put("_get_EJBMetaData", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 0));
    _methods.put("_get_homeHandle", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 1));
    _methods.put("remove__java_lang_Object", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 2));
    _methods.put("remove__javax_ejb_Handle", new com.inprise.vbroker.CORBA.portable.MethodPointer(1, 3));
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
        return currencyconverter.EuroConverterHomePOA._invoke(this, method.method_id, _input, handler);
      }
      case 1: {
        return javax.ejb.EJBHomePOA._invoke(this, method.method_id, _input, handler);
      }
    }
    throw new org.omg.CORBA.BAD_OPERATION();
  }

  public static org.omg.CORBA.portable.OutputStream _invoke (currencyconverter.EuroConverterHomeOperations _self,
                                                             int _method_id,
                                                             org.omg.CORBA.portable.InputStream _input,
                                                             org.omg.CORBA.portable.ResponseHandler _handler) {
    org.omg.CORBA.portable.OutputStream _output = null;
    try {
      switch (_method_id) {
      case 0: {
      try {
        currencyconverter.EuroConverter _result = _self.create();
        _output = _handler.createReply();
        //FIX: Cannot use helper class because of potential stub downloading
        _output.write_Object((org.omg.CORBA.Object)_result);
      }
      catch (java.rmi.RemoteException e) {
        throw e;
      }
      catch (javax.ejb.CreateException _exception) {
        _output = _handler.createExceptionReply();
        _output.write_string("IDL:javax/ejb/CreateEx:1.0");
        ((org.omg.CORBA_2_3.portable.OutputStream)_output).write_value(_exception);
      }
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
