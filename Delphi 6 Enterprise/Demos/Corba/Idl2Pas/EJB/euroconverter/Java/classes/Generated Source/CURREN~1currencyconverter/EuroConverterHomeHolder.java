package currencyconverter;

public final class EuroConverterHomeHolder implements org.omg.CORBA.portable.Streamable {
  public currencyconverter.EuroConverterHome value;

  public EuroConverterHomeHolder () {
  }

  public EuroConverterHomeHolder (final currencyconverter.EuroConverterHome _vis_value) {
    this.value = _vis_value;
  }

  public void _read (final org.omg.CORBA.portable.InputStream input) {
    value = currencyconverter.EuroConverterHomeHelper.read(input);
  }

  public void _write (final org.omg.CORBA.portable.OutputStream output) {
    currencyconverter.EuroConverterHomeHelper.write(output, value);
  }

  public org.omg.CORBA.TypeCode _type () {
    return currencyconverter.EuroConverterHomeHelper.type();
  }
}
