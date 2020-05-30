package currencyconverter;

public final class EuroConverterHolder implements org.omg.CORBA.portable.Streamable {
  public currencyconverter.EuroConverter value;

  public EuroConverterHolder () {
  }

  public EuroConverterHolder (final currencyconverter.EuroConverter _vis_value) {
    this.value = _vis_value;
  }

  public void _read (final org.omg.CORBA.portable.InputStream input) {
    value = currencyconverter.EuroConverterHelper.read(input);
  }

  public void _write (final org.omg.CORBA.portable.OutputStream output) {
    currencyconverter.EuroConverterHelper.write(output, value);
  }

  public org.omg.CORBA.TypeCode _type () {
    return currencyconverter.EuroConverterHelper.type();
  }
}
