/**
 * <ul>
 * <li> <b>IDL Source</b>    "C:/Projects/DelphiProjects/EuroConverter/ejb.idl"
 * <li> <b>IDL Name</b>      ::Sequence_of_Any
 * <li> <b>Repository Id</b> IDL:Sequence_of_Any:1.0
 * </ul>
 * <b>IDL definition:</b>
 * <pre>
 * typedef sequence&ltany&gt Sequence_of_Any;
 * </pre>
 */
public final class Sequence_of_AnyHelper {
  private static org.omg.CORBA.TypeCode _type;
  private static boolean _initializing;

  private static org.omg.CORBA.ORB _orb () {
    return org.omg.CORBA.ORB.init();
  }

  public static org.omg.CORBA.Any[] read (final org.omg.CORBA.portable.InputStream _input) {
    org.omg.CORBA.Any[] result;
    final int $length0 = _input.read_long();
    result = new org.omg.CORBA.Any[$length0];
    for (int $counter1 = 0; $counter1 < $length0; $counter1++) {
      result[$counter1] = _input.read_any();
    }
    return result;
  }

  public static void write (final org.omg.CORBA.portable.OutputStream _output, final org.omg.CORBA.Any[] _vis_value) {
    _output.write_long(_vis_value.length);
    for (int $counter2 = 0;  $counter2 < _vis_value.length; $counter2++) {
      _output.write_any((org.omg.CORBA.Any)_vis_value[$counter2]);
    }
  }

  public static void insert (final org.omg.CORBA.Any any, final org.omg.CORBA.Any[] _vis_value) {
    any.type(Sequence_of_AnyHelper.type());
    any.insert_Streamable(new Sequence_of_AnyHolder(_vis_value));
  }

  public static org.omg.CORBA.Any[] extract (final org.omg.CORBA.Any any) {
    org.omg.CORBA.Any[] _vis_value;
    if (any instanceof com.inprise.vbroker.CORBA.Any) {
      Sequence_of_AnyHolder _vis_holder = new Sequence_of_AnyHolder();
      ((com.inprise.vbroker.CORBA.Any)any).extract_Streamable(_vis_holder);
      _vis_value = _vis_holder.value;
    } else {
      _vis_value = Sequence_of_AnyHelper.read(any.create_input_stream());
    }
    return _vis_value;
  }

  public static org.omg.CORBA.TypeCode type () {
    if (_type == null) {
      synchronized (org.omg.CORBA.TypeCode.class) {
        if (_type == null) {
          org.omg.CORBA.TypeCode originalType = _orb().create_sequence_tc(0, _orb().get_primitive_tc(org.omg.CORBA.TCKind.tk_any));
          _type = _orb().create_alias_tc(id(), "Sequence_of_Any", originalType);
        }
      }
    }
    return _type;
  }

  public static java.lang.String id () {
    return "IDL:Sequence_of_Any:1.0";
  }
}
