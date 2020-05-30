package currencyconverter;

/**
 * <ul>
 * <li> <b>IDL Source</b>    "C:/Projects/DelphiProjects/EuroConverter/ejb.idl"
 * <li> <b>IDL Name</b>      ::currencyconverter::EuroConverterHome
 * <li> <b>Repository Id</b> IDL:currencyconverter/EuroConverterHome:1.0
 * </ul>
 * <b>IDL definition:</b>
 * <pre>
 * interface EuroConverterHome : sidl.javax.ejb.EJBHome {
  ...
};
 * </pre>
 */
public interface EuroConverterHome extends currencyconverter.EuroConverterHomeOperations, sidl.javax.ejb.EJBHome, org.omg.CORBA.portable.IDLEntity {
}
