package currencyconverter;

import javax.naming.*;
import javax.rmi.PortableRemoteObject;

public class EuroConverterBeanTestClient1 {
  private static final String ERROR_NULL_REMOTE = "Remote interface reference is null.  It must be created by calling one of the Home interface methods first.";
  private static final int MAX_OUTPUT_LINE_LENGTH = 50;
  private boolean logging = true;
  private EuroConverterHome euroConverterHome = null;
  private EuroConverter euroConverter = null;

  /**Construct the EJB test client*/
  public EuroConverterBeanTestClient1() {
    long startTime = 0;
    if (logging) {
      log("Initializing bean access.");
      startTime = System.currentTimeMillis();
    }

    try {
      //get naming context
      Context ctx = new InitialContext();

      //look up jndi name
      Object ref = ctx.lookup("EuroConverter");

      //cast to Home interface
      euroConverterHome = (EuroConverterHome) PortableRemoteObject.narrow(ref, EuroConverterHome.class);
      if (logging) {
        long endTime = System.currentTimeMillis();
        log("Succeeded initializing bean access.");
        log("Execution time: " + (endTime - startTime) + " ms.");
      }
    }
    catch(Exception e) {
      if (logging) {
        log("Failed initializing bean access.");
      }
      e.printStackTrace();
    }
  }

  //----------------------------------------------------------------------------
  // Methods that use Home interface methods to generate a Remote interface reference
  //----------------------------------------------------------------------------

  public EuroConverter create() {
    long startTime = 0;
    if (logging) {
      log("Calling create()");
      startTime = System.currentTimeMillis();
    }
    try {
      euroConverter = euroConverterHome.create();
      if (logging) {
        long endTime = System.currentTimeMillis();
        log("Succeeded: create()");
        log("Execution time: " + (endTime - startTime) + " ms.");
      }
    }
    catch(Exception e) {
      if (logging) {
        log("Failed: create()");
      }
      e.printStackTrace();
    }

    if (logging) {
      log("Return value from create(): " + euroConverter + ".");
    }
    return euroConverter;
  }

  //----------------------------------------------------------------------------
  // Methods that use Remote interface methods to access data through the bean
  //----------------------------------------------------------------------------

  public float hfl2float(float amount) {
    float returnValue = 0f;
    if (euroConverter == null) {
      System.out.println("Error in hfl2float(): " + ERROR_NULL_REMOTE);
      return returnValue;
    }
    long startTime = 0;
    if (logging) {
      log("Calling hfl2float(" + amount + ")");
      startTime = System.currentTimeMillis();
    }

    try {
      returnValue = euroConverter.hfl2float(amount);
      if (logging) {
        long endTime = System.currentTimeMillis();
        log("Succeeded: hfl2float(" + amount + ")");
        log("Execution time: " + (endTime - startTime) + " ms.");
      }
    }
    catch(Exception e) {
      if (logging) {
        log("Failed: hfl2float(" + amount + ")");
      }
      e.printStackTrace();
    }

    if (logging) {
      log("Return value from hfl2float(" + amount + "): " + returnValue + ".");
    }
    return returnValue;
  }

  //----------------------------------------------------------------------------
  // Utility Methods
  //----------------------------------------------------------------------------

  private void log(String message) {
    if (message.length() > MAX_OUTPUT_LINE_LENGTH) {
      System.out.println("-- " + message.substring(0, MAX_OUTPUT_LINE_LENGTH) + " ...");
    }
    else {
      System.out.println("-- " + message);
    }
  }
  /**Main method*/

  public static void main(String[] args) {
    EuroConverterBeanTestClient1 client = new EuroConverterBeanTestClient1();
    // Use the client object to call one of the Home interface wrappers
    // above, to create a Remote interface reference to the bean. 
    // If the return value is of the Remote interface type, you can use it
    // to access the remote interface methods.  You can also just use the 
    // client object to call the Remote interface wrappers.
  }
}