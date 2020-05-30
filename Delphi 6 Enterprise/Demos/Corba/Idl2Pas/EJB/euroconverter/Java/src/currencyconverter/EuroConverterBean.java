package currencyconverter;

import java.rmi.*;
import javax.ejb.*;

public class EuroConverterBean implements SessionBean {
  private SessionContext sessionContext;
  public void ejbCreate() {
  }
  public void ejbRemove() {
  }
  public void ejbActivate() {
  }
  public void ejbPassivate() {
  }
  public void setSessionContext(SessionContext context) {
    sessionContext = context;
  }
  public float hfl2float(float amount) {
    return amount / 2.20371f;
  }
}