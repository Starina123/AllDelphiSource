package currencyconverter;

import java.rmi.*;
import javax.ejb.*;

public interface EuroConverterHome extends EJBHome {
  public EuroConverter create() throws RemoteException, CreateException;
}