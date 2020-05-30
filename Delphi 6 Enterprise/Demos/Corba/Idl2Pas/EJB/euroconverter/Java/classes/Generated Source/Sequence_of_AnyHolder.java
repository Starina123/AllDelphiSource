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
public final class Sequence_of_AnyHolder implements org.omg.CORBA.portable.Streamable {
  public org.omg.CORBA.Any[] value;

  public Sequence_of_AnyHolder () {
  }

  public Sequence_of_AnyHolder (final org.omg.CORBA.Any[] _vis_value) {
    this.value = _vis_value;
  }

  public void _read (final org.omg.CORBA.portable.InputStream input) {
    value = Sequence_of_AnyHelper.read(input);
  }

  public void _write (final org.omg.CORBA.portable.OutputStream output) {
    Sequence_of_AnyHelper.write(output, value);
  }

  public org.omg.CORBA.TypeCode _type () {
    return Sequence_of_AnyHelper.type();
  }
}
