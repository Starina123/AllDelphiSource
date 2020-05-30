package currencyconverter;

public final class EuroConverterHelper {
  public static currencyconverter.EuroConverter narrow (final org.omg.CORBA.Object obj) {
    return narrow(obj, false);
  }

  public static currencyconverter.EuroConverter unchecked_narrow (org.omg.CORBA.Object obj) {
    return narrow(obj, true);
  }

  private static currencyconverter.EuroConverter narrow (final org.omg.CORBA.Object obj, final boolean is_a) {
    if (obj == null) {
      return null;
    }
    if (obj instanceof currencyconverter.EuroConverter) {
      return (currencyconverter.EuroConverter)obj;
    }
    if (is_a || obj._is_a(id())) {
      final org.omg.CORBA.portable.ObjectImpl _obj = (org.omg.CORBA.portable.ObjectImpl)obj;
      currencyconverter._EuroConverter_Stub result = new currencyconverter._EuroConverter_Stub();
      final org.omg.CORBA.portable.Delegate _delegate = _obj._get_delegate();
      result._set_delegate(_delegate);
      return result;
    }
    throw new org.omg.CORBA.BAD_PARAM();
  }

  public static currencyconverter.EuroConverter bind (org.omg.CORBA.ORB orb) {
    return bind(orb, null, null, null);
  }

  public static currencyconverter.EuroConverter bind (org.omg.CORBA.ORB orb, java.lang.String name) {
    return bind(orb, name, null, null);
  }

  public static currencyconverter.EuroConverter bind (org.omg.CORBA.ORB orb,
                                                      java.lang.String name,
                                                      java.lang.String host,
                                                      com.inprise.vbroker.CORBA.BindOptions _options) {
    if (!(orb instanceof com.inprise.vbroker.CORBA.ORB)) {
      throw new org.omg.CORBA.BAD_PARAM();
    }
    return narrow(((com.inprise.vbroker.CORBA.ORB)orb).bind(id(), name, host, _options), true);
  }

  public static currencyconverter.EuroConverter bind (org.omg.CORBA.ORB orb, java.lang.String fullPoaName, byte[] oid) {
    return bind(orb, fullPoaName, oid, null, null);
  }

  public static currencyconverter.EuroConverter bind (org.omg.CORBA.ORB orb,
                                                      java.lang.String fullPoaName,
                                                      byte[] oid,
                                                      java.lang.String host,
                                                      com.inprise.vbroker.CORBA.BindOptions _options) {
    if (!(orb instanceof com.inprise.vbroker.CORBA.ORB)) {
      throw new org.omg.CORBA.BAD_PARAM();
    }
    return narrow(((com.inprise.vbroker.CORBA.ORB)orb).bind(fullPoaName, oid, host, _options), true);
  }

  public java.lang.Object read_Object (final org.omg.CORBA.portable.InputStream istream) {
    return read(istream);
  }

  public void write_Object (final org.omg.CORBA.portable.OutputStream ostream, final java.lang.Object obj) {
    if (!(obj instanceof currencyconverter.EuroConverter)) {
      throw new org.omg.CORBA.BAD_PARAM();
    }
    write(ostream, (currencyconverter.EuroConverter)obj);
  }

  public java.lang.String get_id () {
    return id();
  }

  public org.omg.CORBA.TypeCode get_type () {
    return type();
  }

  private static org.omg.CORBA.TypeCode _type;
  private static boolean _initializing;

  private static org.omg.CORBA.ORB _orb () {
    return org.omg.CORBA.ORB.init();
  }

  public static currencyconverter.EuroConverter read (final org.omg.CORBA.portable.InputStream _input) {
    return narrow(_input.read_Object(currencyconverter.EuroConverter.class), true);
  }

  public static void write (final org.omg.CORBA.portable.OutputStream _output, final currencyconverter.EuroConverter _vis_value) {
    if (!(_output instanceof org.omg.CORBA_2_3.portable.OutputStream)) {
      throw new org.omg.CORBA.BAD_PARAM();
    }
    _output.write_Object((org.omg.CORBA.Object)_vis_value);
  }

  public static void insert (final org.omg.CORBA.Any any, final currencyconverter.EuroConverter _vis_value) {
    any.insert_Object((org.omg.CORBA.Object)_vis_value, currencyconverter.EuroConverterHelper.type());
  }

  public static currencyconverter.EuroConverter extract (final org.omg.CORBA.Any any) {
    currencyconverter.EuroConverter _vis_value;
    final org.omg.CORBA.Object _obj = any.extract_Object();
    _vis_value = currencyconverter.EuroConverterHelper.narrow(_obj);
    return _vis_value;
  }

  public static org.omg.CORBA.TypeCode type () {
    if (_type == null) {
      synchronized (org.omg.CORBA.TypeCode.class) {
        if (_type == null) {
          _type = _orb().create_interface_tc(id(), "EuroConverter");
        }
      }
    }
    return _type;
  }

  public static java.lang.String id () {
    return "RMI:currencyconverter.EuroConverter:0000000000000000";
  }
}
