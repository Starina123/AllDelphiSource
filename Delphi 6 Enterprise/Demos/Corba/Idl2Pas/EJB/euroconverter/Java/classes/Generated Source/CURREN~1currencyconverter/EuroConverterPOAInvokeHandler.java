package currencyconverter;

public class EuroConverterPOAInvokeHandler extends currencyconverter.EuroConverterPOA {
  private com.inprise.vbroker.rmi.CORBA.InvocationTarget _target;
  private static java.lang.reflect.Method _MethodPtrs[];
  private static void initMethodPointers () {
    try {
      _MethodPtrs = new java.lang.reflect.Method[] {
        currencyconverter.EuroConverter.class.getDeclaredMethod("hfl2float", new Class[]{java.lang.Float.TYPE}),
      };
    }
    catch (Exception e) {
      throw new Error(e.getMessage());
    }
  }
  static {initMethodPointers();}

  public EuroConverterPOAInvokeHandler (final com.inprise.vbroker.rmi.CORBA.InvocationTarget target) {
    this._target = target;
  }

  public com.inprise.vbroker.rmi.CORBA.InvocationTarget target () {
    return this._target;
  }

  public void target (final com.inprise.vbroker.rmi.CORBA.InvocationTarget target) {
    this._target = target;
  }

  public static float hfl2float (com.inprise.vbroker.rmi.CORBA.InvocationTarget _target,
                                 float arg0)
    throws java.rmi.RemoteException {
    java.lang.Object[] _args = {new java.lang.Float(arg0)};
    try {
      java.lang.Object _result = _target.invoke(_MethodPtrs[0], _args);
      return ((java.lang.Float)_result).floatValue();
    }
    catch (java.lang.reflect.InvocationTargetException ite) {
      final java.lang.Throwable t = ite.getTargetException();
      if (t instanceof java.rmi.RemoteException) {
        throw (java.rmi.RemoteException)t;
      }
      throw new org.omg.CORBA.UNKNOWN(t.getMessage());
    }
  }

  public javax.ejb.Handle getHandle ()
    throws java.rmi.RemoteException {
    return javax.ejb.EJBObjectPOAInvokeHandler.getHandle(_target);
  }
  public javax.ejb.EJBHome getEJBHome ()
    throws java.rmi.RemoteException {
    return javax.ejb.EJBObjectPOAInvokeHandler.getEJBHome(_target);
  }
  public java.lang.Object getPrimaryKey ()
    throws java.rmi.RemoteException {
    return javax.ejb.EJBObjectPOAInvokeHandler.getPrimaryKey(_target);
  }
  public void remove ()
    throws java.rmi.RemoteException, javax.ejb.RemoveException {
    javax.ejb.EJBObjectPOAInvokeHandler.remove(_target);
  }
  public boolean isIdentical (javax.ejb.EJBObject arg0)
    throws java.rmi.RemoteException {
    return javax.ejb.EJBObjectPOAInvokeHandler.isIdentical(_target, arg0);
  }
  public float hfl2float (float arg0)
    throws java.rmi.RemoteException {
    return currencyconverter.EuroConverterPOAInvokeHandler.hfl2float(_target, arg0);
  }
}
