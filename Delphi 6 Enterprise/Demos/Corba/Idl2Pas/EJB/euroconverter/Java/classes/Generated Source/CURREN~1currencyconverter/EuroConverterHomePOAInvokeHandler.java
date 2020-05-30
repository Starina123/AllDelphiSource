package currencyconverter;

public class EuroConverterHomePOAInvokeHandler extends currencyconverter.EuroConverterHomePOA {
  private com.inprise.vbroker.rmi.CORBA.InvocationTarget _target;
  private static java.lang.reflect.Method _MethodPtrs[];
  private static void initMethodPointers () {
    try {
      _MethodPtrs = new java.lang.reflect.Method[] {
        currencyconverter.EuroConverterHome.class.getDeclaredMethod("create", new Class[]{}),
      };
    }
    catch (Exception e) {
      throw new Error(e.getMessage());
    }
  }
  static {initMethodPointers();}

  public EuroConverterHomePOAInvokeHandler (final com.inprise.vbroker.rmi.CORBA.InvocationTarget target) {
    this._target = target;
  }

  public com.inprise.vbroker.rmi.CORBA.InvocationTarget target () {
    return this._target;
  }

  public void target (final com.inprise.vbroker.rmi.CORBA.InvocationTarget target) {
    this._target = target;
  }

  public static currencyconverter.EuroConverter create (com.inprise.vbroker.rmi.CORBA.InvocationTarget _target)
    throws java.rmi.RemoteException, javax.ejb.CreateException {
    java.lang.Object[] _args = {};
    try {
      java.lang.Object _result = _target.invoke(_MethodPtrs[0], _args);
      return (currencyconverter.EuroConverter)_result;
    }
    catch (java.lang.reflect.InvocationTargetException ite) {
      final java.lang.Throwable t = ite.getTargetException();
      if (t instanceof javax.ejb.CreateException) {
        throw (javax.ejb.CreateException)t;
      }
      if (t instanceof java.rmi.RemoteException) {
        throw (java.rmi.RemoteException)t;
      }
      throw new org.omg.CORBA.UNKNOWN(t.getMessage());
    }
  }

  public javax.ejb.EJBMetaData getEJBMetaData ()
    throws java.rmi.RemoteException {
    return javax.ejb.EJBHomePOAInvokeHandler.getEJBMetaData(_target);
  }
  public javax.ejb.HomeHandle getHomeHandle ()
    throws java.rmi.RemoteException {
    return javax.ejb.EJBHomePOAInvokeHandler.getHomeHandle(_target);
  }
  public void remove (java.lang.Object arg0)
    throws java.rmi.RemoteException, javax.ejb.RemoveException {
    javax.ejb.EJBHomePOAInvokeHandler.remove(_target, arg0);
  }
  public void remove (javax.ejb.Handle arg0)
    throws java.rmi.RemoteException, javax.ejb.RemoveException {
    javax.ejb.EJBHomePOAInvokeHandler.remove(_target, arg0);
  }
  public currencyconverter.EuroConverter create ()
    throws java.rmi.RemoteException, javax.ejb.CreateException {
    return currencyconverter.EuroConverterHomePOAInvokeHandler.create(_target);
  }
}
