package currencyconverter;

import java.rmi.*;
import javax.ejb.*;

public interface EuroConverter extends EJBObject {
  public float hfl2float(float amount) throws RemoteException;
}