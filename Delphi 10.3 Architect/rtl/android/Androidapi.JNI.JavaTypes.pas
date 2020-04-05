{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.JavaTypes;

interface

uses
  Androidapi.JNIBridge;

type
// ===== Forward declarations =====

  JObject = interface;//java.lang.Object
  JInputStream = interface;//java.io.InputStream
  JByteArrayInputStream = interface;//java.io.ByteArrayInputStream
  JOutputStream = interface;//java.io.OutputStream
  JByteArrayOutputStream = interface;//java.io.ByteArrayOutputStream
  JAutoCloseable = interface;//java.lang.AutoCloseable
  JCloseable = interface;//java.io.Closeable
  JFile = interface;//java.io.File
  JFileDescriptor = interface;//java.io.FileDescriptor
  JFileFilter = interface;//java.io.FileFilter
  JFileInputStream = interface;//java.io.FileInputStream
  JFileOutputStream = interface;//java.io.FileOutputStream
  JFilenameFilter = interface;//java.io.FilenameFilter
  JFilterOutputStream = interface;//java.io.FilterOutputStream
  JThrowable = interface;//java.lang.Throwable
  JException = interface;//java.lang.Exception
  JIOException = interface;//java.io.IOException
  JPrintStream = interface;//java.io.PrintStream
  JWriter = interface;//java.io.Writer
  JPrintWriter = interface;//java.io.PrintWriter
  JRandomAccessFile = interface;//java.io.RandomAccessFile
  JReader = interface;//java.io.Reader
  JSerializable = interface;//java.io.Serializable
  JAbstractStringBuilder = interface;//java.lang.AbstractStringBuilder
  JAppendable = interface;//java.lang.Appendable
  JBoolean = interface;//java.lang.Boolean
  JNumber = interface;//java.lang.Number
  JByte = interface;//java.lang.Byte
  JCharSequence = interface;//java.lang.CharSequence
  Jlang_Class = interface;//java.lang.Class
  JClassLoader = interface;//java.lang.ClassLoader
  JCloneable = interface;//java.lang.Cloneable
  JComparable = interface;//java.lang.Comparable
  JDouble = interface;//java.lang.Double
  JEnum = interface;//java.lang.Enum
  JFloat = interface;//java.lang.Float
  JRuntimeException = interface;//java.lang.RuntimeException
  JIllegalStateException = interface;//java.lang.IllegalStateException
  JInteger = interface;//java.lang.Integer
  JIterable = interface;//java.lang.Iterable
  JLong = interface;//java.lang.Long
  JPackage = interface;//java.lang.Package
  JRunnable = interface;//java.lang.Runnable
  JShort = interface;//java.lang.Short
  JStackTraceElement = interface;//java.lang.StackTraceElement
  JString = interface;//java.lang.String
  JStringBuffer = interface;//java.lang.StringBuffer
  JStringBuilder = interface;//java.lang.StringBuilder
  JThread = interface;//java.lang.Thread
  JThread_State = interface;//java.lang.Thread$State
  JThread_UncaughtExceptionHandler = interface;//java.lang.Thread$UncaughtExceptionHandler
  JThreadGroup = interface;//java.lang.ThreadGroup
  JAnnotation = interface;//java.lang.annotation.Annotation
  JAccessibleObject = interface;//java.lang.reflect.AccessibleObject
  JAnnotatedElement = interface;//java.lang.reflect.AnnotatedElement
  JExecutable = interface;//java.lang.reflect.Executable
  JConstructor = interface;//java.lang.reflect.Constructor
  JField = interface;//java.lang.reflect.Field
  JGenericDeclaration = interface;//java.lang.reflect.GenericDeclaration
  JMethod = interface;//java.lang.reflect.Method
  JParameter = interface;//java.lang.reflect.Parameter
  Jreflect_Type = interface;//java.lang.reflect.Type
  JTypeVariable = interface;//java.lang.reflect.TypeVariable
  JBigInteger = interface;//java.math.BigInteger
  JBuffer = interface;//java.nio.Buffer
  JByteBuffer = interface;//java.nio.ByteBuffer
  JByteOrder = interface;//java.nio.ByteOrder
  JCharBuffer = interface;//java.nio.CharBuffer
  JDoubleBuffer = interface;//java.nio.DoubleBuffer
  JFloatBuffer = interface;//java.nio.FloatBuffer
  JIntBuffer = interface;//java.nio.IntBuffer
  JLongBuffer = interface;//java.nio.LongBuffer
  JMappedByteBuffer = interface;//java.nio.MappedByteBuffer
  JShortBuffer = interface;//java.nio.ShortBuffer
  JAsynchronousFileChannel = interface;//java.nio.channels.AsynchronousFileChannel
  JChannel = interface;//java.nio.channels.Channel
  JReadableByteChannel = interface;//java.nio.channels.ReadableByteChannel
  JByteChannel = interface;//java.nio.channels.ByteChannel
  JCompletionHandler = interface;//java.nio.channels.CompletionHandler
  JAbstractInterruptibleChannel = interface;//java.nio.channels.spi.AbstractInterruptibleChannel
  JSelectableChannel = interface;//java.nio.channels.SelectableChannel
  JAbstractSelectableChannel = interface;//java.nio.channels.spi.AbstractSelectableChannel
  JDatagramChannel = interface;//java.nio.channels.DatagramChannel
  JFileChannel = interface;//java.nio.channels.FileChannel
  JFileChannel_MapMode = interface;//java.nio.channels.FileChannel$MapMode
  JFileLock = interface;//java.nio.channels.FileLock
  JPipe = interface;//java.nio.channels.Pipe
  JPipe_SinkChannel = interface;//java.nio.channels.Pipe$SinkChannel
  JPipe_SourceChannel = interface;//java.nio.channels.Pipe$SourceChannel
  JSeekableByteChannel = interface;//java.nio.channels.SeekableByteChannel
  JSelectionKey = interface;//java.nio.channels.SelectionKey
  JSelector = interface;//java.nio.channels.Selector
  JServerSocketChannel = interface;//java.nio.channels.ServerSocketChannel
  JSocketChannel = interface;//java.nio.channels.SocketChannel
  JWritableByteChannel = interface;//java.nio.channels.WritableByteChannel
  JAbstractSelector = interface;//java.nio.channels.spi.AbstractSelector
  JSelectorProvider = interface;//java.nio.channels.spi.SelectorProvider
  JCharset = interface;//java.nio.charset.Charset
  JCharsetDecoder = interface;//java.nio.charset.CharsetDecoder
  JCharsetEncoder = interface;//java.nio.charset.CharsetEncoder
  JCoderResult = interface;//java.nio.charset.CoderResult
  JCodingErrorAction = interface;//java.nio.charset.CodingErrorAction
  JAccessMode = interface;//java.nio.file.AccessMode
  JCopyOption = interface;//java.nio.file.CopyOption
  JDirectoryStream = interface;//java.nio.file.DirectoryStream
  JDirectoryStream_Filter = interface;//java.nio.file.DirectoryStream$Filter
  JFileStore = interface;//java.nio.file.FileStore
  JFileSystem = interface;//java.nio.file.FileSystem
  JLinkOption = interface;//java.nio.file.LinkOption
  JOpenOption = interface;//java.nio.file.OpenOption
  Jfile_Path = interface;//java.nio.file.Path
  JPathMatcher = interface;//java.nio.file.PathMatcher
  JWatchEvent_Kind = interface;//java.nio.file.WatchEvent$Kind
  JWatchEvent_Modifier = interface;//java.nio.file.WatchEvent$Modifier
  JWatchKey = interface;//java.nio.file.WatchKey
  JWatchService = interface;//java.nio.file.WatchService
  JWatchable = interface;//java.nio.file.Watchable
  JAttributeView = interface;//java.nio.file.attribute.AttributeView
  JBasicFileAttributes = interface;//java.nio.file.attribute.BasicFileAttributes
  JFileAttribute = interface;//java.nio.file.attribute.FileAttribute
  JFileAttributeView = interface;//java.nio.file.attribute.FileAttributeView
  JFileStoreAttributeView = interface;//java.nio.file.attribute.FileStoreAttributeView
  JFileTime = interface;//java.nio.file.attribute.FileTime
  //JUserPrincipal = interface;//java.nio.file.attribute.UserPrincipal
  //JGroupPrincipal = interface;//java.nio.file.attribute.GroupPrincipal
  JUserPrincipalLookupService = interface;//java.nio.file.attribute.UserPrincipalLookupService
  JFileSystemProvider = interface;//java.nio.file.spi.FileSystemProvider
  JCharacterIterator = interface;//java.text.CharacterIterator
  JAttributedCharacterIterator = interface;//java.text.AttributedCharacterIterator
  JAttributedCharacterIterator_Attribute = interface;//java.text.AttributedCharacterIterator$Attribute
  JFieldPosition = interface;//java.text.FieldPosition
  JFormat = interface;//java.text.Format
  JFormat_Field = interface;//java.text.Format$Field
  JParsePosition = interface;//java.text.ParsePosition
  JClock = interface;//java.time.Clock
  JDayOfWeek = interface;//java.time.DayOfWeek
  Jtime_Duration = interface;//java.time.Duration
  JInstant = interface;//java.time.Instant
  JLocalDate = interface;//java.time.LocalDate
  JLocalDateTime = interface;//java.time.LocalDateTime
  JLocalTime = interface;//java.time.LocalTime
  JMonth = interface;//java.time.Month
  JOffsetDateTime = interface;//java.time.OffsetDateTime
  JOffsetTime = interface;//java.time.OffsetTime
  JPeriod = interface;//java.time.Period
  JZoneId = interface;//java.time.ZoneId
  JZoneOffset = interface;//java.time.ZoneOffset
  JZonedDateTime = interface;//java.time.ZonedDateTime
  JAbstractChronology = interface;//java.time.chrono.AbstractChronology
  JChronoLocalDate = interface;//java.time.chrono.ChronoLocalDate
  JChronoLocalDateTime = interface;//java.time.chrono.ChronoLocalDateTime
  JTemporalAmount = interface;//java.time.temporal.TemporalAmount
  JChronoPeriod = interface;//java.time.chrono.ChronoPeriod
  JChronoZonedDateTime = interface;//java.time.chrono.ChronoZonedDateTime
  JChronology = interface;//java.time.chrono.Chronology
  JTemporalAccessor = interface;//java.time.temporal.TemporalAccessor
  JEra = interface;//java.time.chrono.Era
  JIsoChronology = interface;//java.time.chrono.IsoChronology
  JIsoEra = interface;//java.time.chrono.IsoEra
  JDateTimeFormatter = interface;//java.time.format.DateTimeFormatter
  JDecimalStyle = interface;//java.time.format.DecimalStyle
  JFormatStyle = interface;//java.time.format.FormatStyle
  JResolverStyle = interface;//java.time.format.ResolverStyle
  JTextStyle = interface;//java.time.format.TextStyle
  JChronoField = interface;//java.time.temporal.ChronoField
  JTemporal = interface;//java.time.temporal.Temporal
  JTemporalAdjuster = interface;//java.time.temporal.TemporalAdjuster
  JTemporalField = interface;//java.time.temporal.TemporalField
  JTemporalQuery = interface;//java.time.temporal.TemporalQuery
  JTemporalUnit = interface;//java.time.temporal.TemporalUnit
  JValueRange = interface;//java.time.temporal.ValueRange
  JZoneOffsetTransition = interface;//java.time.zone.ZoneOffsetTransition
  JZoneRules = interface;//java.time.zone.ZoneRules
  JAbstractCollection = interface;//java.util.AbstractCollection
  JAbstractList = interface;//java.util.AbstractList
  JAbstractMap = interface;//java.util.AbstractMap
  JAbstractSet = interface;//java.util.AbstractSet
  JArrayList = interface;//java.util.ArrayList
  JBitSet = interface;//java.util.BitSet
  JCalendar = interface;//java.util.Calendar
  JCollection = interface;//java.util.Collection
  JComparator = interface;//java.util.Comparator
  JDate = interface;//java.util.Date
  JDictionary = interface;//java.util.Dictionary
  JDoubleSummaryStatistics = interface;//java.util.DoubleSummaryStatistics
  JEnumSet = interface;//java.util.EnumSet
  JEnumeration = interface;//java.util.Enumeration
  JGregorianCalendar = interface;//java.util.GregorianCalendar
  JHashMap = interface;//java.util.HashMap
  JHashSet = interface;//java.util.HashSet
  JHashtable = interface;//java.util.Hashtable
  JIntSummaryStatistics = interface;//java.util.IntSummaryStatistics
  JIterator = interface;//java.util.Iterator
  JList = interface;//java.util.List
  JListIterator = interface;//java.util.ListIterator
  JLocale = interface;//java.util.Locale
  JLocale_Category = interface;//java.util.Locale$Category
  JLocale_FilteringMode = interface;//java.util.Locale$FilteringMode
  JLongSummaryStatistics = interface;//java.util.LongSummaryStatistics
  JMap = interface;//java.util.Map
  Jutil_Observable = interface;//java.util.Observable
  JObserver = interface;//java.util.Observer
  JOptional = interface;//java.util.Optional
  JOptionalDouble = interface;//java.util.OptionalDouble
  JOptionalInt = interface;//java.util.OptionalInt
  JOptionalLong = interface;//java.util.OptionalLong
  JPrimitiveIterator = interface;//java.util.PrimitiveIterator
  JPrimitiveIterator_OfDouble = interface;//java.util.PrimitiveIterator$OfDouble
  JPrimitiveIterator_OfInt = interface;//java.util.PrimitiveIterator$OfInt
  JPrimitiveIterator_OfLong = interface;//java.util.PrimitiveIterator$OfLong
  JProperties = interface;//java.util.Properties
  JQueue = interface;//java.util.Queue
  JRandom = interface;//java.util.Random
  JSet = interface;//java.util.Set
  JSortedMap = interface;//java.util.SortedMap
  JSpliterator = interface;//java.util.Spliterator
  JSpliterator_OfPrimitive = interface;//java.util.Spliterator$OfPrimitive
  JSpliterator_OfDouble = interface;//java.util.Spliterator$OfDouble
  JSpliterator_OfInt = interface;//java.util.Spliterator$OfInt
  JSpliterator_OfLong = interface;//java.util.Spliterator$OfLong
  JTimeZone = interface;//java.util.TimeZone
  JTimer = interface;//java.util.Timer
  JTimerTask = interface;//java.util.TimerTask
  JUUID = interface;//java.util.UUID
  JAbstractExecutorService = interface;//java.util.concurrent.AbstractExecutorService
  JBlockingQueue = interface;//java.util.concurrent.BlockingQueue
  JCallable = interface;//java.util.concurrent.Callable
  JCountDownLatch = interface;//java.util.concurrent.CountDownLatch
  JDelayed = interface;//java.util.concurrent.Delayed
  JExecutor = interface;//java.util.concurrent.Executor
  JExecutorService = interface;//java.util.concurrent.ExecutorService
  JFuture = interface;//java.util.concurrent.Future
  JRejectedExecutionHandler = interface;//java.util.concurrent.RejectedExecutionHandler
  JScheduledFuture = interface;//java.util.concurrent.ScheduledFuture
  JThreadPoolExecutor = interface;//java.util.concurrent.ThreadPoolExecutor
  JScheduledThreadPoolExecutor = interface;//java.util.concurrent.ScheduledThreadPoolExecutor
  JThreadFactory = interface;//java.util.concurrent.ThreadFactory
  JTimeUnit = interface;//java.util.concurrent.TimeUnit
  JBiConsumer = interface;//java.util.function.BiConsumer
  JBiFunction = interface;//java.util.function.BiFunction
  JBinaryOperator = interface;//java.util.function.BinaryOperator
  JConsumer = interface;//java.util.function.Consumer
  JDoubleBinaryOperator = interface;//java.util.function.DoubleBinaryOperator
  JDoubleConsumer = interface;//java.util.function.DoubleConsumer
  JDoubleFunction = interface;//java.util.function.DoubleFunction
  JDoublePredicate = interface;//java.util.function.DoublePredicate
  JDoubleSupplier = interface;//java.util.function.DoubleSupplier
  JDoubleToIntFunction = interface;//java.util.function.DoubleToIntFunction
  JDoubleToLongFunction = interface;//java.util.function.DoubleToLongFunction
  JDoubleUnaryOperator = interface;//java.util.function.DoubleUnaryOperator
  JFunction = interface;//java.util.function.Function
  JIntBinaryOperator = interface;//java.util.function.IntBinaryOperator
  JIntConsumer = interface;//java.util.function.IntConsumer
  JIntFunction = interface;//java.util.function.IntFunction
  JIntPredicate = interface;//java.util.function.IntPredicate
  JIntSupplier = interface;//java.util.function.IntSupplier
  JIntToDoubleFunction = interface;//java.util.function.IntToDoubleFunction
  JIntToLongFunction = interface;//java.util.function.IntToLongFunction
  JIntUnaryOperator = interface;//java.util.function.IntUnaryOperator
  JLongBinaryOperator = interface;//java.util.function.LongBinaryOperator
  JLongConsumer = interface;//java.util.function.LongConsumer
  JLongFunction = interface;//java.util.function.LongFunction
  JLongPredicate = interface;//java.util.function.LongPredicate
  JLongSupplier = interface;//java.util.function.LongSupplier
  JLongToDoubleFunction = interface;//java.util.function.LongToDoubleFunction
  JLongToIntFunction = interface;//java.util.function.LongToIntFunction
  JLongUnaryOperator = interface;//java.util.function.LongUnaryOperator
  JObjDoubleConsumer = interface;//java.util.function.ObjDoubleConsumer
  JObjIntConsumer = interface;//java.util.function.ObjIntConsumer
  JObjLongConsumer = interface;//java.util.function.ObjLongConsumer
  Jfunction_Predicate = interface;//java.util.function.Predicate
  JSupplier = interface;//java.util.function.Supplier
  JToDoubleFunction = interface;//java.util.function.ToDoubleFunction
  JToIntFunction = interface;//java.util.function.ToIntFunction
  JToLongFunction = interface;//java.util.function.ToLongFunction
  JUnaryOperator = interface;//java.util.function.UnaryOperator
  JBaseStream = interface;//java.util.stream.BaseStream
  JCollector = interface;//java.util.stream.Collector
  JCollector_Characteristics = interface;//java.util.stream.Collector$Characteristics
  JDoubleStream = interface;//java.util.stream.DoubleStream
  JDoubleStream_Builder = interface;//java.util.stream.DoubleStream$Builder
  JIntStream = interface;//java.util.stream.IntStream
  JIntStream_Builder = interface;//java.util.stream.IntStream$Builder
  JLongStream = interface;//java.util.stream.LongStream
  JLongStream_Builder = interface;//java.util.stream.LongStream$Builder
  JStream = interface;//java.util.stream.Stream
  JStream_Builder = interface;//java.util.stream.Stream$Builder
  //JSecretKey = interface;//javax.crypto.SecretKey
  JEGL = interface;//javax.microedition.khronos.egl.EGL
  JEGL10 = interface;//javax.microedition.khronos.egl.EGL10
  JEGLConfig = interface;//javax.microedition.khronos.egl.EGLConfig
  JEGLContext = interface;//javax.microedition.khronos.egl.EGLContext
  JEGLDisplay = interface;//javax.microedition.khronos.egl.EGLDisplay
  JEGLSurface = interface;//javax.microedition.khronos.egl.EGLSurface
  JGL = interface;//javax.microedition.khronos.opengles.GL
  JGL10 = interface;//javax.microedition.khronos.opengles.GL10
  JJSONArray = interface;//org.json.JSONArray
  JJSONException = interface;//org.json.JSONException
  JJSONObject = interface;//org.json.JSONObject
  JJSONTokener = interface;//org.json.JSONTokener
  JXmlPullParser = interface;//org.xmlpull.v1.XmlPullParser
  JXmlSerializer = interface;//org.xmlpull.v1.XmlSerializer

// ===== Interface declarations =====

  JObjectClass = interface(IJavaClass)
    ['{83BD30EE-FE9B-470D-AD6C-23AEAABB7FFA}']
    {class} function init: JObject; cdecl;
  end;

  [JavaSignature('java/lang/Object')]
  JObject = interface(IJavaInstance)
    ['{32321F8A-4001-4BF8-92E7-6190D070988D}']
    function equals(obj: JObject): Boolean; cdecl;
    function getClass: Jlang_Class; cdecl;
    function hashCode: Integer; cdecl;
    procedure notify; cdecl;
    procedure notifyAll; cdecl;
    function toString: JString; cdecl;
    procedure wait(millis: Int64); cdecl; overload;
    procedure wait(millis: Int64; nanos: Integer); cdecl; overload;
    procedure wait; cdecl; overload;
  end;
  TJObject = class(TJavaGenericImport<JObjectClass, JObject>) end;

  JInputStreamClass = interface(JObjectClass)
    ['{8D8C2F8A-AD54-42D0-ADA4-FC30FD95A933}']
    {class} function init: JInputStream; cdecl;
  end;

  [JavaSignature('java/io/InputStream')]
  JInputStream = interface(JObject)
    ['{5FD3C203-8A19-42A2-8FD2-643501DF62BC}']
    function available: Integer; cdecl;
    procedure close; cdecl;
    procedure mark(readlimit: Integer); cdecl;
    function markSupported: Boolean; cdecl;
    function read: Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>): Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;
    procedure reset; cdecl;
    function skip(n: Int64): Int64; cdecl;
  end;
  TJInputStream = class(TJavaGenericImport<JInputStreamClass, JInputStream>) end;

  JByteArrayInputStreamClass = interface(JInputStreamClass)
    ['{1C0763C7-3F23-4531-A6E1-65AF97251C2F}']
    {class} function init(buf: TJavaArray<Byte>): JByteArrayInputStream; cdecl; overload;
    {class} function init(buf: TJavaArray<Byte>; offset: Integer; length: Integer): JByteArrayInputStream; cdecl; overload;
  end;

  [JavaSignature('java/io/ByteArrayInputStream')]
  JByteArrayInputStream = interface(JInputStream)
    ['{D8AE245D-6831-48AC-A6F5-1E480815A22D}']
    function available: Integer; cdecl;
    procedure close; cdecl;
    procedure mark(readAheadLimit: Integer); cdecl;
    function markSupported: Boolean; cdecl;
    function read: Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;
    procedure reset; cdecl;
    function skip(n: Int64): Int64; cdecl;
  end;
  TJByteArrayInputStream = class(TJavaGenericImport<JByteArrayInputStreamClass, JByteArrayInputStream>) end;

  JOutputStreamClass = interface(JObjectClass)
    ['{769D969C-3DFB-417B-8B7E-AA5662FB1539}']
    {class} function init: JOutputStream; cdecl;
  end;

  [JavaSignature('java/io/OutputStream')]
  JOutputStream = interface(JObject)
    ['{308A10DA-ACF9-4EC3-B4BD-D9F9CEEB29A5}']
    procedure close; cdecl;
    procedure flush; cdecl;
    procedure write(b: Integer); cdecl; overload;
    procedure write(b: TJavaArray<Byte>); cdecl; overload;
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
  end;
  TJOutputStream = class(TJavaGenericImport<JOutputStreamClass, JOutputStream>) end;

  JByteArrayOutputStreamClass = interface(JOutputStreamClass)
    ['{2F08E462-5F49-4A89-9ACD-F0A5CD01C3A8}']
    {class} function init: JByteArrayOutputStream; cdecl; overload;
    {class} function init(size: Integer): JByteArrayOutputStream; cdecl; overload;
  end;

  [JavaSignature('java/io/ByteArrayOutputStream')]
  JByteArrayOutputStream = interface(JOutputStream)
    ['{6AD653C4-3A67-4CCD-9B53-2E57D0DC0727}']
    procedure close; cdecl;
    procedure reset; cdecl;
    function size: Integer; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function toString: JString; cdecl; overload;
    function toString(charsetName: JString): JString; cdecl; overload;
    function toString(hibyte: Integer): JString; cdecl; overload;//Deprecated
    procedure write(b: Integer); cdecl; overload;
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
    procedure writeTo(out_: JOutputStream); cdecl;
  end;
  TJByteArrayOutputStream = class(TJavaGenericImport<JByteArrayOutputStreamClass, JByteArrayOutputStream>) end;

  JAutoCloseableClass = interface(IJavaClass)
    ['{BC0BF424-12A8-4AA4-ABC4-29A2BCE762E3}']
  end;

  [JavaSignature('java/lang/AutoCloseable')]
  JAutoCloseable = interface(IJavaInstance)
    ['{48D31CFB-52DE-4C24-985E-3601B839C436}']
    procedure close; cdecl;
  end;
  TJAutoCloseable = class(TJavaGenericImport<JAutoCloseableClass, JAutoCloseable>) end;

  JCloseableClass = interface(JAutoCloseableClass)
    ['{CAFF3044-E3EC-444F-AF50-403A65BFA20B}']
  end;

  [JavaSignature('java/io/Closeable')]
  JCloseable = interface(JAutoCloseable)
    ['{DD3E86BD-46E1-44D8-84DD-B7607A3F9C56}']
    procedure close; cdecl;
  end;
  TJCloseable = class(TJavaGenericImport<JCloseableClass, JCloseable>) end;

  JFileClass = interface(JObjectClass)
    ['{D2CE81B7-01CE-468B-A2F2-B85DD35642EC}']
    {class} function _GetpathSeparator: JString; cdecl;
    {class} function _GetpathSeparatorChar: Char; cdecl;
    {class} function _Getseparator: JString; cdecl;
    {class} function _GetseparatorChar: Char; cdecl;
    {class} function init(pathname: JString): JFile; cdecl; overload;
    {class} function init(parent: JString; child: JString): JFile; cdecl; overload;
    {class} function init(parent: JFile; child: JString): JFile; cdecl; overload;
    {class} //function init(uri: JURI): JFile; cdecl; overload;
    {class} function createTempFile(prefix: JString; suffix: JString; directory: JFile): JFile; cdecl; overload;
    {class} function createTempFile(prefix: JString; suffix: JString): JFile; cdecl; overload;
    {class} function listRoots: TJavaObjectArray<JFile>; cdecl;
    {class} property pathSeparator: JString read _GetpathSeparator;
    {class} property pathSeparatorChar: Char read _GetpathSeparatorChar;
    {class} property separator: JString read _Getseparator;
    {class} property separatorChar: Char read _GetseparatorChar;
  end;

  [JavaSignature('java/io/File')]
  JFile = interface(JObject)
    ['{38C3EB7E-315A-47D2-9052-1E61170EB37F}']
    function canExecute: Boolean; cdecl;
    function canRead: Boolean; cdecl;
    function canWrite: Boolean; cdecl;
    function compareTo(pathname: JFile): Integer; cdecl;
    function createNewFile: Boolean; cdecl;
    function delete: Boolean; cdecl;
    procedure deleteOnExit; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function exists: Boolean; cdecl;
    function getAbsoluteFile: JFile; cdecl;
    function getAbsolutePath: JString; cdecl;
    function getCanonicalFile: JFile; cdecl;
    function getCanonicalPath: JString; cdecl;
    function getFreeSpace: Int64; cdecl;
    function getName: JString; cdecl;
    function getParent: JString; cdecl;
    function getParentFile: JFile; cdecl;
    function getPath: JString; cdecl;
    function getTotalSpace: Int64; cdecl;
    function getUsableSpace: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function isAbsolute: Boolean; cdecl;
    function isDirectory: Boolean; cdecl;
    function isFile: Boolean; cdecl;
    function isHidden: Boolean; cdecl;
    function lastModified: Int64; cdecl;
    function length: Int64; cdecl;
    function list: TJavaObjectArray<JString>; cdecl; overload;
    function list(filter: JFilenameFilter): TJavaObjectArray<JString>; cdecl; overload;
    function listFiles: TJavaObjectArray<JFile>; cdecl; overload;
    function listFiles(filter: JFilenameFilter): TJavaObjectArray<JFile>; cdecl; overload;
    function listFiles(filter: JFileFilter): TJavaObjectArray<JFile>; cdecl; overload;
    function mkdir: Boolean; cdecl;
    function mkdirs: Boolean; cdecl;
    function renameTo(dest: JFile): Boolean; cdecl;
    function setExecutable(executable: Boolean; ownerOnly: Boolean): Boolean; cdecl; overload;
    function setExecutable(executable: Boolean): Boolean; cdecl; overload;
    function setLastModified(time: Int64): Boolean; cdecl;
    function setReadOnly: Boolean; cdecl;
    function setReadable(readable: Boolean; ownerOnly: Boolean): Boolean; cdecl; overload;
    function setReadable(readable: Boolean): Boolean; cdecl; overload;
    function setWritable(writable: Boolean; ownerOnly: Boolean): Boolean; cdecl; overload;
    function setWritable(writable: Boolean): Boolean; cdecl; overload;
    function toPath: Jfile_Path; cdecl;
    function toString: JString; cdecl;
    //function toURI: JURI; cdecl;
    //function toURL: JURL; cdecl;//Deprecated
  end;
  TJFile = class(TJavaGenericImport<JFileClass, JFile>) end;

  JFileDescriptorClass = interface(JObjectClass)
    ['{B01F2343-4F8E-4FF8-838E-8FB9CFE304E2}']
    {class} function _Geterr: JFileDescriptor; cdecl;
    {class} function _Getin: JFileDescriptor; cdecl;
    {class} function _Getout: JFileDescriptor; cdecl;
    {class} function init: JFileDescriptor; cdecl;
    {class} property err: JFileDescriptor read _Geterr;
    {class} property &in: JFileDescriptor read _Getin;
    {class} property &out: JFileDescriptor read _Getout;
  end;

  [JavaSignature('java/io/FileDescriptor')]
  JFileDescriptor = interface(JObject)
    ['{B6D7B003-DD99-4563-93A3-F902501CD6C1}']
    procedure sync; cdecl;
    function valid: Boolean; cdecl;
  end;
  TJFileDescriptor = class(TJavaGenericImport<JFileDescriptorClass, JFileDescriptor>) end;

  JFileFilterClass = interface(IJavaClass)
    ['{74779212-F9FA-40FE-A5C2-41FBC7919220}']
  end;

  [JavaSignature('java/io/FileFilter')]
  JFileFilter = interface(IJavaInstance)
    ['{5A5564B5-D25E-4D6A-AF92-F0725E9011DE}']
    function accept(pathname: JFile): Boolean; cdecl;
  end;
  TJFileFilter = class(TJavaGenericImport<JFileFilterClass, JFileFilter>) end;

  JFileInputStreamClass = interface(JInputStreamClass)
    ['{A1EB6AE5-8562-4E38-8182-61F57E51733A}']
    {class} function init(name: JString): JFileInputStream; cdecl; overload;
    {class} function init(file_: JFile): JFileInputStream; cdecl; overload;
    {class} function init(fdObj: JFileDescriptor): JFileInputStream; cdecl; overload;
  end;

  [JavaSignature('java/io/FileInputStream')]
  JFileInputStream = interface(JInputStream)
    ['{55CBCA4D-B04C-442A-BD74-ADFFD715A1A5}']
    function available: Integer; cdecl;
    procedure close; cdecl;
    function getChannel: JFileChannel; cdecl;
    function getFD: JFileDescriptor; cdecl;
    function read: Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>): Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;
    function skip(n: Int64): Int64; cdecl;
  end;
  TJFileInputStream = class(TJavaGenericImport<JFileInputStreamClass, JFileInputStream>) end;

  JFileOutputStreamClass = interface(JOutputStreamClass)
    ['{4808736C-4C9B-46DF-A1B6-EB94324D9666}']
    {class} function init(name: JString): JFileOutputStream; cdecl; overload;
    {class} function init(name: JString; append: Boolean): JFileOutputStream; cdecl; overload;
    {class} function init(file_: JFile): JFileOutputStream; cdecl; overload;
    {class} function init(file_: JFile; append: Boolean): JFileOutputStream; cdecl; overload;
    {class} function init(fdObj: JFileDescriptor): JFileOutputStream; cdecl; overload;
  end;

  [JavaSignature('java/io/FileOutputStream')]
  JFileOutputStream = interface(JOutputStream)
    ['{3D49DAFB-A222-4001-9DBE-7FAE66E23404}']
    procedure close; cdecl;
    function getChannel: JFileChannel; cdecl;
    function getFD: JFileDescriptor; cdecl;
    procedure write(b: Integer); cdecl; overload;
    procedure write(b: TJavaArray<Byte>); cdecl; overload;
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
  end;
  TJFileOutputStream = class(TJavaGenericImport<JFileOutputStreamClass, JFileOutputStream>) end;

  JFilenameFilterClass = interface(IJavaClass)
    ['{E466E540-E65D-43EC-8913-E8F8AEEA354F}']
  end;

  [JavaSignature('java/io/FilenameFilter')]
  JFilenameFilter = interface(IJavaInstance)
    ['{B55A4F67-1AE9-41F5-BCF8-305D3902A782}']
    function accept(dir: JFile; name: JString): Boolean; cdecl;
  end;
  TJFilenameFilter = class(TJavaGenericImport<JFilenameFilterClass, JFilenameFilter>) end;

  JFilterOutputStreamClass = interface(JOutputStreamClass)
    ['{4273682E-2DA8-4BA9-BFC7-A9356DC43D40}']
    {class} function init(out_: JOutputStream): JFilterOutputStream; cdecl;
  end;

  [JavaSignature('java/io/FilterOutputStream')]
  JFilterOutputStream = interface(JOutputStream)
    ['{B0DB7F97-9758-43B1-8FC4-19A12503CD3F}']
    procedure close; cdecl;
    procedure flush; cdecl;
    procedure write(b: Integer); cdecl; overload;
    procedure write(b: TJavaArray<Byte>); cdecl; overload;
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
  end;
  TJFilterOutputStream = class(TJavaGenericImport<JFilterOutputStreamClass, JFilterOutputStream>) end;

  JThrowableClass = interface(JObjectClass)
    ['{9B871585-74E6-4B49-B4C2-4DB387B0E599}']
    {class} function init: JThrowable; cdecl; overload;
    {class} function init(message: JString): JThrowable; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JThrowable; cdecl; overload;
    {class} function init(cause: JThrowable): JThrowable; cdecl; overload;
  end;

  [JavaSignature('java/lang/Throwable')]
  JThrowable = interface(JObject)
    ['{44BECA0F-21B9-45A8-B21F-8806ABE80CE2}']
    procedure addSuppressed(exception: JThrowable); cdecl;
    function fillInStackTrace: JThrowable; cdecl;
    function getCause: JThrowable; cdecl;
    function getLocalizedMessage: JString; cdecl;
    function getMessage: JString; cdecl;
    function getStackTrace: TJavaObjectArray<JStackTraceElement>; cdecl;
    function getSuppressed: TJavaObjectArray<JThrowable>; cdecl;
    function initCause(cause: JThrowable): JThrowable; cdecl;
    procedure printStackTrace; cdecl; overload;
    procedure printStackTrace(s: JPrintStream); cdecl; overload;
    procedure printStackTrace(s: JPrintWriter); cdecl; overload;
    procedure setStackTrace(stackTrace: TJavaObjectArray<JStackTraceElement>); cdecl;
    function toString: JString; cdecl;
  end;
  TJThrowable = class(TJavaGenericImport<JThrowableClass, JThrowable>) end;

  JExceptionClass = interface(JThrowableClass)
    ['{6E1BA58E-A106-4CC0-A40C-99F4E1188B10}']
    {class} function init: JException; cdecl; overload;
    {class} function init(message: JString): JException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JException; cdecl; overload;
    {class} function init(cause: JThrowable): JException; cdecl; overload;
  end;

  [JavaSignature('java/lang/Exception')]
  JException = interface(JThrowable)
    ['{6EA7D981-2F3C-44C4-B9D2-F581529C08E0}']
  end;
  TJException = class(TJavaGenericImport<JExceptionClass, JException>) end;

  JIOExceptionClass = interface(JExceptionClass)
    ['{24D5DABE-094D-45DB-9F6A-A5AB51B47322}']
    {class} function init: JIOException; cdecl; overload;
    {class} function init(message: JString): JIOException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JIOException; cdecl; overload;
    {class} function init(cause: JThrowable): JIOException; cdecl; overload;
  end;

  [JavaSignature('java/io/IOException')]
  JIOException = interface(JException)
    ['{7318D96A-B3D4-4168-BDAB-356A539E6399}']
  end;
  TJIOException = class(TJavaGenericImport<JIOExceptionClass, JIOException>) end;

  JPrintStreamClass = interface(JFilterOutputStreamClass)
    ['{4B5683E3-32D0-4225-9A80-FB961D9B334F}']
    {class} function init(out_: JOutputStream): JPrintStream; cdecl; overload;
    {class} function init(out_: JOutputStream; autoFlush: Boolean): JPrintStream; cdecl; overload;
    {class} function init(out_: JOutputStream; autoFlush: Boolean; encoding: JString): JPrintStream; cdecl; overload;
    {class} function init(fileName: JString): JPrintStream; cdecl; overload;
    {class} function init(fileName: JString; csn: JString): JPrintStream; cdecl; overload;
    {class} function init(file_: JFile): JPrintStream; cdecl; overload;
    {class} function init(file_: JFile; csn: JString): JPrintStream; cdecl; overload;
  end;

  [JavaSignature('java/io/PrintStream')]
  JPrintStream = interface(JFilterOutputStream)
    ['{8B23171F-06EF-4D87-A463-863F687A7918}']
    function append(csq: JCharSequence): JPrintStream; cdecl; overload;
    function append(csq: JCharSequence; start: Integer; end_: Integer): JPrintStream; cdecl; overload;
    function append(c: Char): JPrintStream; cdecl; overload;
    function checkError: Boolean; cdecl;
    procedure close; cdecl;
    procedure flush; cdecl;
    procedure print(b: Boolean); cdecl; overload;
    procedure print(c: Char); cdecl; overload;
    procedure print(i: Integer); cdecl; overload;
    procedure print(l: Int64); cdecl; overload;
    procedure print(f: Single); cdecl; overload;
    procedure print(d: Double); cdecl; overload;
    procedure print(s: TJavaArray<Char>); cdecl; overload;
    procedure print(s: JString); cdecl; overload;
    procedure print(obj: JObject); cdecl; overload;
    procedure println; cdecl; overload;
    procedure println(x: Boolean); cdecl; overload;
    procedure println(x: Char); cdecl; overload;
    procedure println(x: Integer); cdecl; overload;
    procedure println(x: Int64); cdecl; overload;
    procedure println(x: Single); cdecl; overload;
    procedure println(x: Double); cdecl; overload;
    procedure println(x: TJavaArray<Char>); cdecl; overload;
    procedure println(x: JString); cdecl; overload;
    procedure println(x: JObject); cdecl; overload;
    procedure write(b: Integer); cdecl; overload;
    procedure write(buf: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
  end;
  TJPrintStream = class(TJavaGenericImport<JPrintStreamClass, JPrintStream>) end;

  JWriterClass = interface(JObjectClass)
    ['{1B3FE1C9-6FF8-45AE-89D6-267E4CC1F003}']
  end;

  [JavaSignature('java/io/Writer')]
  JWriter = interface(JObject)
    ['{50C5DAA8-B851-43A7-8FF9-E827DC14E67B}']
    function append(csq: JCharSequence): JWriter; cdecl; overload;
    function append(csq: JCharSequence; start: Integer; end_: Integer): JWriter; cdecl; overload;
    function append(c: Char): JWriter; cdecl; overload;
    procedure close; cdecl;
    procedure flush; cdecl;
    procedure write(c: Integer); cdecl; overload;
    procedure write(cbuf: TJavaArray<Char>); cdecl; overload;
    procedure write(cbuf: TJavaArray<Char>; off: Integer; len: Integer); cdecl; overload;
    procedure write(str: JString); cdecl; overload;
    procedure write(str: JString; off: Integer; len: Integer); cdecl; overload;
  end;
  TJWriter = class(TJavaGenericImport<JWriterClass, JWriter>) end;

  JPrintWriterClass = interface(JWriterClass)
    ['{0176F2C9-CDCB-40D9-B26E-E983BE269B0D}']
    {class} function init(out_: JWriter): JPrintWriter; cdecl; overload;
    {class} function init(out_: JWriter; autoFlush: Boolean): JPrintWriter; cdecl; overload;
    {class} function init(out_: JOutputStream): JPrintWriter; cdecl; overload;
    {class} function init(out_: JOutputStream; autoFlush: Boolean): JPrintWriter; cdecl; overload;
    {class} function init(fileName: JString): JPrintWriter; cdecl; overload;
    {class} function init(fileName: JString; csn: JString): JPrintWriter; cdecl; overload;
    {class} function init(file_: JFile): JPrintWriter; cdecl; overload;
    {class} function init(file_: JFile; csn: JString): JPrintWriter; cdecl; overload;
  end;

  [JavaSignature('java/io/PrintWriter')]
  JPrintWriter = interface(JWriter)
    ['{1C7483CD-045F-4478-A223-A9FBBF9C1D80}']
    function append(csq: JCharSequence): JPrintWriter; cdecl; overload;
    function append(csq: JCharSequence; start: Integer; end_: Integer): JPrintWriter; cdecl; overload;
    function append(c: Char): JPrintWriter; cdecl; overload;
    function checkError: Boolean; cdecl;
    procedure close; cdecl;
    procedure flush; cdecl;
    procedure print(b: Boolean); cdecl; overload;
    procedure print(c: Char); cdecl; overload;
    procedure print(i: Integer); cdecl; overload;
    procedure print(l: Int64); cdecl; overload;
    procedure print(f: Single); cdecl; overload;
    procedure print(d: Double); cdecl; overload;
    procedure print(s: TJavaArray<Char>); cdecl; overload;
    procedure print(s: JString); cdecl; overload;
    procedure print(obj: JObject); cdecl; overload;
    procedure println; cdecl; overload;
    procedure println(x: Boolean); cdecl; overload;
    procedure println(x: Char); cdecl; overload;
    procedure println(x: Integer); cdecl; overload;
    procedure println(x: Int64); cdecl; overload;
    procedure println(x: Single); cdecl; overload;
    procedure println(x: Double); cdecl; overload;
    procedure println(x: TJavaArray<Char>); cdecl; overload;
    procedure println(x: JString); cdecl; overload;
    procedure println(x: JObject); cdecl; overload;
    procedure write(c: Integer); cdecl; overload;
    procedure write(buf: TJavaArray<Char>; off: Integer; len: Integer); cdecl; overload;
    procedure write(buf: TJavaArray<Char>); cdecl; overload;
    procedure write(s: JString; off: Integer; len: Integer); cdecl; overload;
    procedure write(s: JString); cdecl; overload;
  end;
  TJPrintWriter = class(TJavaGenericImport<JPrintWriterClass, JPrintWriter>) end;

  JRandomAccessFileClass = interface(JObjectClass)
    ['{A3AAF4BA-F473-4135-AF7F-13B89D0BA76A}']
    {class} function init(name: JString; mode: JString): JRandomAccessFile; cdecl; overload;
    {class} function init(file_: JFile; mode: JString): JRandomAccessFile; cdecl; overload;
  end;

  [JavaSignature('java/io/RandomAccessFile')]
  JRandomAccessFile = interface(JObject)
    ['{59DD1A15-35C5-456F-BBE2-61B628DAE3DB}']
    procedure close; cdecl;
    function getChannel: JFileChannel; cdecl;
    function getFD: JFileDescriptor; cdecl;
    function getFilePointer: Int64; cdecl;
    function length: Int64; cdecl;
    function read: Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>): Integer; cdecl; overload;
    function readBoolean: Boolean; cdecl;
    function readByte: Byte; cdecl;
    function readChar: Char; cdecl;
    function readDouble: Double; cdecl;
    function readFloat: Single; cdecl;
    procedure readFully(b: TJavaArray<Byte>); cdecl; overload;
    procedure readFully(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
    function readInt: Integer; cdecl;
    function readLine: JString; cdecl;
    function readLong: Int64; cdecl;
    function readShort: SmallInt; cdecl;
    function readUTF: JString; cdecl;
    function readUnsignedByte: Integer; cdecl;
    function readUnsignedShort: Integer; cdecl;
    procedure seek(offset: Int64); cdecl;
    procedure setLength(newLength: Int64); cdecl;
    function skipBytes(n: Integer): Integer; cdecl;
    procedure write(b: Integer); cdecl; overload;
    procedure write(b: TJavaArray<Byte>); cdecl; overload;
    procedure write(b: TJavaArray<Byte>; off: Integer; len: Integer); cdecl; overload;
    procedure writeBoolean(v: Boolean); cdecl;
    procedure writeByte(v: Integer); cdecl;
    procedure writeBytes(s: JString); cdecl;
    procedure writeChar(v: Integer); cdecl;
    procedure writeChars(s: JString); cdecl;
    procedure writeDouble(v: Double); cdecl;
    procedure writeFloat(v: Single); cdecl;
    procedure writeInt(v: Integer); cdecl;
    procedure writeLong(v: Int64); cdecl;
    procedure writeShort(v: Integer); cdecl;
    procedure writeUTF(str: JString); cdecl;
  end;
  TJRandomAccessFile = class(TJavaGenericImport<JRandomAccessFileClass, JRandomAccessFile>) end;

  JReaderClass = interface(JObjectClass)
    ['{C04A4F72-F3EC-4774-9336-AA82265956FF}']
  end;

  [JavaSignature('java/io/Reader')]
  JReader = interface(JObject)
    ['{D163CFD3-9781-435C-8FF5-98667DCD8189}']
    procedure close; cdecl;
    procedure mark(readAheadLimit: Integer); cdecl;
    function markSupported: Boolean; cdecl;
    function read(target: JCharBuffer): Integer; cdecl; overload;
    function read: Integer; cdecl; overload;
    function read(cbuf: TJavaArray<Char>): Integer; cdecl; overload;
    function read(cbuf: TJavaArray<Char>; off: Integer; len: Integer): Integer; cdecl; overload;
    function ready: Boolean; cdecl;
    procedure reset; cdecl;
    function skip(n: Int64): Int64; cdecl;
  end;
  TJReader = class(TJavaGenericImport<JReaderClass, JReader>) end;

  JSerializableClass = interface(IJavaClass)
    ['{BFE14BCE-11F1-41B5-A14F-3217521E82BA}']
  end;

  [JavaSignature('java/io/Serializable')]
  JSerializable = interface(IJavaInstance)
    ['{D24AB8DC-4E6F-411D-9C40-2210F71A3B0D}']
  end;
  TJSerializable = class(TJavaGenericImport<JSerializableClass, JSerializable>) end;

  JAbstractStringBuilderClass = interface(JObjectClass)
    ['{A3321EF2-EA76-44CD-90CE-DFDADB9936BD}']
  end;

  [JavaSignature('java/lang/AbstractStringBuilder')]
  JAbstractStringBuilder = interface(JObject)
    ['{39A0E6C5-8F79-44ED-BECB-02252CA2F5C0}']
    function capacity: Integer; cdecl;
    function charAt(index: Integer): Char; cdecl;
    function codePointAt(index: Integer): Integer; cdecl;
    function codePointBefore(index: Integer): Integer; cdecl;
    function codePointCount(beginIndex: Integer; endIndex: Integer): Integer; cdecl;
    procedure ensureCapacity(minimumCapacity: Integer); cdecl;
    procedure getChars(srcBegin: Integer; srcEnd: Integer; dst: TJavaArray<Char>; dstBegin: Integer); cdecl;
    function indexOf(str: JString): Integer; cdecl; overload;
    function indexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function lastIndexOf(str: JString): Integer; cdecl; overload;
    function lastIndexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function length: Integer; cdecl;
    function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;
    procedure setCharAt(index: Integer; ch: Char); cdecl;
    procedure setLength(newLength: Integer); cdecl;
    function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    function substring(start: Integer): JString; cdecl; overload;
    function substring(start: Integer; end_: Integer): JString; cdecl; overload;
    function toString: JString; cdecl;
    procedure trimToSize; cdecl;
  end;
  TJAbstractStringBuilder = class(TJavaGenericImport<JAbstractStringBuilderClass, JAbstractStringBuilder>) end;

  JAppendableClass = interface(IJavaClass)
    ['{B34AA52A-C9D0-4E5C-AB21-D5D644536B6C}']
  end;

  [JavaSignature('java/lang/Appendable')]
  JAppendable = interface(IJavaInstance)
    ['{A8613E4E-753A-417E-8F1C-0075F4F35D09}']
    function append(csq: JCharSequence): JAppendable; cdecl; overload;
    function append(csq: JCharSequence; start: Integer; end_: Integer): JAppendable; cdecl; overload;
    function append(c: Char): JAppendable; cdecl; overload;
  end;
  TJAppendable = class(TJavaGenericImport<JAppendableClass, JAppendable>) end;

  JBooleanClass = interface(JObjectClass)
    ['{CD51CE90-BCDA-4291-99B0-7BC70033C3CB}']
    {class} function _GetFALSE: JBoolean; cdecl;
    {class} function _GetTRUE: JBoolean; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Boolean): JBoolean; cdecl; overload;
    {class} function init(s: JString): JBoolean; cdecl; overload;
    {class} function compare(x: Boolean; y: Boolean): Integer; cdecl;
    {class} function getBoolean(name: JString): Boolean; cdecl;
    {class} function hashCode(value: Boolean): Integer; cdecl; overload;
    {class} function logicalAnd(a: Boolean; b: Boolean): Boolean; cdecl;
    {class} function logicalOr(a: Boolean; b: Boolean): Boolean; cdecl;
    {class} function logicalXor(a: Boolean; b: Boolean): Boolean; cdecl;
    {class} function parseBoolean(s: JString): Boolean; cdecl;
    {class} function toString(b: Boolean): JString; cdecl; overload;
    {class} function valueOf(b: Boolean): JBoolean; cdecl; overload;
    {class} function valueOf(s: JString): JBoolean; cdecl; overload;
    {class} property FALSE: JBoolean read _GetFALSE;
    {class} property TRUE: JBoolean read _GetTRUE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Boolean')]
  JBoolean = interface(JObject)
    ['{21EAFAED-5848-48C2-9998-141B57439F6F}']
    function booleanValue: Boolean; cdecl;
    function compareTo(b: JBoolean): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl; overload;
    function toString: JString; cdecl; overload;
  end;
  TJBoolean = class(TJavaGenericImport<JBooleanClass, JBoolean>) end;

  JNumberClass = interface(JObjectClass)
    ['{9A30B143-2018-4C7B-9E9B-316F62D643C5}']
    {class} function init: JNumber; cdecl;
  end;

  [JavaSignature('java/lang/Number')]
  JNumber = interface(JObject)
    ['{DFF915A9-AFBE-4EDA-89AC-D0FE32A85482}']
    function byteValue: Byte; cdecl;
    function doubleValue: Double; cdecl;
    function floatValue: Single; cdecl;
    function intValue: Integer; cdecl;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
  end;
  TJNumber = class(TJavaGenericImport<JNumberClass, JNumber>) end;

  JByteClass = interface(JNumberClass)
    ['{EDEFB599-A2A8-49AD-B413-C2FCEBD19B11}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_VALUE: Byte; cdecl;
    {class} function _GetMIN_VALUE: Byte; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Byte): JByte; cdecl; overload;
    {class} function init(s: JString): JByte; cdecl; overload;
    {class} function compare(x: Byte; y: Byte): Integer; cdecl;
    {class} function decode(nm: JString): JByte; cdecl;
    {class} function hashCode(value: Byte): Integer; cdecl; overload;
    {class} function parseByte(s: JString; radix: Integer): Byte; cdecl; overload;
    {class} function parseByte(s: JString): Byte; cdecl; overload;
    {class} function toString(b: Byte): JString; cdecl; overload;
    {class} function toUnsignedInt(x: Byte): Integer; cdecl;
    {class} function toUnsignedLong(x: Byte): Int64; cdecl;
    {class} function valueOf(b: Byte): JByte; cdecl; overload;
    {class} function valueOf(s: JString; radix: Integer): JByte; cdecl; overload;
    {class} function valueOf(s: JString): JByte; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_VALUE: Byte read _GetMAX_VALUE;
    {class} property MIN_VALUE: Byte read _GetMIN_VALUE;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Byte')]
  JByte = interface(JNumber)
    ['{882439AC-111F-445F-B6CD-2E1E8D793CDE}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherByte: JByte): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJByte = class(TJavaGenericImport<JByteClass, JByte>) end;

  JCharSequenceClass = interface(IJavaClass)
    ['{85DCA69A-F296-4BB4-8FE2-5ECE0EBE6611}']
  end;

  [JavaSignature('java/lang/CharSequence')]
  JCharSequence = interface(IJavaInstance)
    ['{D026566C-D7C6-43E7-AECA-030E2C23A8B8}']
    function charAt(index: Integer): Char; cdecl;
    function chars: JIntStream; cdecl;
    function codePoints: JIntStream; cdecl;
    function length: Integer; cdecl;
    function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    function toString: JString; cdecl;
  end;
  TJCharSequence = class(TJavaGenericImport<JCharSequenceClass, JCharSequence>) end;

  Jlang_ClassClass = interface(JObjectClass)
    ['{E1A7F20A-FD87-4D67-9469-7492FD97D55D}']
    {class} function forName(className: JString): Jlang_Class; cdecl; overload;
    {class} function forName(name: JString; initialize: Boolean; loader: JClassLoader): Jlang_Class; cdecl; overload;
  end;

  [JavaSignature('java/lang/Class')]
  Jlang_Class = interface(JObject)
    ['{B056EDE6-77D8-4CDD-9864-147C201FD87C}']
    function asSubclass(clazz: Jlang_Class): Jlang_Class; cdecl;
    function cast(obj: JObject): JObject; cdecl;
    function desiredAssertionStatus: Boolean; cdecl;
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getCanonicalName: JString; cdecl;
    function getClassLoader: JClassLoader; cdecl;
    function getClasses: TJavaObjectArray<Jlang_Class>; cdecl;
    function getComponentType: Jlang_Class; cdecl;
    function getConstructors: TJavaObjectArray<JConstructor>; cdecl;
    function getDeclaredAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredClasses: TJavaObjectArray<Jlang_Class>; cdecl;
    function getDeclaredConstructors: TJavaObjectArray<JConstructor>; cdecl;
    function getDeclaredField(name: JString): JField; cdecl;
    function getDeclaredFields: TJavaObjectArray<JField>; cdecl;
    function getDeclaredMethods: TJavaObjectArray<JMethod>; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function getEnclosingClass: Jlang_Class; cdecl;
    function getEnclosingConstructor: JConstructor; cdecl;
    function getEnclosingMethod: JMethod; cdecl;
    function getEnumConstants: TJavaObjectArray<JObject>; cdecl;
    function getField(name: JString): JField; cdecl;
    function getFields: TJavaObjectArray<JField>; cdecl;
    function getGenericInterfaces: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericSuperclass: Jreflect_Type; cdecl;
    function getInterfaces: TJavaObjectArray<Jlang_Class>; cdecl;
    function getMethods: TJavaObjectArray<JMethod>; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getPackage: JPackage; cdecl;
    //function getProtectionDomain: JProtectionDomain; cdecl;
    //function getResource(name: JString): JURL; cdecl;
    function getResourceAsStream(name: JString): JInputStream; cdecl;
    function getSigners: TJavaObjectArray<JObject>; cdecl;
    function getSimpleName: JString; cdecl;
    function getSuperclass: Jlang_Class; cdecl;
    function getTypeName: JString; cdecl;
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl;
    function isAnnotation: Boolean; cdecl;
    function isAnnotationPresent(annotationClass: Jlang_Class): Boolean; cdecl;
    function isAnonymousClass: Boolean; cdecl;
    function isArray: Boolean; cdecl;
    function isAssignableFrom(cls: Jlang_Class): Boolean; cdecl;
    function isEnum: Boolean; cdecl;
    function isInstance(obj: JObject): Boolean; cdecl;
    function isInterface: Boolean; cdecl;
    function isLocalClass: Boolean; cdecl;
    function isMemberClass: Boolean; cdecl;
    function isPrimitive: Boolean; cdecl;
    function isSynthetic: Boolean; cdecl;
    function newInstance: JObject; cdecl;
    function toGenericString: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJlang_Class = class(TJavaGenericImport<Jlang_ClassClass, Jlang_Class>) end;

  JClassLoaderClass = interface(JObjectClass)
    ['{453BE0D7-B813-4C83-A30C-F24C026FD112}']
    {class} function getSystemClassLoader: JClassLoader; cdecl;
    {class} //function getSystemResource(name: JString): JURL; cdecl;
    {class} function getSystemResourceAsStream(name: JString): JInputStream; cdecl;
    {class} function getSystemResources(name: JString): JEnumeration; cdecl;
  end;

  [JavaSignature('java/lang/ClassLoader')]
  JClassLoader = interface(JObject)
    ['{17B43D0A-2016-44ED-84B5-9EAB55AF8FDD}']
    procedure clearAssertionStatus; cdecl;
    function getParent: JClassLoader; cdecl;
    //function getResource(name: JString): JURL; cdecl;
    function getResourceAsStream(name: JString): JInputStream; cdecl;
    function getResources(name: JString): JEnumeration; cdecl;
    function loadClass(name: JString): Jlang_Class; cdecl;
    procedure setClassAssertionStatus(className: JString; enabled: Boolean); cdecl;
    procedure setDefaultAssertionStatus(enabled: Boolean); cdecl;
    procedure setPackageAssertionStatus(packageName: JString; enabled: Boolean); cdecl;
  end;
  TJClassLoader = class(TJavaGenericImport<JClassLoaderClass, JClassLoader>) end;

  JCloneableClass = interface(IJavaClass)
    ['{0E9E456D-6AA1-4C39-8466-0FC2809B0004}']
  end;

  [JavaSignature('java/lang/Cloneable')]
  JCloneable = interface(IJavaInstance)
    ['{44D68986-0DF0-43AF-8D4C-3AB3381328CF}']
  end;
  TJCloneable = class(TJavaGenericImport<JCloneableClass, JCloneable>) end;

  JComparableClass = interface(IJavaClass)
    ['{919AEA14-2451-4CFB-BFAB-387DB8BBE854}']
  end;

  [JavaSignature('java/lang/Comparable')]
  JComparable = interface(IJavaInstance)
    ['{AE58973C-F988-4AA5-969C-EBB4E2515276}']
    function compareTo(o: JObject): Integer; cdecl;
  end;
  TJComparable = class(TJavaGenericImport<JComparableClass, JComparable>) end;

  JDoubleClass = interface(JNumberClass)
    ['{1B133955-7ECE-4429-97CD-9118396AC3AE}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_EXPONENT: Integer; cdecl;
    {class} function _GetMAX_VALUE: Double; cdecl;
    {class} function _GetMIN_EXPONENT: Integer; cdecl;
    {class} function _GetMIN_NORMAL: Double; cdecl;
    {class} function _GetMIN_VALUE: Double; cdecl;
    {class} function _GetNEGATIVE_INFINITY: Double; cdecl;
    {class} function _GetNaN: Double; cdecl;
    {class} function _GetPOSITIVE_INFINITY: Double; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Double): JDouble; cdecl; overload;
    {class} function init(s: JString): JDouble; cdecl; overload;
    {class} function compare(d1: Double; d2: Double): Integer; cdecl;
    {class} function doubleToLongBits(value: Double): Int64; cdecl;
    {class} function doubleToRawLongBits(value: Double): Int64; cdecl;
    {class} function hashCode(value: Double): Integer; cdecl; overload;
    {class} function isFinite(d: Double): Boolean; cdecl;
    {class} function isInfinite(v: Double): Boolean; cdecl; overload;
    {class} function isNaN(v: Double): Boolean; cdecl; overload;
    {class} function longBitsToDouble(bits: Int64): Double; cdecl;
    {class} function max(a: Double; b: Double): Double; cdecl;
    {class} function min(a: Double; b: Double): Double; cdecl;
    {class} function parseDouble(s: JString): Double; cdecl;
    {class} function sum(a: Double; b: Double): Double; cdecl;
    {class} function toHexString(d: Double): JString; cdecl;
    {class} function toString(d: Double): JString; cdecl; overload;
    {class} function valueOf(s: JString): JDouble; cdecl; overload;
    {class} function valueOf(d: Double): JDouble; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_EXPONENT: Integer read _GetMAX_EXPONENT;
    {class} property MAX_VALUE: Double read _GetMAX_VALUE;
    {class} property MIN_EXPONENT: Integer read _GetMIN_EXPONENT;
    {class} property MIN_NORMAL: Double read _GetMIN_NORMAL;
    {class} property MIN_VALUE: Double read _GetMIN_VALUE;
    {class} property NEGATIVE_INFINITY: Double read _GetNEGATIVE_INFINITY;
    {class} property NaN: Double read _GetNaN;
    {class} property POSITIVE_INFINITY: Double read _GetPOSITIVE_INFINITY;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Double')]
  JDouble = interface(JNumber)
    ['{81639AF9-E21C-4CB0-99E6-1E7F013E11CC}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherDouble: JDouble): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function isInfinite: Boolean; cdecl; overload;
    function isNaN: Boolean; cdecl; overload;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJDouble = class(TJavaGenericImport<JDoubleClass, JDouble>) end;

  JEnumClass = interface(JObjectClass)
    ['{2DB4C98D-F244-4372-9487-E9B9E2F48391}']
    {class} function valueOf(enumType: Jlang_Class; name: JString): JEnum; cdecl;
  end;

  [JavaSignature('java/lang/Enum')]
  JEnum = interface(JObject)
    ['{0CFB5F00-FBF2-469D-806C-471A09BE1BAF}']
    function compareTo(o: JEnum): Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function hashCode: Integer; cdecl;
    function name: JString; cdecl;
    function ordinal: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJEnum = class(TJavaGenericImport<JEnumClass, JEnum>) end;

  JFloatClass = interface(JNumberClass)
    ['{E2E64017-238D-4910-8DF8-BD66A034BDFE}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_EXPONENT: Integer; cdecl;
    {class} function _GetMAX_VALUE: Single; cdecl;
    {class} function _GetMIN_EXPONENT: Integer; cdecl;
    {class} function _GetMIN_NORMAL: Single; cdecl;
    {class} function _GetMIN_VALUE: Single; cdecl;
    {class} function _GetNEGATIVE_INFINITY: Single; cdecl;
    {class} function _GetNaN: Single; cdecl;
    {class} function _GetPOSITIVE_INFINITY: Single; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Single): JFloat; cdecl; overload;
    {class} function init(value: Double): JFloat; cdecl; overload;
    {class} function init(s: JString): JFloat; cdecl; overload;
    {class} function compare(f1: Single; f2: Single): Integer; cdecl;
    {class} function floatToIntBits(value: Single): Integer; cdecl;
    {class} function floatToRawIntBits(value: Single): Integer; cdecl;
    {class} function hashCode(value: Single): Integer; cdecl; overload;
    {class} function intBitsToFloat(bits: Integer): Single; cdecl;
    {class} function isFinite(f: Single): Boolean; cdecl;
    {class} function isInfinite(v: Single): Boolean; cdecl; overload;
    {class} function isNaN(v: Single): Boolean; cdecl; overload;
    {class} function max(a: Single; b: Single): Single; cdecl;
    {class} function min(a: Single; b: Single): Single; cdecl;
    {class} function parseFloat(s: JString): Single; cdecl;
    {class} function sum(a: Single; b: Single): Single; cdecl;
    {class} function toHexString(f: Single): JString; cdecl;
    {class} function toString(f: Single): JString; cdecl; overload;
    {class} function valueOf(s: JString): JFloat; cdecl; overload;
    {class} function valueOf(f: Single): JFloat; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_EXPONENT: Integer read _GetMAX_EXPONENT;
    {class} property MAX_VALUE: Single read _GetMAX_VALUE;
    {class} property MIN_EXPONENT: Integer read _GetMIN_EXPONENT;
    {class} property MIN_NORMAL: Single read _GetMIN_NORMAL;
    {class} property MIN_VALUE: Single read _GetMIN_VALUE;
    {class} property NEGATIVE_INFINITY: Single read _GetNEGATIVE_INFINITY;
    {class} property NaN: Single read _GetNaN;
    {class} property POSITIVE_INFINITY: Single read _GetPOSITIVE_INFINITY;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Float')]
  JFloat = interface(JNumber)
    ['{F13BF843-909A-4866-918B-B1B2B1A8F483}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherFloat: JFloat): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function isInfinite: Boolean; cdecl; overload;
    function isNaN: Boolean; cdecl; overload;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJFloat = class(TJavaGenericImport<JFloatClass, JFloat>) end;

  JRuntimeExceptionClass = interface(JExceptionClass)
    ['{58C58616-58EF-4783-92DB-5AE4F2A079A7}']
    {class} function init: JRuntimeException; cdecl; overload;
    {class} function init(message: JString): JRuntimeException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JRuntimeException; cdecl; overload;
    {class} function init(cause: JThrowable): JRuntimeException; cdecl; overload;
  end;

  [JavaSignature('java/lang/RuntimeException')]
  JRuntimeException = interface(JException)
    ['{7CEA4E55-B247-4073-A601-7C2C6D8BEE22}']
  end;
  TJRuntimeException = class(TJavaGenericImport<JRuntimeExceptionClass, JRuntimeException>) end;

  JIllegalStateExceptionClass = interface(JRuntimeExceptionClass)
    ['{C0717EAB-C1D7-4E7A-A545-922D0CC4B532}']
    {class} function init: JIllegalStateException; cdecl; overload;
    {class} function init(s: JString): JIllegalStateException; cdecl; overload;
    {class} function init(message: JString; cause: JThrowable): JIllegalStateException; cdecl; overload;
    {class} function init(cause: JThrowable): JIllegalStateException; cdecl; overload;
  end;

  [JavaSignature('java/lang/IllegalStateException')]
  JIllegalStateException = interface(JRuntimeException)
    ['{47074700-88B6-49D2-A5F3-43540D5B910D}']
  end;
  TJIllegalStateException = class(TJavaGenericImport<JIllegalStateExceptionClass, JIllegalStateException>) end;

  JIntegerClass = interface(JNumberClass)
    ['{DA48E911-AB80-4875-993F-316B9F310559}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_VALUE: Integer; cdecl;
    {class} function _GetMIN_VALUE: Integer; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Integer): JInteger; cdecl; overload;
    {class} function init(s: JString): JInteger; cdecl; overload;
    {class} function bitCount(i: Integer): Integer; cdecl;
    {class} function compare(x: Integer; y: Integer): Integer; cdecl;
    {class} function compareUnsigned(x: Integer; y: Integer): Integer; cdecl;
    {class} function decode(nm: JString): JInteger; cdecl;
    {class} function divideUnsigned(dividend: Integer; divisor: Integer): Integer; cdecl;
    {class} function getInteger(nm: JString): JInteger; cdecl; overload;
    {class} function getInteger(nm: JString; val: Integer): JInteger; cdecl; overload;
    {class} function getInteger(nm: JString; val: JInteger): JInteger; cdecl; overload;
    {class} function hashCode(value: Integer): Integer; cdecl; overload;
    {class} function highestOneBit(i: Integer): Integer; cdecl;
    {class} function lowestOneBit(i: Integer): Integer; cdecl;
    {class} function max(a: Integer; b: Integer): Integer; cdecl;
    {class} function min(a: Integer; b: Integer): Integer; cdecl;
    {class} function numberOfLeadingZeros(i: Integer): Integer; cdecl;
    {class} function numberOfTrailingZeros(i: Integer): Integer; cdecl;
    {class} function parseInt(s: JString; radix: Integer): Integer; cdecl; overload;
    {class} function parseInt(s: JString): Integer; cdecl; overload;
    {class} function parseUnsignedInt(s: JString; radix: Integer): Integer; cdecl; overload;
    {class} function parseUnsignedInt(s: JString): Integer; cdecl; overload;
    {class} function remainderUnsigned(dividend: Integer; divisor: Integer): Integer; cdecl;
    {class} function reverse(i: Integer): Integer; cdecl;
    {class} function reverseBytes(i: Integer): Integer; cdecl;
    {class} function rotateLeft(i: Integer; distance: Integer): Integer; cdecl;
    {class} function rotateRight(i: Integer; distance: Integer): Integer; cdecl;
    {class} function signum(i: Integer): Integer; cdecl;
    {class} function sum(a: Integer; b: Integer): Integer; cdecl;
    {class} function toBinaryString(i: Integer): JString; cdecl;
    {class} function toHexString(i: Integer): JString; cdecl;
    {class} function toOctalString(i: Integer): JString; cdecl;
    {class} function toString(i: Integer; radix: Integer): JString; cdecl; overload;
    {class} function toString(i: Integer): JString; cdecl; overload;
    {class} function toUnsignedLong(x: Integer): Int64; cdecl;
    {class} function toUnsignedString(i: Integer; radix: Integer): JString; cdecl; overload;
    {class} function toUnsignedString(i: Integer): JString; cdecl; overload;
    {class} function valueOf(s: JString; radix: Integer): JInteger; cdecl; overload;
    {class} function valueOf(s: JString): JInteger; cdecl; overload;
    {class} function valueOf(i: Integer): JInteger; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_VALUE: Integer read _GetMAX_VALUE;
    {class} property MIN_VALUE: Integer read _GetMIN_VALUE;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Integer')]
  JInteger = interface(JNumber)
    ['{A07D13BE-2418-4FCB-8CEB-F4160E5884D5}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherInteger: JInteger): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJInteger = class(TJavaGenericImport<JIntegerClass, JInteger>) end;

  JIterableClass = interface(IJavaClass)
    ['{EEADA3A8-2116-491E-ACC7-21F84F84D65A}']
  end;

  [JavaSignature('java/lang/Iterable')]
  JIterable = interface(IJavaInstance)
    ['{ABC85F3B-F161-4206-882A-FFD5F1DEFEA2}']
    procedure forEach(action: JConsumer); cdecl;
    function iterator: JIterator; cdecl;
    function spliterator: JSpliterator; cdecl;
  end;
  TJIterable = class(TJavaGenericImport<JIterableClass, JIterable>) end;

  JLongClass = interface(JNumberClass)
    ['{BA567CF5-58F3-41A7-BAA4-538606294DE9}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_VALUE: Int64; cdecl;
    {class} function _GetMIN_VALUE: Int64; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: Int64): JLong; cdecl; overload;
    {class} function init(s: JString): JLong; cdecl; overload;
    {class} function bitCount(i: Int64): Integer; cdecl;
    {class} function compare(x: Int64; y: Int64): Integer; cdecl;
    {class} function compareUnsigned(x: Int64; y: Int64): Integer; cdecl;
    {class} function decode(nm: JString): JLong; cdecl;
    {class} function divideUnsigned(dividend: Int64; divisor: Int64): Int64; cdecl;
    {class} function getLong(nm: JString): JLong; cdecl; overload;
    {class} function getLong(nm: JString; val: Int64): JLong; cdecl; overload;
    {class} function getLong(nm: JString; val: JLong): JLong; cdecl; overload;
    {class} function hashCode(value: Int64): Integer; cdecl; overload;
    {class} function highestOneBit(i: Int64): Int64; cdecl;
    {class} function lowestOneBit(i: Int64): Int64; cdecl;
    {class} function max(a: Int64; b: Int64): Int64; cdecl;
    {class} function min(a: Int64; b: Int64): Int64; cdecl;
    {class} function numberOfLeadingZeros(i: Int64): Integer; cdecl;
    {class} function numberOfTrailingZeros(i: Int64): Integer; cdecl;
    {class} function parseLong(s: JString; radix: Integer): Int64; cdecl; overload;
    {class} function parseLong(s: JString): Int64; cdecl; overload;
    {class} function parseUnsignedLong(s: JString; radix: Integer): Int64; cdecl; overload;
    {class} function parseUnsignedLong(s: JString): Int64; cdecl; overload;
    {class} function remainderUnsigned(dividend: Int64; divisor: Int64): Int64; cdecl;
    {class} function reverse(i: Int64): Int64; cdecl;
    {class} function reverseBytes(i: Int64): Int64; cdecl;
    {class} function rotateLeft(i: Int64; distance: Integer): Int64; cdecl;
    {class} function rotateRight(i: Int64; distance: Integer): Int64; cdecl;
    {class} function signum(i: Int64): Integer; cdecl;
    {class} function sum(a: Int64; b: Int64): Int64; cdecl;
    {class} function toBinaryString(i: Int64): JString; cdecl;
    {class} function toHexString(i: Int64): JString; cdecl;
    {class} function toOctalString(i: Int64): JString; cdecl;
    {class} function toString(i: Int64; radix: Integer): JString; cdecl; overload;
    {class} function toString(i: Int64): JString; cdecl; overload;
    {class} function toUnsignedString(i: Int64; radix: Integer): JString; cdecl; overload;
    {class} function toUnsignedString(i: Int64): JString; cdecl; overload;
    {class} function valueOf(s: JString; radix: Integer): JLong; cdecl; overload;
    {class} function valueOf(s: JString): JLong; cdecl; overload;
    {class} function valueOf(l: Int64): JLong; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_VALUE: Int64 read _GetMAX_VALUE;
    {class} property MIN_VALUE: Int64 read _GetMIN_VALUE;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Long')]
  JLong = interface(JNumber)
    ['{F2E23531-34CC-4607-94D6-F85B4F95FB43}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherLong: JLong): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJLong = class(TJavaGenericImport<JLongClass, JLong>) end;

  JPackageClass = interface(JObjectClass)
    ['{1FC1C1DD-321C-4601-8946-916E19BD67FA}']
    {class} function getPackage(name: JString): JPackage; cdecl;
    {class} function getPackages: TJavaObjectArray<JPackage>; cdecl;
  end;

  [JavaSignature('java/lang/Package')]
  JPackage = interface(JObject)
    ['{E8F397DF-1FB0-4C08-B9CB-08C8B38917EE}']
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getImplementationTitle: JString; cdecl;
    function getImplementationVendor: JString; cdecl;
    function getImplementationVersion: JString; cdecl;
    function getName: JString; cdecl;
    function getSpecificationTitle: JString; cdecl;
    function getSpecificationVendor: JString; cdecl;
    function getSpecificationVersion: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isAnnotationPresent(annotationClass: Jlang_Class): Boolean; cdecl;
    function isCompatibleWith(desired: JString): Boolean; cdecl;
    function isSealed: Boolean; cdecl; overload;
    //function isSealed(url: JURL): Boolean; cdecl; overload;
    function toString: JString; cdecl;
  end;
  TJPackage = class(TJavaGenericImport<JPackageClass, JPackage>) end;

  JRunnableClass = interface(IJavaClass)
    ['{49A6EA8E-0ADB-4D8E-8FA3-F13D4ADCF281}']
  end;

  [JavaSignature('java/lang/Runnable')]
  JRunnable = interface(IJavaInstance)
    ['{BC131B27-7A72-4CAF-BB8E-170B8359B22E}']
    procedure run; cdecl;
  end;
  TJRunnable = class(TJavaGenericImport<JRunnableClass, JRunnable>) end;

  JShortClass = interface(JNumberClass)
    ['{FAD495F3-40B7-46DB-B3B6-8DBBD38D8E16}']
    {class} function _GetBYTES: Integer; cdecl;
    {class} function _GetMAX_VALUE: SmallInt; cdecl;
    {class} function _GetMIN_VALUE: SmallInt; cdecl;
    {class} function _GetSIZE: Integer; cdecl;
    {class} function _GetTYPE: Jlang_Class; cdecl;
    {class} function init(value: SmallInt): JShort; cdecl; overload;
    {class} function init(s: JString): JShort; cdecl; overload;
    {class} function compare(x: SmallInt; y: SmallInt): Integer; cdecl;
    {class} function decode(nm: JString): JShort; cdecl;
    {class} function hashCode(value: SmallInt): Integer; cdecl; overload;
    {class} function parseShort(s: JString; radix: Integer): SmallInt; cdecl; overload;
    {class} function parseShort(s: JString): SmallInt; cdecl; overload;
    {class} function reverseBytes(i: SmallInt): SmallInt; cdecl;
    {class} function toString(s: SmallInt): JString; cdecl; overload;
    {class} function toUnsignedInt(x: SmallInt): Integer; cdecl;
    {class} function toUnsignedLong(x: SmallInt): Int64; cdecl;
    {class} function valueOf(s: JString; radix: Integer): JShort; cdecl; overload;
    {class} function valueOf(s: JString): JShort; cdecl; overload;
    {class} function valueOf(s: SmallInt): JShort; cdecl; overload;
    {class} property BYTES: Integer read _GetBYTES;
    {class} property MAX_VALUE: SmallInt read _GetMAX_VALUE;
    {class} property MIN_VALUE: SmallInt read _GetMIN_VALUE;
    {class} property SIZE: Integer read _GetSIZE;
    {class} property &TYPE: Jlang_Class read _GetTYPE;
  end;

  [JavaSignature('java/lang/Short')]
  JShort = interface(JNumber)
    ['{48D3B355-1222-4BD6-94BF-F40B5EE8EF02}']
    function byteValue: Byte; cdecl;
    function compareTo(anotherShort: JShort): Integer; cdecl;
    function doubleValue: Double; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function floatValue: Single; cdecl;
    function hashCode: Integer; cdecl; overload;
    function intValue: Integer; cdecl;
    function longValue: Int64; cdecl;
    function shortValue: SmallInt; cdecl;
    function toString: JString; cdecl; overload;
  end;
  TJShort = class(TJavaGenericImport<JShortClass, JShort>) end;

  JStackTraceElementClass = interface(JObjectClass)
    ['{21CBE31F-4A81-4CB3-ADB1-EA9B3166692E}']
    {class} function init(declaringClass: JString; methodName: JString; fileName: JString; lineNumber: Integer): JStackTraceElement; cdecl;
  end;

  [JavaSignature('java/lang/StackTraceElement')]
  JStackTraceElement = interface(JObject)
    ['{3304B89A-29EB-4B53-943F-E70F4252E8FF}']
    function equals(obj: JObject): Boolean; cdecl;
    function getClassName: JString; cdecl;
    function getFileName: JString; cdecl;
    function getLineNumber: Integer; cdecl;
    function getMethodName: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isNativeMethod: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJStackTraceElement = class(TJavaGenericImport<JStackTraceElementClass, JStackTraceElement>) end;

  JStringClass = interface(JObjectClass)
    ['{E61829D1-1FD3-49B2-BAC6-FB0FFDB1A495}']
    {class} function _GetCASE_INSENSITIVE_ORDER: JComparator; cdecl;
    {class} function init: JString; cdecl; overload;
    {class} function init(original: JString): JString; cdecl; overload;
    {class} function init(value: TJavaArray<Char>): JString; cdecl; overload;
    {class} function init(value: TJavaArray<Char>; offset: Integer; count: Integer): JString; cdecl; overload;
    {class} function init(codePoints: TJavaArray<Integer>; offset: Integer; count: Integer): JString; cdecl; overload;
    {class} function init(ascii: TJavaArray<Byte>; hibyte: Integer; offset: Integer; count: Integer): JString; cdecl; overload;//Deprecated
    {class} function init(ascii: TJavaArray<Byte>; hibyte: Integer): JString; cdecl; overload;//Deprecated
    {class} function init(bytes: TJavaArray<Byte>; offset: Integer; length: Integer; charsetName: JString): JString; cdecl; overload;
    {class} function init(bytes: TJavaArray<Byte>; offset: Integer; length: Integer; charset: JCharset): JString; cdecl; overload;
    {class} function init(bytes: TJavaArray<Byte>; charsetName: JString): JString; cdecl; overload;
    {class} function init(bytes: TJavaArray<Byte>; charset: JCharset): JString; cdecl; overload;
    {class} function init(bytes: TJavaArray<Byte>; offset: Integer; length: Integer): JString; cdecl; overload;
    {class} function init(bytes: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function init(buffer: JStringBuffer): JString; cdecl; overload;
    {class} function init(builder: JStringBuilder): JString; cdecl; overload;
    {class} function copyValueOf(data: TJavaArray<Char>; offset: Integer; count: Integer): JString; cdecl; overload;
    {class} function copyValueOf(data: TJavaArray<Char>): JString; cdecl; overload;
    {class} function join(delimiter: JCharSequence; elements: JIterable): JString; cdecl; overload;
    {class} function valueOf(obj: JObject): JString; cdecl; overload;
    {class} function valueOf(data: TJavaArray<Char>): JString; cdecl; overload;
    {class} function valueOf(data: TJavaArray<Char>; offset: Integer; count: Integer): JString; cdecl; overload;
    {class} function valueOf(b: Boolean): JString; cdecl; overload;
    {class} function valueOf(c: Char): JString; cdecl; overload;
    {class} function valueOf(i: Integer): JString; cdecl; overload;
    {class} function valueOf(l: Int64): JString; cdecl; overload;
    {class} function valueOf(f: Single): JString; cdecl; overload;
    {class} function valueOf(d: Double): JString; cdecl; overload;
    {class} property CASE_INSENSITIVE_ORDER: JComparator read _GetCASE_INSENSITIVE_ORDER;
  end;

  [JavaSignature('java/lang/String')]
  JString = interface(JObject)
    ['{8579B374-1E68-4729-AE3C-C8DA0A6D6F9F}']
    function charAt(index: Integer): Char; cdecl;
    function codePointAt(index: Integer): Integer; cdecl;
    function codePointBefore(index: Integer): Integer; cdecl;
    function codePointCount(beginIndex: Integer; endIndex: Integer): Integer; cdecl;
    function compareTo(anotherString: JString): Integer; cdecl;
    function compareToIgnoreCase(str: JString): Integer; cdecl;
    function concat(str: JString): JString; cdecl;
    function &contains(s: JCharSequence): Boolean; cdecl;
    function contentEquals(sb: JStringBuffer): Boolean; cdecl; overload;
    function contentEquals(cs: JCharSequence): Boolean; cdecl; overload;
    function endsWith(suffix: JString): Boolean; cdecl;
    function equals(anObject: JObject): Boolean; cdecl;
    function equalsIgnoreCase(anotherString: JString): Boolean; cdecl;
    procedure getBytes(srcBegin: Integer; srcEnd: Integer; dst: TJavaArray<Byte>; dstBegin: Integer); cdecl; overload;//Deprecated
    function getBytes(charsetName: JString): TJavaArray<Byte>; cdecl; overload;
    function getBytes(charset: JCharset): TJavaArray<Byte>; cdecl; overload;
    function getBytes: TJavaArray<Byte>; cdecl; overload;
    procedure getChars(srcBegin: Integer; srcEnd: Integer; dst: TJavaArray<Char>; dstBegin: Integer); cdecl;
    function hashCode: Integer; cdecl;
    function indexOf(ch: Integer): Integer; cdecl; overload;
    function indexOf(ch: Integer; fromIndex: Integer): Integer; cdecl; overload;
    function indexOf(str: JString): Integer; cdecl; overload;
    function indexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function intern: JString; cdecl;
    function isEmpty: Boolean; cdecl;
    function lastIndexOf(ch: Integer): Integer; cdecl; overload;
    function lastIndexOf(ch: Integer; fromIndex: Integer): Integer; cdecl; overload;
    function lastIndexOf(str: JString): Integer; cdecl; overload;
    function lastIndexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function length: Integer; cdecl;
    function matches(regex: JString): Boolean; cdecl;
    function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;
    function regionMatches(toffset: Integer; other: JString; ooffset: Integer; len: Integer): Boolean; cdecl; overload;
    function regionMatches(ignoreCase: Boolean; toffset: Integer; other: JString; ooffset: Integer; len: Integer): Boolean; cdecl; overload;
    function replace(oldChar: Char; newChar: Char): JString; cdecl; overload;
    function replace(target: JCharSequence; replacement: JCharSequence): JString; cdecl; overload;
    function replaceAll(regex: JString; replacement: JString): JString; cdecl;
    function replaceFirst(regex: JString; replacement: JString): JString; cdecl;
    function split(regex: JString; limit: Integer): TJavaObjectArray<JString>; cdecl; overload;
    function split(regex: JString): TJavaObjectArray<JString>; cdecl; overload;
    function startsWith(prefix: JString; toffset: Integer): Boolean; cdecl; overload;
    function startsWith(prefix: JString): Boolean; cdecl; overload;
    function subSequence(beginIndex: Integer; endIndex: Integer): JCharSequence; cdecl;
    function substring(beginIndex: Integer): JString; cdecl; overload;
    function substring(beginIndex: Integer; endIndex: Integer): JString; cdecl; overload;
    function toCharArray: TJavaArray<Char>; cdecl;
    function toLowerCase(locale: JLocale): JString; cdecl; overload;
    function toLowerCase: JString; cdecl; overload;
    function toString: JString; cdecl;
    function toUpperCase(locale: JLocale): JString; cdecl; overload;
    function toUpperCase: JString; cdecl; overload;
    function trim: JString; cdecl;
  end;
  TJString = class(TJavaGenericImport<JStringClass, JString>) end;

  JStringBufferClass = interface(JAbstractStringBuilderClass)
    ['{F6BF4ECD-EA63-4AF3-A901-99D4221796D7}']
    {class} function init: JStringBuffer; cdecl; overload;
    {class} function init(capacity: Integer): JStringBuffer; cdecl; overload;
    {class} function init(str: JString): JStringBuffer; cdecl; overload;
    {class} function init(seq: JCharSequence): JStringBuffer; cdecl; overload;
  end;

  [JavaSignature('java/lang/StringBuffer')]
  JStringBuffer = interface(JAbstractStringBuilder)
    ['{3CECFBBE-9C21-4D67-9F6F-52BB1DB2C638}']
    function append(obj: JObject): JStringBuffer; cdecl; overload;
    function append(str: JString): JStringBuffer; cdecl; overload;
    function append(sb: JStringBuffer): JStringBuffer; cdecl; overload;
    function append(s: JCharSequence): JStringBuffer; cdecl; overload;
    function append(s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;
    function append(str: TJavaArray<Char>): JStringBuffer; cdecl; overload;
    function append(str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuffer; cdecl; overload;
    function append(b: Boolean): JStringBuffer; cdecl; overload;
    function append(c: Char): JStringBuffer; cdecl; overload;
    function append(i: Integer): JStringBuffer; cdecl; overload;
    function append(lng: Int64): JStringBuffer; cdecl; overload;
    function append(f: Single): JStringBuffer; cdecl; overload;
    function append(d: Double): JStringBuffer; cdecl; overload;
    function appendCodePoint(codePoint: Integer): JStringBuffer; cdecl;
    function capacity: Integer; cdecl;
    function charAt(index: Integer): Char; cdecl;
    function codePointAt(index: Integer): Integer; cdecl;
    function codePointBefore(index: Integer): Integer; cdecl;
    function codePointCount(beginIndex: Integer; endIndex: Integer): Integer; cdecl;
    function delete(start: Integer; end_: Integer): JStringBuffer; cdecl;
    function deleteCharAt(index: Integer): JStringBuffer; cdecl;
    procedure ensureCapacity(minimumCapacity: Integer); cdecl;
    procedure getChars(srcBegin: Integer; srcEnd: Integer; dst: TJavaArray<Char>; dstBegin: Integer); cdecl;
    function indexOf(str: JString): Integer; cdecl; overload;
    function indexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function insert(index: Integer; str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; obj: JObject): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; str: JString): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; str: TJavaArray<Char>): JStringBuffer; cdecl; overload;
    function insert(dstOffset: Integer; s: JCharSequence): JStringBuffer; cdecl; overload;
    function insert(dstOffset: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; b: Boolean): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; c: Char): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; i: Integer): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; l: Int64): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; f: Single): JStringBuffer; cdecl; overload;
    function insert(offset: Integer; d: Double): JStringBuffer; cdecl; overload;
    function lastIndexOf(str: JString): Integer; cdecl; overload;
    function lastIndexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function length: Integer; cdecl;
    function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;
    function replace(start: Integer; end_: Integer; str: JString): JStringBuffer; cdecl;
    function reverse: JStringBuffer; cdecl;
    procedure setCharAt(index: Integer; ch: Char); cdecl;
    procedure setLength(newLength: Integer); cdecl;
    function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    function substring(start: Integer): JString; cdecl; overload;
    function substring(start: Integer; end_: Integer): JString; cdecl; overload;
    function toString: JString; cdecl;
    procedure trimToSize; cdecl;
  end;
  TJStringBuffer = class(TJavaGenericImport<JStringBufferClass, JStringBuffer>) end;

  JStringBuilderClass = interface(JAbstractStringBuilderClass)
    ['{D9FACB66-EE60-4BCB-B5B2-248751CCF1B4}']
    {class} function init: JStringBuilder; cdecl; overload;
    {class} function init(capacity: Integer): JStringBuilder; cdecl; overload;
    {class} function init(str: JString): JStringBuilder; cdecl; overload;
    {class} function init(seq: JCharSequence): JStringBuilder; cdecl; overload;
  end;

  [JavaSignature('java/lang/StringBuilder')]
  JStringBuilder = interface(JAbstractStringBuilder)
    ['{F8A75A66-EA10-4337-9ECC-B0CA4FF4D9C5}']
    function append(obj: JObject): JStringBuilder; cdecl; overload;
    function append(str: JString): JStringBuilder; cdecl; overload;
    function append(sb: JStringBuffer): JStringBuilder; cdecl; overload;
    function append(s: JCharSequence): JStringBuilder; cdecl; overload;
    function append(s: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;
    function append(str: TJavaArray<Char>): JStringBuilder; cdecl; overload;
    function append(str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuilder; cdecl; overload;
    function append(b: Boolean): JStringBuilder; cdecl; overload;
    function append(c: Char): JStringBuilder; cdecl; overload;
    function append(i: Integer): JStringBuilder; cdecl; overload;
    function append(lng: Int64): JStringBuilder; cdecl; overload;
    function append(f: Single): JStringBuilder; cdecl; overload;
    function append(d: Double): JStringBuilder; cdecl; overload;
    function appendCodePoint(codePoint: Integer): JStringBuilder; cdecl;
    function delete(start: Integer; end_: Integer): JStringBuilder; cdecl;
    function deleteCharAt(index: Integer): JStringBuilder; cdecl;
    function indexOf(str: JString): Integer; cdecl; overload;
    function indexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function insert(index: Integer; str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; obj: JObject): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; str: JString): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; str: TJavaArray<Char>): JStringBuilder; cdecl; overload;
    function insert(dstOffset: Integer; s: JCharSequence): JStringBuilder; cdecl; overload;
    function insert(dstOffset: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; b: Boolean): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; c: Char): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; i: Integer): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; l: Int64): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; f: Single): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; d: Double): JStringBuilder; cdecl; overload;
    function lastIndexOf(str: JString): Integer; cdecl; overload;
    function lastIndexOf(str: JString; fromIndex: Integer): Integer; cdecl; overload;
    function replace(start: Integer; end_: Integer; str: JString): JStringBuilder; cdecl;
    function reverse: JStringBuilder; cdecl;
    function toString: JString; cdecl;
  end;
  TJStringBuilder = class(TJavaGenericImport<JStringBuilderClass, JStringBuilder>) end;

  JThreadClass = interface(JObjectClass)
    ['{AC2B33CB-D349-4506-8809-B9762209222B}']
    {class} function _GetMAX_PRIORITY: Integer; cdecl;
    {class} function _GetMIN_PRIORITY: Integer; cdecl;
    {class} function _GetNORM_PRIORITY: Integer; cdecl;
    {class} function init: JThread; cdecl; overload;
    {class} function init(target: JRunnable): JThread; cdecl; overload;
    {class} function init(group: JThreadGroup; target: JRunnable): JThread; cdecl; overload;
    {class} function init(name: JString): JThread; cdecl; overload;
    {class} function init(group: JThreadGroup; name: JString): JThread; cdecl; overload;
    {class} function init(target: JRunnable; name: JString): JThread; cdecl; overload;
    {class} function init(group: JThreadGroup; target: JRunnable; name: JString): JThread; cdecl; overload;
    {class} function init(group: JThreadGroup; target: JRunnable; name: JString; stackSize: Int64): JThread; cdecl; overload;
    {class} function activeCount: Integer; cdecl;
    {class} function currentThread: JThread; cdecl;
    {class} procedure dumpStack; cdecl;
    {class} function enumerate(tarray: TJavaObjectArray<JThread>): Integer; cdecl;
    {class} function getAllStackTraces: TJavaObjectArray<JMap>; cdecl;
    {class} function getDefaultUncaughtExceptionHandler: JThread_UncaughtExceptionHandler; cdecl;
    {class} function holdsLock(obj: JObject): Boolean; cdecl;
    {class} function interrupted: Boolean; cdecl;
    {class} procedure setDefaultUncaughtExceptionHandler(eh: JThread_UncaughtExceptionHandler); cdecl;
    {class} procedure sleep(millis: Int64); cdecl; overload;
    {class} procedure sleep(millis: Int64; nanos: Integer); cdecl; overload;
    {class} procedure yield; cdecl;
    {class} property MAX_PRIORITY: Integer read _GetMAX_PRIORITY;
    {class} property MIN_PRIORITY: Integer read _GetMIN_PRIORITY;
    {class} property NORM_PRIORITY: Integer read _GetNORM_PRIORITY;
  end;

  [JavaSignature('java/lang/Thread')]
  JThread = interface(JObject)
    ['{8E288CBE-F5A4-4D6E-98B7-D0B5075A0FCA}']
    procedure checkAccess; cdecl;
    function countStackFrames: Integer; cdecl;//Deprecated
    procedure destroy; cdecl;//Deprecated
    function getContextClassLoader: JClassLoader; cdecl;
    function getId: Int64; cdecl;
    function getName: JString; cdecl;
    function getPriority: Integer; cdecl;
    function getStackTrace: TJavaObjectArray<JStackTraceElement>; cdecl;
    function getState: JThread_State; cdecl;
    function getThreadGroup: JThreadGroup; cdecl;
    function getUncaughtExceptionHandler: JThread_UncaughtExceptionHandler; cdecl;
    procedure interrupt; cdecl;
    function isAlive: Boolean; cdecl;
    function isDaemon: Boolean; cdecl;
    function isInterrupted: Boolean; cdecl;
    procedure join(millis: Int64); cdecl; overload;
    procedure join(millis: Int64; nanos: Integer); cdecl; overload;
    procedure join; cdecl; overload;
    procedure resume; cdecl;//Deprecated
    procedure run; cdecl;
    procedure setContextClassLoader(cl: JClassLoader); cdecl;
    procedure setDaemon(on: Boolean); cdecl;
    procedure setName(name: JString); cdecl;
    procedure setPriority(newPriority: Integer); cdecl;
    procedure setUncaughtExceptionHandler(eh: JThread_UncaughtExceptionHandler); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl; overload;//Deprecated
    procedure stop(obj: JThrowable); cdecl; overload;//Deprecated
    procedure suspend; cdecl;//Deprecated
    function toString: JString; cdecl;
  end;
  TJThread = class(TJavaGenericImport<JThreadClass, JThread>) end;

  JThread_StateClass = interface(JEnumClass)
    ['{493F7CE3-3BE4-4CE5-9F96-7563BC2DC814}']
    {class} function _GetBLOCKED: JThread_State; cdecl;
    {class} function _GetNEW: JThread_State; cdecl;
    {class} function _GetRUNNABLE: JThread_State; cdecl;
    {class} function _GetTERMINATED: JThread_State; cdecl;
    {class} function _GetTIMED_WAITING: JThread_State; cdecl;
    {class} function _GetWAITING: JThread_State; cdecl;
    {class} function valueOf(name: JString): JThread_State; cdecl;
    {class} function values: TJavaObjectArray<JThread_State>; cdecl;
    {class} property BLOCKED: JThread_State read _GetBLOCKED;
    {class} property NEW: JThread_State read _GetNEW;
    {class} property RUNNABLE: JThread_State read _GetRUNNABLE;
    {class} property TERMINATED: JThread_State read _GetTERMINATED;
    {class} property TIMED_WAITING: JThread_State read _GetTIMED_WAITING;
    {class} property WAITING: JThread_State read _GetWAITING;
  end;

  [JavaSignature('java/lang/Thread$State')]
  JThread_State = interface(JEnum)
    ['{E3910394-C461-461E-9C1D-64E9BC367F84}']
  end;
  TJThread_State = class(TJavaGenericImport<JThread_StateClass, JThread_State>) end;

  JThread_UncaughtExceptionHandlerClass = interface(IJavaClass)
    ['{3E2F71F3-BF00-457C-9970-9F1DA9EA7498}']
  end;

  [JavaSignature('java/lang/Thread$UncaughtExceptionHandler')]
  JThread_UncaughtExceptionHandler = interface(IJavaInstance)
    ['{C9E75389-E9B3-45FF-9EA2-D7BC024DB9DA}']
    procedure uncaughtException(t: JThread; e: JThrowable); cdecl;
  end;
  TJThread_UncaughtExceptionHandler = class(TJavaGenericImport<JThread_UncaughtExceptionHandlerClass, JThread_UncaughtExceptionHandler>) end;

  JThreadGroupClass = interface(JObjectClass)
    ['{D7D65FE0-0CB7-4C72-9129-C344705D0F4C}']
    {class} function init(name: JString): JThreadGroup; cdecl; overload;
    {class} function init(parent: JThreadGroup; name: JString): JThreadGroup; cdecl; overload;
  end;

  [JavaSignature('java/lang/ThreadGroup')]
  JThreadGroup = interface(JObject)
    ['{5BF3F856-7BFB-444A-8059-341CBC2A10B2}']
    function activeCount: Integer; cdecl;
    function activeGroupCount: Integer; cdecl;
    function allowThreadSuspension(b: Boolean): Boolean; cdecl;//Deprecated
    procedure checkAccess; cdecl;
    procedure destroy; cdecl;
    function enumerate(list: TJavaObjectArray<JThread>): Integer; cdecl; overload;
    function enumerate(list: TJavaObjectArray<JThread>; recurse: Boolean): Integer; cdecl; overload;
    function enumerate(list: TJavaObjectArray<JThreadGroup>): Integer; cdecl; overload;
    function enumerate(list: TJavaObjectArray<JThreadGroup>; recurse: Boolean): Integer; cdecl; overload;
    function getMaxPriority: Integer; cdecl;
    function getName: JString; cdecl;
    function getParent: JThreadGroup; cdecl;
    procedure interrupt; cdecl;
    function isDaemon: Boolean; cdecl;
    function isDestroyed: Boolean; cdecl;
    procedure list; cdecl;
    function parentOf(g: JThreadGroup): Boolean; cdecl;
    procedure resume; cdecl;//Deprecated
    procedure setDaemon(daemon: Boolean); cdecl;
    procedure setMaxPriority(pri: Integer); cdecl;
    procedure stop; cdecl;//Deprecated
    procedure suspend; cdecl;//Deprecated
    function toString: JString; cdecl;
    procedure uncaughtException(t: JThread; e: JThrowable); cdecl;
  end;
  TJThreadGroup = class(TJavaGenericImport<JThreadGroupClass, JThreadGroup>) end;

  JAnnotationClass = interface(IJavaClass)
    ['{E8A654D9-AA21-468D-AEF1-9261C6E3F760}']
  end;

  [JavaSignature('java/lang/annotation/Annotation')]
  JAnnotation = interface(IJavaInstance)
    ['{508C3063-7E6D-4963-B22F-27538F9D20CE}']
    function annotationType: Jlang_Class; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAnnotation = class(TJavaGenericImport<JAnnotationClass, JAnnotation>) end;

  JAccessibleObjectClass = interface(JObjectClass)
    ['{BFC4376F-593C-474E-804A-B2AD9F617DCC}']
    {class} procedure setAccessible(array_: TJavaObjectArray<JAccessibleObject>; flag: Boolean); cdecl; overload;
  end;

  [JavaSignature('java/lang/reflect/AccessibleObject')]
  JAccessibleObject = interface(JObject)
    ['{C062CF92-1A4F-4E32-94CB-2571A4C6A2DA}']
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function isAccessible: Boolean; cdecl;
    function isAnnotationPresent(annotationClass: Jlang_Class): Boolean; cdecl;
    procedure setAccessible(flag: Boolean); cdecl; overload;
  end;
  TJAccessibleObject = class(TJavaGenericImport<JAccessibleObjectClass, JAccessibleObject>) end;

  JAnnotatedElementClass = interface(IJavaClass)
    ['{B8D3187C-18C3-4B73-9C38-0CB31BEC79AD}']
  end;

  [JavaSignature('java/lang/reflect/AnnotatedElement')]
  JAnnotatedElement = interface(IJavaInstance)
    ['{D21138BE-6F61-4580-B687-82E3C44ECC9D}']
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function isAnnotationPresent(annotationClass: Jlang_Class): Boolean; cdecl;
  end;
  TJAnnotatedElement = class(TJavaGenericImport<JAnnotatedElementClass, JAnnotatedElement>) end;

  JExecutableClass = interface(JAccessibleObjectClass)
    ['{4CC5A892-808B-4158-A14C-E932AE3AA2DA}']
  end;

  [JavaSignature('java/lang/reflect/Executable')]
  JExecutable = interface(JAccessibleObject)
    ['{C094543B-9218-40A4-9D51-67C131336D98}']
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function getExceptionTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getGenericExceptionTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericParameterTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getParameterAnnotations: TJavaObjectBiArray<JAnnotation>; cdecl;
    function getParameterCount: Integer; cdecl;
    function getParameterTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getParameters: TJavaObjectArray<JParameter>; cdecl;
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl;
    function isSynthetic: Boolean; cdecl;
    function isVarArgs: Boolean; cdecl;
    function toGenericString: JString; cdecl;
  end;
  TJExecutable = class(TJavaGenericImport<JExecutableClass, JExecutable>) end;

  JConstructorClass = interface(JExecutableClass)
    ['{80E33E85-BECE-4E23-80BE-3F6D2AD32DA6}']
  end;

  [JavaSignature('java/lang/reflect/Constructor')]
  JConstructor = interface(JExecutable)
    ['{D765E763-03C2-4484-BF92-F8C5BC18BBC2}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function getExceptionTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getGenericExceptionTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericParameterTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getParameterAnnotations: TJavaObjectBiArray<JAnnotation>; cdecl;
    function getParameterCount: Integer; cdecl;
    function getParameterTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl;
    function hashCode: Integer; cdecl;
    function isSynthetic: Boolean; cdecl;
    function isVarArgs: Boolean; cdecl;
    function toGenericString: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJConstructor = class(TJavaGenericImport<JConstructorClass, JConstructor>) end;

  JFieldClass = interface(JAccessibleObjectClass)
    ['{76F4F74B-58A0-4CA5-A596-B027AE99C55E}']
  end;

  [JavaSignature('java/lang/reflect/Field')]
  JField = interface(JAccessibleObject)
    ['{756027C5-4F1B-4A24-BEF9-70D5A951744A}']
    function equals(obj: JObject): Boolean; cdecl;
    function &get(obj: JObject): JObject; cdecl;
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getBoolean(obj: JObject): Boolean; cdecl;
    function getByte(obj: JObject): Byte; cdecl;
    function getChar(obj: JObject): Char; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function getDouble(obj: JObject): Double; cdecl;
    function getFloat(obj: JObject): Single; cdecl;
    function getGenericType: Jreflect_Type; cdecl;
    function getInt(obj: JObject): Integer; cdecl;
    function getLong(obj: JObject): Int64; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getShort(obj: JObject): SmallInt; cdecl;
    function getType: Jlang_Class; cdecl;
    function hashCode: Integer; cdecl;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl;
    function isEnumConstant: Boolean; cdecl;
    function isSynthetic: Boolean; cdecl;
    procedure &set(obj: JObject; value: JObject); cdecl;
    procedure setBoolean(obj: JObject; z: Boolean); cdecl;
    procedure setByte(obj: JObject; b: Byte); cdecl;
    procedure setChar(obj: JObject; c: Char); cdecl;
    procedure setDouble(obj: JObject; d: Double); cdecl;
    procedure setFloat(obj: JObject; f: Single); cdecl;
    procedure setInt(obj: JObject; i: Integer); cdecl;
    procedure setLong(obj: JObject; l: Int64); cdecl;
    procedure setShort(obj: JObject; s: SmallInt); cdecl;
    function toGenericString: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJField = class(TJavaGenericImport<JFieldClass, JField>) end;

  JGenericDeclarationClass = interface(JAnnotatedElementClass)
    ['{193301E7-C0FE-473C-BBC1-94DAF25C4497}']
  end;

  [JavaSignature('java/lang/reflect/GenericDeclaration')]
  JGenericDeclaration = interface(JAnnotatedElement)
    ['{BD87C28A-4E41-4E44-A2F9-03BB724E9ECC}']
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl;
  end;
  TJGenericDeclaration = class(TJavaGenericImport<JGenericDeclarationClass, JGenericDeclaration>) end;

  JMethodClass = interface(JExecutableClass)
    ['{C995BD27-1D77-48E5-B478-EB8E9E607020}']
  end;

  [JavaSignature('java/lang/reflect/Method')]
  JMethod = interface(JExecutable)
    ['{ED1B0770-0BD6-4D4A-B801-9D18AB92C834}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaringClass: Jlang_Class; cdecl;
    function getDefaultValue: JObject; cdecl;
    function getExceptionTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getGenericExceptionTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericParameterTypes: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericReturnType: Jreflect_Type; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getParameterAnnotations: TJavaObjectBiArray<JAnnotation>; cdecl;
    function getParameterCount: Integer; cdecl;
    function getParameterTypes: TJavaObjectArray<Jlang_Class>; cdecl;
    function getReturnType: Jlang_Class; cdecl;
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl;
    function hashCode: Integer; cdecl;
    function isBridge: Boolean; cdecl;
    function isDefault: Boolean; cdecl;
    function isSynthetic: Boolean; cdecl;
    function isVarArgs: Boolean; cdecl;
    function toGenericString: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJMethod = class(TJavaGenericImport<JMethodClass, JMethod>) end;

  JParameterClass = interface(JObjectClass)
    ['{E28B4510-A3B5-44B0-8F29-D96374EC5698}']
  end;

  [JavaSignature('java/lang/reflect/Parameter')]
  JParameter = interface(JObject)
    ['{16D21E3B-C67D-4820-B8CE-83A3A5B26746}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotation(annotationClass: Jlang_Class): JAnnotation; cdecl;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaredAnnotationsByType(annotationClass: Jlang_Class): TJavaObjectArray<JAnnotation>; cdecl;
    function getDeclaringExecutable: JExecutable; cdecl;
    function getModifiers: Integer; cdecl;
    function getName: JString; cdecl;
    function getParameterizedType: Jreflect_Type; cdecl;
    function getType: Jlang_Class; cdecl;
    function hashCode: Integer; cdecl;
    function isImplicit: Boolean; cdecl;
    function isNamePresent: Boolean; cdecl;
    function isSynthetic: Boolean; cdecl;
    function isVarArgs: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJParameter = class(TJavaGenericImport<JParameterClass, JParameter>) end;

  Jreflect_TypeClass = interface(IJavaClass)
    ['{843FF2A0-9372-4F7B-9CF7-C825AFD78970}']
  end;

  [JavaSignature('java/lang/reflect/Type')]
  Jreflect_Type = interface(IJavaInstance)
    ['{90AD4932-3D22-4B5B-B279-56EC7A2174CD}']
  end;
  TJreflect_Type = class(TJavaGenericImport<Jreflect_TypeClass, Jreflect_Type>) end;

  JTypeVariableClass = interface(Jreflect_TypeClass)
    ['{26AC832B-6883-4CDF-8BDC-49E5A1E6B0EF}']
  end;

  [JavaSignature('java/lang/reflect/TypeVariable')]
  JTypeVariable = interface(Jreflect_Type)
    ['{5635CD21-A6AD-420D-B742-599EC17C5931}']
    function getBounds: TJavaObjectArray<Jreflect_Type>; cdecl;
    function getGenericDeclaration: JGenericDeclaration; cdecl;
    function getName: JString; cdecl;
  end;
  TJTypeVariable = class(TJavaGenericImport<JTypeVariableClass, JTypeVariable>) end;

  JBigIntegerClass = interface(JNumberClass)
    ['{ACED883B-58FF-466A-80D3-BB30E54F84A5}']
    {class} function _GetONE: JBigInteger; cdecl;
    {class} function _GetTEN: JBigInteger; cdecl;
    {class} function _GetZERO: JBigInteger; cdecl;
    {class} function init(numBits: Integer; random: JRandom): JBigInteger; cdecl; overload;
    {class} function init(bitLength: Integer; certainty: Integer; random: JRandom): JBigInteger; cdecl; overload;
    {class} function init(value: JString): JBigInteger; cdecl; overload;
    {class} function init(value: JString; radix: Integer): JBigInteger; cdecl; overload;
    {class} function init(signum: Integer; magnitude: TJavaArray<Byte>): JBigInteger; cdecl; overload;
    {class} function init(value: TJavaArray<Byte>): JBigInteger; cdecl; overload;
    {class} function probablePrime(bitLength: Integer; random: JRandom): JBigInteger; cdecl;
    {class} function valueOf(value: Int64): JBigInteger; cdecl;
    {class} property ONE: JBigInteger read _GetONE;
    {class} property TEN: JBigInteger read _GetTEN;
    {class} property ZERO: JBigInteger read _GetZERO;
  end;

  [JavaSignature('java/math/BigInteger')]
  JBigInteger = interface(JNumber)
    ['{4B14E1DC-D46C-4434-BF1C-E804437732C3}']
    function abs: JBigInteger; cdecl;
    function add(value: JBigInteger): JBigInteger; cdecl;
    function &and(value: JBigInteger): JBigInteger; cdecl;
    function andNot(value: JBigInteger): JBigInteger; cdecl;
    function bitCount: Integer; cdecl;
    function bitLength: Integer; cdecl;
    function clearBit(n: Integer): JBigInteger; cdecl;
    function compareTo(value: JBigInteger): Integer; cdecl;
    function divide(divisor: JBigInteger): JBigInteger; cdecl;
    function divideAndRemainder(divisor: JBigInteger): TJavaObjectArray<JBigInteger>; cdecl;
    function doubleValue: Double; cdecl;
    function equals(x: JObject): Boolean; cdecl;
    function flipBit(n: Integer): JBigInteger; cdecl;
    function floatValue: Single; cdecl;
    function gcd(value: JBigInteger): JBigInteger; cdecl;
    function getLowestSetBit: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function intValue: Integer; cdecl;
    function isProbablePrime(certainty: Integer): Boolean; cdecl;
    function longValue: Int64; cdecl;
    function max(value: JBigInteger): JBigInteger; cdecl;
    function min(value: JBigInteger): JBigInteger; cdecl;
    function &mod(m: JBigInteger): JBigInteger; cdecl;
    function modInverse(m: JBigInteger): JBigInteger; cdecl;
    function modPow(exponent: JBigInteger; modulus: JBigInteger): JBigInteger; cdecl;
    function multiply(value: JBigInteger): JBigInteger; cdecl;
    function negate: JBigInteger; cdecl;
    function nextProbablePrime: JBigInteger; cdecl;
    function &not: JBigInteger; cdecl;
    function &or(value: JBigInteger): JBigInteger; cdecl;
    function pow(exp: Integer): JBigInteger; cdecl;
    function remainder(divisor: JBigInteger): JBigInteger; cdecl;
    function setBit(n: Integer): JBigInteger; cdecl;
    function shiftLeft(n: Integer): JBigInteger; cdecl;
    function shiftRight(n: Integer): JBigInteger; cdecl;
    function signum: Integer; cdecl;
    function subtract(value: JBigInteger): JBigInteger; cdecl;
    function testBit(n: Integer): Boolean; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function toString: JString; cdecl; overload;
    function toString(radix: Integer): JString; cdecl; overload;
    function &xor(value: JBigInteger): JBigInteger; cdecl;
  end;
  TJBigInteger = class(TJavaGenericImport<JBigIntegerClass, JBigInteger>) end;

  JBufferClass = interface(JObjectClass)
    ['{481ABEA6-E331-446F-BF1A-789FC5B36341}']
  end;

  [JavaSignature('java/nio/Buffer')]
  JBuffer = interface(JObject)
    ['{0F836282-2E7D-40FE-BFA9-9B58507FB238}']
    function &array: JObject; cdecl;
    function arrayOffset: Integer; cdecl;
    function capacity: Integer; cdecl;
    function clear: JBuffer; cdecl;
    function flip: JBuffer; cdecl;
    function hasArray: Boolean; cdecl;
    function hasRemaining: Boolean; cdecl;
    function isDirect: Boolean; cdecl;
    function isReadOnly: Boolean; cdecl;
    function limit: Integer; cdecl; overload;
    function limit(newLimit: Integer): JBuffer; cdecl; overload;
    function mark: JBuffer; cdecl;
    function position: Integer; cdecl; overload;
    function position(newPosition: Integer): JBuffer; cdecl; overload;
    function remaining: Integer; cdecl;
    function reset: JBuffer; cdecl;
    function rewind: JBuffer; cdecl;
  end;
  TJBuffer = class(TJavaGenericImport<JBufferClass, JBuffer>) end;

  JByteBufferClass = interface(JBufferClass)
    ['{7B879DB7-5B81-4A1F-B862-6127F1BE739D}']
    {class} function allocate(capacity: Integer): JByteBuffer; cdecl;
    {class} function allocateDirect(capacity: Integer): JByteBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Byte>; offset: Integer; length: Integer): JByteBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Byte>): JByteBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/ByteBuffer')]
  JByteBuffer = interface(JBuffer)
    ['{CB03FB80-318C-4812-97DE-59301638C25A}']
    function &array: TJavaArray<Byte>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asCharBuffer: JCharBuffer; cdecl;
    function asDoubleBuffer: JDoubleBuffer; cdecl;
    function asFloatBuffer: JFloatBuffer; cdecl;
    function asIntBuffer: JIntBuffer; cdecl;
    function asLongBuffer: JLongBuffer; cdecl;
    function asReadOnlyBuffer: JByteBuffer; cdecl;
    function asShortBuffer: JShortBuffer; cdecl;
    function compact: JByteBuffer; cdecl;
    function compareTo(that: JByteBuffer): Integer; cdecl;
    function duplicate: JByteBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Byte; cdecl; overload;
    function &get(index: Integer): Byte; cdecl; overload;
    function &get(dst: TJavaArray<Byte>; offset: Integer; length: Integer): JByteBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Byte>): JByteBuffer; cdecl; overload;
    function getChar: Char; cdecl; overload;
    function getChar(index: Integer): Char; cdecl; overload;
    function getDouble: Double; cdecl; overload;
    function getDouble(index: Integer): Double; cdecl; overload;
    function getFloat: Single; cdecl; overload;
    function getFloat(index: Integer): Single; cdecl; overload;
    function getInt: Integer; cdecl; overload;
    function getInt(index: Integer): Integer; cdecl; overload;
    function getLong: Int64; cdecl; overload;
    function getLong(index: Integer): Int64; cdecl; overload;
    function getShort: SmallInt; cdecl; overload;
    function getShort(index: Integer): SmallInt; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl; overload;
    function order(bo: JByteOrder): JByteBuffer; cdecl; overload;
    function put(b: Byte): JByteBuffer; cdecl; overload;
    function put(index: Integer; b: Byte): JByteBuffer; cdecl; overload;
    function put(src: JByteBuffer): JByteBuffer; cdecl; overload;
    function put(src: TJavaArray<Byte>; offset: Integer; length: Integer): JByteBuffer; cdecl; overload;
    function put(src: TJavaArray<Byte>): JByteBuffer; cdecl; overload;
    function putChar(value: Char): JByteBuffer; cdecl; overload;
    function putChar(index: Integer; value: Char): JByteBuffer; cdecl; overload;
    function putDouble(value: Double): JByteBuffer; cdecl; overload;
    function putDouble(index: Integer; value: Double): JByteBuffer; cdecl; overload;
    function putFloat(value: Single): JByteBuffer; cdecl; overload;
    function putFloat(index: Integer; value: Single): JByteBuffer; cdecl; overload;
    function putInt(value: Integer): JByteBuffer; cdecl; overload;
    function putInt(index: Integer; value: Integer): JByteBuffer; cdecl; overload;
    function putLong(value: Int64): JByteBuffer; cdecl; overload;
    function putLong(index: Integer; value: Int64): JByteBuffer; cdecl; overload;
    function putShort(value: SmallInt): JByteBuffer; cdecl; overload;
    function putShort(index: Integer; value: SmallInt): JByteBuffer; cdecl; overload;
    function slice: JByteBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJByteBuffer = class(TJavaGenericImport<JByteBufferClass, JByteBuffer>) end;

  JByteOrderClass = interface(JObjectClass)
    ['{254AAEC7-B381-4D22-89B2-D2BB46C88689}']
    {class} function _GetBIG_ENDIAN: JByteOrder; cdecl;
    {class} function _GetLITTLE_ENDIAN: JByteOrder; cdecl;
    {class} function nativeOrder: JByteOrder; cdecl;
    {class} 
    {class} 
  end;

  [JavaSignature('java/nio/ByteOrder')]
  JByteOrder = interface(JObject)
    ['{70FDB472-70CD-4FB1-B5FC-D6442C186BD2}']
    function toString: JString; cdecl;
  end;
  TJByteOrder = class(TJavaGenericImport<JByteOrderClass, JByteOrder>) end;

  JCharBufferClass = interface(JBufferClass)
    ['{E542BA92-3ABD-4A87-9D97-65DD774C716C}']
    {class} function allocate(capacity: Integer): JCharBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Char>; offset: Integer; length: Integer): JCharBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Char>): JCharBuffer; cdecl; overload;
    {class} function wrap(csq: JCharSequence; start: Integer; end_: Integer): JCharBuffer; cdecl; overload;
    {class} function wrap(csq: JCharSequence): JCharBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/CharBuffer')]
  JCharBuffer = interface(JBuffer)
    ['{C499497D-72A7-49D7-AB4C-ADE9BBCAEA61}']
    function append(csq: JCharSequence): JCharBuffer; cdecl; overload;
    function append(csq: JCharSequence; start: Integer; end_: Integer): JCharBuffer; cdecl; overload;
    function append(c: Char): JCharBuffer; cdecl; overload;
    function &array: TJavaArray<Char>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JCharBuffer; cdecl;
    function charAt(index: Integer): Char; cdecl;
    function chars: JIntStream; cdecl;
    function compact: JCharBuffer; cdecl;
    function compareTo(that: JCharBuffer): Integer; cdecl;
    function duplicate: JCharBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Char; cdecl; overload;
    function &get(index: Integer): Char; cdecl; overload;
    function &get(dst: TJavaArray<Char>; offset: Integer; length: Integer): JCharBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Char>): JCharBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function length: Integer; cdecl;
    function order: JByteOrder; cdecl;
    function put(c: Char): JCharBuffer; cdecl; overload;
    function put(index: Integer; c: Char): JCharBuffer; cdecl; overload;
    function put(src: JCharBuffer): JCharBuffer; cdecl; overload;
    function put(src: TJavaArray<Char>; offset: Integer; length: Integer): JCharBuffer; cdecl; overload;
    function put(src: TJavaArray<Char>): JCharBuffer; cdecl; overload;
    function put(src: JString; start: Integer; end_: Integer): JCharBuffer; cdecl; overload;
    function put(src: JString): JCharBuffer; cdecl; overload;
    function read(target: JCharBuffer): Integer; cdecl;
    function slice: JCharBuffer; cdecl;
    function subSequence(start: Integer; end_: Integer): JCharBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJCharBuffer = class(TJavaGenericImport<JCharBufferClass, JCharBuffer>) end;

  JDoubleBufferClass = interface(JBufferClass)
    ['{05DB46C4-1C05-4F67-AE29-98B4A2703C63}']
    {class} function allocate(capacity: Integer): JDoubleBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Double>; offset: Integer; length: Integer): JDoubleBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Double>): JDoubleBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/DoubleBuffer')]
  JDoubleBuffer = interface(JBuffer)
    ['{1A1190DA-622D-48E4-A9D4-675ABCFACDCD}']
    function &array: TJavaArray<Double>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JDoubleBuffer; cdecl;
    function compact: JDoubleBuffer; cdecl;
    function compareTo(that: JDoubleBuffer): Integer; cdecl;
    function duplicate: JDoubleBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Double; cdecl; overload;
    function &get(index: Integer): Double; cdecl; overload;
    function &get(dst: TJavaArray<Double>; offset: Integer; length: Integer): JDoubleBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Double>): JDoubleBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl;
    function put(d: Double): JDoubleBuffer; cdecl; overload;
    function put(index: Integer; d: Double): JDoubleBuffer; cdecl; overload;
    function put(src: JDoubleBuffer): JDoubleBuffer; cdecl; overload;
    function put(src: TJavaArray<Double>; offset: Integer; length: Integer): JDoubleBuffer; cdecl; overload;
    function put(src: TJavaArray<Double>): JDoubleBuffer; cdecl; overload;
    function slice: JDoubleBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJDoubleBuffer = class(TJavaGenericImport<JDoubleBufferClass, JDoubleBuffer>) end;

  JFloatBufferClass = interface(JBufferClass)
    ['{A60ABCB4-E169-4F72-B24F-991D48A476C4}']
    {class} function allocate(capacity: Integer): JFloatBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Single>; offset: Integer; length: Integer): JFloatBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Single>): JFloatBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/FloatBuffer')]
  JFloatBuffer = interface(JBuffer)
    ['{E416608F-FCBC-4B4E-B43B-E2C4794C95A6}']
    function &array: TJavaArray<Single>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JFloatBuffer; cdecl;
    function compact: JFloatBuffer; cdecl;
    function compareTo(that: JFloatBuffer): Integer; cdecl;
    function duplicate: JFloatBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Single; cdecl; overload;
    function &get(index: Integer): Single; cdecl; overload;
    function &get(dst: TJavaArray<Single>; offset: Integer; length: Integer): JFloatBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Single>): JFloatBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl;
    function put(f: Single): JFloatBuffer; cdecl; overload;
    function put(index: Integer; f: Single): JFloatBuffer; cdecl; overload;
    function put(src: JFloatBuffer): JFloatBuffer; cdecl; overload;
    function put(src: TJavaArray<Single>; offset: Integer; length: Integer): JFloatBuffer; cdecl; overload;
    function put(src: TJavaArray<Single>): JFloatBuffer; cdecl; overload;
    function slice: JFloatBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJFloatBuffer = class(TJavaGenericImport<JFloatBufferClass, JFloatBuffer>) end;

  JIntBufferClass = interface(JBufferClass)
    ['{23604D5E-E540-41E0-8E8C-F43F7B4DA36F}']
    {class} function allocate(capacity: Integer): JIntBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Integer>; offset: Integer; length: Integer): JIntBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Integer>): JIntBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/IntBuffer')]
  JIntBuffer = interface(JBuffer)
    ['{18A20B5E-DB12-4AE4-B1C8-EDAE822D4438}']
    function &array: TJavaArray<Integer>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JIntBuffer; cdecl;
    function compact: JIntBuffer; cdecl;
    function compareTo(that: JIntBuffer): Integer; cdecl;
    function duplicate: JIntBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Integer; cdecl; overload;
    function &get(index: Integer): Integer; cdecl; overload;
    function &get(dst: TJavaArray<Integer>; offset: Integer; length: Integer): JIntBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Integer>): JIntBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl;
    function put(i: Integer): JIntBuffer; cdecl; overload;
    function put(index: Integer; i: Integer): JIntBuffer; cdecl; overload;
    function put(src: JIntBuffer): JIntBuffer; cdecl; overload;
    function put(src: TJavaArray<Integer>; offset: Integer; length: Integer): JIntBuffer; cdecl; overload;
    function put(src: TJavaArray<Integer>): JIntBuffer; cdecl; overload;
    function slice: JIntBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJIntBuffer = class(TJavaGenericImport<JIntBufferClass, JIntBuffer>) end;

  JLongBufferClass = interface(JBufferClass)
    ['{2DD88EBD-4825-41DD-81D4-547FE1186E0F}']
    {class} function allocate(capacity: Integer): JLongBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<Int64>; offset: Integer; length: Integer): JLongBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<Int64>): JLongBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/LongBuffer')]
  JLongBuffer = interface(JBuffer)
    ['{C28DFBB8-1B26-447C-944E-74C879A70A89}']
    function &array: TJavaArray<Int64>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JLongBuffer; cdecl;
    function compact: JLongBuffer; cdecl;
    function compareTo(that: JLongBuffer): Integer; cdecl;
    function duplicate: JLongBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: Int64; cdecl; overload;
    function &get(index: Integer): Int64; cdecl; overload;
    function &get(dst: TJavaArray<Int64>; offset: Integer; length: Integer): JLongBuffer; cdecl; overload;
    function &get(dst: TJavaArray<Int64>): JLongBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl;
    function put(l: Int64): JLongBuffer; cdecl; overload;
    function put(index: Integer; l: Int64): JLongBuffer; cdecl; overload;
    function put(src: JLongBuffer): JLongBuffer; cdecl; overload;
    function put(src: TJavaArray<Int64>; offset: Integer; length: Integer): JLongBuffer; cdecl; overload;
    function put(src: TJavaArray<Int64>): JLongBuffer; cdecl; overload;
    function slice: JLongBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJLongBuffer = class(TJavaGenericImport<JLongBufferClass, JLongBuffer>) end;

  JMappedByteBufferClass = interface(JByteBufferClass)
    ['{8319CCA3-84E6-4EF9-9891-40E4EAF11FE0}']
  end;

  [JavaSignature('java/nio/MappedByteBuffer')]
  JMappedByteBuffer = interface(JByteBuffer)
    ['{744B5B84-744A-436D-ABFB-DC3EB2C9022A}']
    function force: JMappedByteBuffer; cdecl;
    function isLoaded: Boolean; cdecl;
    function load: JMappedByteBuffer; cdecl;
  end;
  TJMappedByteBuffer = class(TJavaGenericImport<JMappedByteBufferClass, JMappedByteBuffer>) end;

  JShortBufferClass = interface(JBufferClass)
    ['{7F52529D-4DFE-4414-B069-986D89949E27}']
    {class} function allocate(capacity: Integer): JShortBuffer; cdecl;
    {class} function wrap(array_: TJavaArray<SmallInt>; offset: Integer; length: Integer): JShortBuffer; cdecl; overload;
    {class} function wrap(array_: TJavaArray<SmallInt>): JShortBuffer; cdecl; overload;
  end;

  [JavaSignature('java/nio/ShortBuffer')]
  JShortBuffer = interface(JBuffer)
    ['{37B8425A-8596-4CA0-966F-629D0F25C8E9}']
    function &array: TJavaArray<SmallInt>; cdecl;
    function arrayOffset: Integer; cdecl;
    function asReadOnlyBuffer: JShortBuffer; cdecl;
    function compact: JShortBuffer; cdecl;
    function compareTo(that: JShortBuffer): Integer; cdecl;
    function duplicate: JShortBuffer; cdecl;
    function equals(ob: JObject): Boolean; cdecl;
    function &get: SmallInt; cdecl; overload;
    function &get(index: Integer): SmallInt; cdecl; overload;
    function &get(dst: TJavaArray<SmallInt>; offset: Integer; length: Integer): JShortBuffer; cdecl; overload;
    function &get(dst: TJavaArray<SmallInt>): JShortBuffer; cdecl; overload;
    function hasArray: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isDirect: Boolean; cdecl;
    function order: JByteOrder; cdecl;
    function put(s: SmallInt): JShortBuffer; cdecl; overload;
    function put(index: Integer; s: SmallInt): JShortBuffer; cdecl; overload;
    function put(src: JShortBuffer): JShortBuffer; cdecl; overload;
    function put(src: TJavaArray<SmallInt>; offset: Integer; length: Integer): JShortBuffer; cdecl; overload;
    function put(src: TJavaArray<SmallInt>): JShortBuffer; cdecl; overload;
    function slice: JShortBuffer; cdecl;
    function toString: JString; cdecl;
  end;
  TJShortBuffer = class(TJavaGenericImport<JShortBufferClass, JShortBuffer>) end;

  JAsynchronousFileChannelClass = interface(JObjectClass)
    ['{3FF811CE-7537-46C1-888F-6C1B2DC3E348}']
  end;

  [JavaSignature('java/nio/channels/AsynchronousFileChannel')]
  JAsynchronousFileChannel = interface(JObject)
    ['{75859ED6-C6B8-4AD2-A87E-D2494E409383}']
    procedure force(metaData: Boolean); cdecl;
    procedure lock(position: Int64; size: Int64; shared: Boolean; attachment: JObject; handler: JCompletionHandler); cdecl; overload;
    procedure lock(attachment: JObject; handler: JCompletionHandler); cdecl; overload;
    function lock(position: Int64; size: Int64; shared: Boolean): JFuture; cdecl; overload;
    function lock: JFuture; cdecl; overload;
    procedure read(dst: JByteBuffer; position: Int64; attachment: JObject; handler: JCompletionHandler); cdecl; overload;
    function read(dst: JByteBuffer; position: Int64): JFuture; cdecl; overload;
    function size: Int64; cdecl;
    function truncate(size: Int64): JAsynchronousFileChannel; cdecl;
    function tryLock(position: Int64; size: Int64; shared: Boolean): JFileLock; cdecl; overload;
    function tryLock: JFileLock; cdecl; overload;
    procedure write(src: JByteBuffer; position: Int64; attachment: JObject; handler: JCompletionHandler); cdecl; overload;
    function write(src: JByteBuffer; position: Int64): JFuture; cdecl; overload;
  end;
  TJAsynchronousFileChannel = class(TJavaGenericImport<JAsynchronousFileChannelClass, JAsynchronousFileChannel>) end;

  JChannelClass = interface(JCloseableClass)
    ['{0902E632-8B6C-4FCD-9C18-C69A76F11C8B}']
  end;

  [JavaSignature('java/nio/channels/Channel')]
  JChannel = interface(JCloseable)
    ['{34601709-0C2E-4791-BFBD-703EE16A9203}']
    procedure close; cdecl;
    function isOpen: Boolean; cdecl;
  end;
  TJChannel = class(TJavaGenericImport<JChannelClass, JChannel>) end;

  JReadableByteChannelClass = interface(JChannelClass)
    ['{3B4589E7-BD37-4B54-AC98-44050F3AE209}']
  end;

  [JavaSignature('java/nio/channels/ReadableByteChannel')]
  JReadableByteChannel = interface(JChannel)
    ['{D6B0CB63-51D0-48C6-882A-A44D30FD7521}']
    function read(dst: JByteBuffer): Integer; cdecl;
  end;
  TJReadableByteChannel = class(TJavaGenericImport<JReadableByteChannelClass, JReadableByteChannel>) end;

  JByteChannelClass = interface(JReadableByteChannelClass)
    ['{6343504F-BBAC-463E-B4DD-06D01C7FA81C}']
  end;

  [JavaSignature('java/nio/channels/ByteChannel')]
  JByteChannel = interface(JReadableByteChannel)
    ['{9C81B103-74C3-4CD1-B7D0-47CFD215C8D2}']
  end;
  TJByteChannel = class(TJavaGenericImport<JByteChannelClass, JByteChannel>) end;

  JCompletionHandlerClass = interface(IJavaClass)
    ['{6AFDC8A0-EA8A-449E-ACC6-C714253E7A87}']
  end;

  [JavaSignature('java/nio/channels/CompletionHandler')]
  JCompletionHandler = interface(IJavaInstance)
    ['{385389E3-D8BC-496F-8664-2BEBE4FE0528}']
    procedure completed(result: JObject; attachment: JObject); cdecl;
    procedure failed(exc: JThrowable; attachment: JObject); cdecl;
  end;
  TJCompletionHandler = class(TJavaGenericImport<JCompletionHandlerClass, JCompletionHandler>) end;

  JAbstractInterruptibleChannelClass = interface(JObjectClass)
    ['{D731C7B5-9CD9-4511-9F57-5CD66940B97E}']
  end;

  [JavaSignature('java/nio/channels/spi/AbstractInterruptibleChannel')]
  JAbstractInterruptibleChannel = interface(JObject)
    ['{DD7C42BD-DAA0-4134-A220-0DFAE23964AF}']
    procedure close; cdecl;
    function isOpen: Boolean; cdecl;
  end;
  TJAbstractInterruptibleChannel = class(TJavaGenericImport<JAbstractInterruptibleChannelClass, JAbstractInterruptibleChannel>) end;

  JSelectableChannelClass = interface(JAbstractInterruptibleChannelClass)
    ['{F0A109A2-C857-4C0B-91FC-DC9E4EA0D1F5}']
  end;

  [JavaSignature('java/nio/channels/SelectableChannel')]
  JSelectableChannel = interface(JAbstractInterruptibleChannel)
    ['{539916DF-2B5B-4EBC-B849-666F3DD4FF0C}']
    function blockingLock: JObject; cdecl;
    function configureBlocking(block: Boolean): JSelectableChannel; cdecl;
    function isBlocking: Boolean; cdecl;
    function isRegistered: Boolean; cdecl;
    function keyFor(sel: JSelector): JSelectionKey; cdecl;
    function provider: JSelectorProvider; cdecl;
    function register(sel: JSelector; ops: Integer; att: JObject): JSelectionKey; cdecl; overload;
    function register(sel: JSelector; ops: Integer): JSelectionKey; cdecl; overload;
    function validOps: Integer; cdecl;
  end;
  TJSelectableChannel = class(TJavaGenericImport<JSelectableChannelClass, JSelectableChannel>) end;

  JAbstractSelectableChannelClass = interface(JSelectableChannelClass)
    ['{37576352-D59D-443D-AF66-1C3123236500}']
  end;

  [JavaSignature('java/nio/channels/spi/AbstractSelectableChannel')]
  JAbstractSelectableChannel = interface(JSelectableChannel)
    ['{28EB411A-49FE-4194-9591-CC8E2349B35A}']
    function blockingLock: JObject; cdecl;
    function configureBlocking(block: Boolean): JSelectableChannel; cdecl;
    function isBlocking: Boolean; cdecl;
    function isRegistered: Boolean; cdecl;
    function keyFor(sel: JSelector): JSelectionKey; cdecl;
    function provider: JSelectorProvider; cdecl;
    function register(sel: JSelector; ops: Integer; att: JObject): JSelectionKey; cdecl;
  end;
  TJAbstractSelectableChannel = class(TJavaGenericImport<JAbstractSelectableChannelClass, JAbstractSelectableChannel>) end;

  JDatagramChannelClass = interface(JAbstractSelectableChannelClass)
    ['{39ACC9DA-3833-4EAA-ABDA-904EBB9D1D82}']
    {class} function open: JDatagramChannel; cdecl; overload;
    {class} //function open(family: JProtocolFamily): JDatagramChannel; cdecl; overload;
  end;

  [JavaSignature('java/nio/channels/DatagramChannel')]
  JDatagramChannel = interface(JAbstractSelectableChannel)
    ['{90205C70-B349-480B-BEFA-1B850C27F130}']
    //function bind(local: JSocketAddress): JDatagramChannel; cdecl;
    //function connect(remote: JSocketAddress): JDatagramChannel; cdecl;
    function disconnect: JDatagramChannel; cdecl;
    //function getLocalAddress: JSocketAddress; cdecl;
    //function getRemoteAddress: JSocketAddress; cdecl;
    function isConnected: Boolean; cdecl;
    function read(dst: JByteBuffer): Integer; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
    //function receive(dst: JByteBuffer): JSocketAddress; cdecl;
    //function send(src: JByteBuffer; target: JSocketAddress): Integer; cdecl;
    //function setOption(name: JSocketOption; value: JObject): JDatagramChannel; cdecl;
    //function socket: JDatagramSocket; cdecl;
    function validOps: Integer; cdecl;
    function write(src: JByteBuffer): Integer; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
  end;
  TJDatagramChannel = class(TJavaGenericImport<JDatagramChannelClass, JDatagramChannel>) end;

  JFileChannelClass = interface(JAbstractInterruptibleChannelClass)
    ['{35072FC4-075A-45BF-99F9-E2ED20581B95}']
  end;

  [JavaSignature('java/nio/channels/FileChannel')]
  JFileChannel = interface(JAbstractInterruptibleChannel)
    ['{DD170413-4811-4479-96FD-C32E336E8FA9}']
    procedure force(metaData: Boolean); cdecl;
    function lock(position: Int64; size: Int64; shared: Boolean): JFileLock; cdecl; overload;
    function lock: JFileLock; cdecl; overload;
    function map(mode: JFileChannel_MapMode; position: Int64; size: Int64): JMappedByteBuffer; cdecl;
    function position: Int64; cdecl; overload;
    function position(newPosition: Int64): JFileChannel; cdecl; overload;
    function read(dst: JByteBuffer): Integer; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
    function read(dst: JByteBuffer; position: Int64): Integer; cdecl; overload;
    function size: Int64; cdecl;
    function transferFrom(src: JReadableByteChannel; position: Int64; count: Int64): Int64; cdecl;
    function transferTo(position: Int64; count: Int64; target: JWritableByteChannel): Int64; cdecl;
    function truncate(size: Int64): JFileChannel; cdecl;
    function tryLock(position: Int64; size: Int64; shared: Boolean): JFileLock; cdecl; overload;
    function tryLock: JFileLock; cdecl; overload;
    function write(src: JByteBuffer): Integer; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
    function write(src: JByteBuffer; position: Int64): Integer; cdecl; overload;
  end;
  TJFileChannel = class(TJavaGenericImport<JFileChannelClass, JFileChannel>) end;

  JFileChannel_MapModeClass = interface(JObjectClass)
    ['{428D8B72-313B-49EE-AC4B-6DD16908BBA5}']
    {class} function _GetPRIVATE: JFileChannel_MapMode; cdecl;
    {class} function _GetREAD_ONLY: JFileChannel_MapMode; cdecl;
    {class} function _GetREAD_WRITE: JFileChannel_MapMode; cdecl;
    {class} property &PRIVATE: JFileChannel_MapMode read _GetPRIVATE;
    {class} property READ_ONLY: JFileChannel_MapMode read _GetREAD_ONLY;
    {class} property READ_WRITE: JFileChannel_MapMode read _GetREAD_WRITE;
  end;

  [JavaSignature('java/nio/channels/FileChannel$MapMode')]
  JFileChannel_MapMode = interface(JObject)
    ['{15CFAED9-B5FC-454D-9463-507D14032869}']
    function toString: JString; cdecl;
  end;
  TJFileChannel_MapMode = class(TJavaGenericImport<JFileChannel_MapModeClass, JFileChannel_MapMode>) end;

  JFileLockClass = interface(JObjectClass)
    ['{5E237114-5198-4D43-8490-313B47A05E81}']
  end;

  [JavaSignature('java/nio/channels/FileLock')]
  JFileLock = interface(JObject)
    ['{03C7F0F6-5A57-4A51-A083-43258AA01093}']
    function acquiredBy: JChannel; cdecl;
    function channel: JFileChannel; cdecl;
    procedure close; cdecl;
    function isShared: Boolean; cdecl;
    function isValid: Boolean; cdecl;
    function overlaps(position: Int64; size: Int64): Boolean; cdecl;
    function position: Int64; cdecl;
    procedure release; cdecl;
    function size: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJFileLock = class(TJavaGenericImport<JFileLockClass, JFileLock>) end;

  JPipeClass = interface(JObjectClass)
    ['{27E376BA-2D69-474C-AE28-C30BC063BEC0}']
    {class} function open: JPipe; cdecl;
  end;

  [JavaSignature('java/nio/channels/Pipe')]
  JPipe = interface(JObject)
    ['{E872278A-401B-414F-9AEF-3D9DC22CD9E9}']
    function sink: JPipe_SinkChannel; cdecl;
    function source: JPipe_SourceChannel; cdecl;
  end;
  TJPipe = class(TJavaGenericImport<JPipeClass, JPipe>) end;

  JPipe_SinkChannelClass = interface(JAbstractSelectableChannelClass)
    ['{F48BD363-BB19-4354-AFA3-45E78FE4C3FC}']
  end;

  [JavaSignature('java/nio/channels/Pipe$SinkChannel')]
  JPipe_SinkChannel = interface(JAbstractSelectableChannel)
    ['{53C39991-334C-48BF-85B4-7DDFD5859755}']
    function validOps: Integer; cdecl;
  end;
  TJPipe_SinkChannel = class(TJavaGenericImport<JPipe_SinkChannelClass, JPipe_SinkChannel>) end;

  JPipe_SourceChannelClass = interface(JAbstractSelectableChannelClass)
    ['{EFD0625C-C800-4F5A-9A61-9E30291FA04F}']
  end;

  [JavaSignature('java/nio/channels/Pipe$SourceChannel')]
  JPipe_SourceChannel = interface(JAbstractSelectableChannel)
    ['{256FD88E-5BBC-41E2-97DC-4546CF1220FD}']
    function validOps: Integer; cdecl;
  end;
  TJPipe_SourceChannel = class(TJavaGenericImport<JPipe_SourceChannelClass, JPipe_SourceChannel>) end;

  JSeekableByteChannelClass = interface(JByteChannelClass)
    ['{7609D629-7064-4919-85EA-9757D4EB8933}']
  end;

  [JavaSignature('java/nio/channels/SeekableByteChannel')]
  JSeekableByteChannel = interface(JByteChannel)
    ['{A0A27EA8-D623-409D-A9EE-AA4C3EEFBBB0}']
    function position: Int64; cdecl; overload;
    function position(newPosition: Int64): JSeekableByteChannel; cdecl; overload;
    function read(dst: JByteBuffer): Integer; cdecl;
    function size: Int64; cdecl;
    function truncate(size: Int64): JSeekableByteChannel; cdecl;
    function write(src: JByteBuffer): Integer; cdecl;
  end;
  TJSeekableByteChannel = class(TJavaGenericImport<JSeekableByteChannelClass, JSeekableByteChannel>) end;

  JSelectionKeyClass = interface(JObjectClass)
    ['{718617CF-8E56-41EF-982B-1DE5540C7639}']
    {class} function _GetOP_ACCEPT: Integer; cdecl;
    {class} function _GetOP_CONNECT: Integer; cdecl;
    {class} function _GetOP_READ: Integer; cdecl;
    {class} function _GetOP_WRITE: Integer; cdecl;
    {class} property OP_ACCEPT: Integer read _GetOP_ACCEPT;
    {class} property OP_CONNECT: Integer read _GetOP_CONNECT;
    {class} property OP_READ: Integer read _GetOP_READ;
    {class} property OP_WRITE: Integer read _GetOP_WRITE;
  end;

  [JavaSignature('java/nio/channels/SelectionKey')]
  JSelectionKey = interface(JObject)
    ['{22CE5584-F7C1-41E4-BA87-008827EFEEAA}']
    function attach(ob: JObject): JObject; cdecl;
    function attachment: JObject; cdecl;
    procedure cancel; cdecl;
    function channel: JSelectableChannel; cdecl;
    function interestOps: Integer; cdecl; overload;
    function interestOps(ops: Integer): JSelectionKey; cdecl; overload;
    function isAcceptable: Boolean; cdecl;
    function isConnectable: Boolean; cdecl;
    function isReadable: Boolean; cdecl;
    function isValid: Boolean; cdecl;
    function isWritable: Boolean; cdecl;
    function readyOps: Integer; cdecl;
    function selector: JSelector; cdecl;
  end;
  TJSelectionKey = class(TJavaGenericImport<JSelectionKeyClass, JSelectionKey>) end;

  JSelectorClass = interface(JObjectClass)
    ['{E1CC5599-DD36-4998-A426-92BE0A6B5DC9}']
    {class} function open: JSelector; cdecl;
  end;

  [JavaSignature('java/nio/channels/Selector')]
  JSelector = interface(JObject)
    ['{0E8BCD73-DAF7-420A-8891-835ED1EC82BF}']
    procedure close; cdecl;
    function isOpen: Boolean; cdecl;
    function keys: JSet; cdecl;
    function provider: JSelectorProvider; cdecl;
    function select(timeout: Int64): Integer; cdecl; overload;
    function select: Integer; cdecl; overload;
    function selectNow: Integer; cdecl;
    function selectedKeys: JSet; cdecl;
    function wakeup: JSelector; cdecl;
  end;
  TJSelector = class(TJavaGenericImport<JSelectorClass, JSelector>) end;

  JServerSocketChannelClass = interface(JAbstractSelectableChannelClass)
    ['{D5B3AB40-C62C-4B8B-A579-A8B73DFCA5F8}']
    {class} function open: JServerSocketChannel; cdecl;
  end;

  [JavaSignature('java/nio/channels/ServerSocketChannel')]
  JServerSocketChannel = interface(JAbstractSelectableChannel)
    ['{5485D000-B8EE-4DCE-9DBE-8A094441F255}']
    function accept: JSocketChannel; cdecl;
    //function bind(local: JSocketAddress): JServerSocketChannel; cdecl; overload;
    //function bind(local: JSocketAddress; backlog: Integer): JServerSocketChannel; cdecl; overload;
    //function getLocalAddress: JSocketAddress; cdecl;
    //function setOption(name: JSocketOption; value: JObject): JServerSocketChannel; cdecl;
    //function socket: JServerSocket; cdecl;
    function validOps: Integer; cdecl;
  end;
  TJServerSocketChannel = class(TJavaGenericImport<JServerSocketChannelClass, JServerSocketChannel>) end;

  JSocketChannelClass = interface(JAbstractSelectableChannelClass)
    ['{AC06A3C8-B76A-45CD-9CAA-C03E931A3828}']
    {class} function open: JSocketChannel; cdecl; overload;
    {class} //function open(remote: JSocketAddress): JSocketChannel; cdecl; overload;
  end;

  [JavaSignature('java/nio/channels/SocketChannel')]
  JSocketChannel = interface(JAbstractSelectableChannel)
    ['{04388B66-A713-4476-98A7-A20D99310947}']
    //function bind(local: JSocketAddress): JSocketChannel; cdecl;
    //function connect(remote: JSocketAddress): Boolean; cdecl;
    function finishConnect: Boolean; cdecl;
    //function getLocalAddress: JSocketAddress; cdecl;
    //function getRemoteAddress: JSocketAddress; cdecl;
    function isConnected: Boolean; cdecl;
    function isConnectionPending: Boolean; cdecl;
    function read(dst: JByteBuffer): Integer; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function read(dsts: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
    //function setOption(name: JSocketOption; value: JObject): JSocketChannel; cdecl;
    function shutdownInput: JSocketChannel; cdecl;
    function shutdownOutput: JSocketChannel; cdecl;
    //function socket: JSocket; cdecl;
    function validOps: Integer; cdecl;
    function write(src: JByteBuffer): Integer; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>; offset: Integer; length: Integer): Int64; cdecl; overload;
    function write(srcs: TJavaObjectArray<JByteBuffer>): Int64; cdecl; overload;
  end;
  TJSocketChannel = class(TJavaGenericImport<JSocketChannelClass, JSocketChannel>) end;

  JWritableByteChannelClass = interface(JChannelClass)
    ['{C4B313F1-68CA-4254-A782-3473DAD7E786}']
  end;

  [JavaSignature('java/nio/channels/WritableByteChannel')]
  JWritableByteChannel = interface(JChannel)
    ['{58ABD8D1-20A0-4022-8CDE-C68B6A032191}']
    function write(src: JByteBuffer): Integer; cdecl;
  end;
  TJWritableByteChannel = class(TJavaGenericImport<JWritableByteChannelClass, JWritableByteChannel>) end;

  JAbstractSelectorClass = interface(JSelectorClass)
    ['{EF1FBF60-D39E-48AF-9326-CD3B500AFA56}']
  end;

  [JavaSignature('java/nio/channels/spi/AbstractSelector')]
  JAbstractSelector = interface(JSelector)
    ['{1583A67A-8E15-44A0-8943-EE898E4216F9}']
    procedure close; cdecl;
    function isOpen: Boolean; cdecl;
    function provider: JSelectorProvider; cdecl;
  end;
  TJAbstractSelector = class(TJavaGenericImport<JAbstractSelectorClass, JAbstractSelector>) end;

  JSelectorProviderClass = interface(JObjectClass)
    ['{52BA6B52-FF27-4051-B86B-4465C88E8830}']
    {class} function provider: JSelectorProvider; cdecl;
  end;

  [JavaSignature('java/nio/channels/spi/SelectorProvider')]
  JSelectorProvider = interface(JObject)
    ['{2217E1DD-E7B2-44E1-B932-E01CAAFF013A}']
    function inheritedChannel: JChannel; cdecl;
    function openDatagramChannel: JDatagramChannel; cdecl; overload;
    //function openDatagramChannel(family: JProtocolFamily): JDatagramChannel; cdecl; overload;
    function openPipe: JPipe; cdecl;
    function openSelector: JAbstractSelector; cdecl;
    function openServerSocketChannel: JServerSocketChannel; cdecl;
    function openSocketChannel: JSocketChannel; cdecl;
  end;
  TJSelectorProvider = class(TJavaGenericImport<JSelectorProviderClass, JSelectorProvider>) end;

  JCharsetClass = interface(JObjectClass)
    ['{8BBFEE2C-642D-4F32-8839-0C459948A70A}']
    {class} function availableCharsets: JSortedMap; cdecl;
    {class} function defaultCharset: JCharset; cdecl;
    {class} function forName(charsetName: JString): JCharset; cdecl;
    {class} function isSupported(charsetName: JString): Boolean; cdecl;
  end;

  [JavaSignature('java/nio/charset/Charset')]
  JCharset = interface(JObject)
    ['{0B41CD4C-80D6-45E5-997E-B83EF313AB67}']
    function aliases: JSet; cdecl;
    function canEncode: Boolean; cdecl;
    function compareTo(that: JCharset): Integer; cdecl;
    function &contains(cs: JCharset): Boolean; cdecl;
    function decode(bb: JByteBuffer): JCharBuffer; cdecl;
    function displayName: JString; cdecl; overload;
    function displayName(locale: JLocale): JString; cdecl; overload;
    function encode(cb: JCharBuffer): JByteBuffer; cdecl; overload;
    function encode(str: JString): JByteBuffer; cdecl; overload;
    function equals(ob: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isRegistered: Boolean; cdecl;
    function name: JString; cdecl;
    function newDecoder: JCharsetDecoder; cdecl;
    function newEncoder: JCharsetEncoder; cdecl;
    function toString: JString; cdecl;
  end;
  TJCharset = class(TJavaGenericImport<JCharsetClass, JCharset>) end;

  JCharsetDecoderClass = interface(JObjectClass)
    ['{2F0FAD80-3FFC-419C-AD52-28071482CCA1}']
  end;

  [JavaSignature('java/nio/charset/CharsetDecoder')]
  JCharsetDecoder = interface(JObject)
    ['{F7AFF095-6D34-470F-B2C6-B68F75C40D26}']
    function averageCharsPerByte: Single; cdecl;
    function charset: JCharset; cdecl;
    function decode(in_: JByteBuffer; out_: JCharBuffer; endOfInput: Boolean): JCoderResult; cdecl; overload;
    function decode(in_: JByteBuffer): JCharBuffer; cdecl; overload;
    function detectedCharset: JCharset; cdecl;
    function flush(out_: JCharBuffer): JCoderResult; cdecl;
    function isAutoDetecting: Boolean; cdecl;
    function isCharsetDetected: Boolean; cdecl;
    function malformedInputAction: JCodingErrorAction; cdecl;
    function maxCharsPerByte: Single; cdecl;
    function onMalformedInput(newAction: JCodingErrorAction): JCharsetDecoder; cdecl;
    function onUnmappableCharacter(newAction: JCodingErrorAction): JCharsetDecoder; cdecl;
    function replaceWith(newReplacement: JString): JCharsetDecoder; cdecl;
    function replacement: JString; cdecl;
    function reset: JCharsetDecoder; cdecl;
    function unmappableCharacterAction: JCodingErrorAction; cdecl;
  end;
  TJCharsetDecoder = class(TJavaGenericImport<JCharsetDecoderClass, JCharsetDecoder>) end;

  JCharsetEncoderClass = interface(JObjectClass)
    ['{F107BD1C-B97C-4163-BFAC-1F620CC30D02}']
  end;

  [JavaSignature('java/nio/charset/CharsetEncoder')]
  JCharsetEncoder = interface(JObject)
    ['{6126DFBE-1E4C-4F67-8F42-A2B312E6CE96}']
    function averageBytesPerChar: Single; cdecl;
    function canEncode(c: Char): Boolean; cdecl; overload;
    function canEncode(cs: JCharSequence): Boolean; cdecl; overload;
    function charset: JCharset; cdecl;
    function encode(in_: JCharBuffer; out_: JByteBuffer; endOfInput: Boolean): JCoderResult; cdecl; overload;
    function encode(in_: JCharBuffer): JByteBuffer; cdecl; overload;
    function flush(out_: JByteBuffer): JCoderResult; cdecl;
    function isLegalReplacement(repl: TJavaArray<Byte>): Boolean; cdecl;
    function malformedInputAction: JCodingErrorAction; cdecl;
    function maxBytesPerChar: Single; cdecl;
    function onMalformedInput(newAction: JCodingErrorAction): JCharsetEncoder; cdecl;
    function onUnmappableCharacter(newAction: JCodingErrorAction): JCharsetEncoder; cdecl;
    function replaceWith(newReplacement: TJavaArray<Byte>): JCharsetEncoder; cdecl;
    function replacement: TJavaArray<Byte>; cdecl;
    function reset: JCharsetEncoder; cdecl;
    function unmappableCharacterAction: JCodingErrorAction; cdecl;
  end;
  TJCharsetEncoder = class(TJavaGenericImport<JCharsetEncoderClass, JCharsetEncoder>) end;

  JCoderResultClass = interface(JObjectClass)
    ['{FDEBE443-A1F2-4DCF-9AA7-5D674CE88E70}']
    {class} function _GetOVERFLOW: JCoderResult; cdecl;
    {class} function _GetUNDERFLOW: JCoderResult; cdecl;
    {class} function malformedForLength(length: Integer): JCoderResult; cdecl;
    {class} function unmappableForLength(length: Integer): JCoderResult; cdecl;
    {class} property OVERFLOW: JCoderResult read _GetOVERFLOW;
    {class} property UNDERFLOW: JCoderResult read _GetUNDERFLOW;
  end;

  [JavaSignature('java/nio/charset/CoderResult')]
  JCoderResult = interface(JObject)
    ['{2107C07D-63CF-408D-AAA0-8E36DDD4484C}']
    function isError: Boolean; cdecl;
    function isMalformed: Boolean; cdecl;
    function isOverflow: Boolean; cdecl;
    function isUnderflow: Boolean; cdecl;
    function isUnmappable: Boolean; cdecl;
    function length: Integer; cdecl;
    procedure throwException; cdecl;
    function toString: JString; cdecl;
  end;
  TJCoderResult = class(TJavaGenericImport<JCoderResultClass, JCoderResult>) end;

  JCodingErrorActionClass = interface(JObjectClass)
    ['{8E806C03-E513-41D4-AA2E-8E0A38670EF9}']
    {class} function _GetIGNORE: JCodingErrorAction; cdecl;
    {class} function _GetREPLACE: JCodingErrorAction; cdecl;
    {class} function _GetREPORT: JCodingErrorAction; cdecl;
    {class} property IGNORE: JCodingErrorAction read _GetIGNORE;
    {class} property REPLACE: JCodingErrorAction read _GetREPLACE;
    {class} property REPORT: JCodingErrorAction read _GetREPORT;
  end;

  [JavaSignature('java/nio/charset/CodingErrorAction')]
  JCodingErrorAction = interface(JObject)
    ['{46131CDD-61F4-4F10-8DC3-449D297DF12E}']
    function toString: JString; cdecl;
  end;
  TJCodingErrorAction = class(TJavaGenericImport<JCodingErrorActionClass, JCodingErrorAction>) end;

  JAccessModeClass = interface(JEnumClass)
    ['{359AA90C-FFE5-4D77-BD13-A579C5F98F98}']
    {class} function _GetEXECUTE: JAccessMode; cdecl;
    {class} function _GetREAD: JAccessMode; cdecl;
    {class} function _GetWRITE: JAccessMode; cdecl;
    {class} function valueOf(name: JString): JAccessMode; cdecl;
    {class} function values: TJavaObjectArray<JAccessMode>; cdecl;
    {class} property EXECUTE: JAccessMode read _GetEXECUTE;
    {class} property READ: JAccessMode read _GetREAD;
    {class} property WRITE: JAccessMode read _GetWRITE;
  end;

  [JavaSignature('java/nio/file/AccessMode')]
  JAccessMode = interface(JEnum)
    ['{06F1012F-147D-4D87-B04F-745978902672}']
  end;
  TJAccessMode = class(TJavaGenericImport<JAccessModeClass, JAccessMode>) end;

  JCopyOptionClass = interface(IJavaClass)
    ['{3C30C593-9D1E-4963-AEEA-F3F500507850}']
  end;

  [JavaSignature('java/nio/file/CopyOption')]
  JCopyOption = interface(IJavaInstance)
    ['{38C62D62-5CF9-4AA0-93A4-703E5E9AD61F}']
  end;
  TJCopyOption = class(TJavaGenericImport<JCopyOptionClass, JCopyOption>) end;

  JDirectoryStreamClass = interface(JCloseableClass)
    ['{FAA128E2-295A-47DD-85B8-B0719825E5D4}']
  end;

  [JavaSignature('java/nio/file/DirectoryStream')]
  JDirectoryStream = interface(JCloseable)
    ['{B67FFFED-1A33-4809-A711-ABE5A8CC9CB8}']
    function iterator: JIterator; cdecl;
  end;
  TJDirectoryStream = class(TJavaGenericImport<JDirectoryStreamClass, JDirectoryStream>) end;

  JDirectoryStream_FilterClass = interface(IJavaClass)
    ['{4A6453E2-ADA7-45D7-8D59-7D1E75051901}']
  end;

  [JavaSignature('java/nio/file/DirectoryStream$Filter')]
  JDirectoryStream_Filter = interface(IJavaInstance)
    ['{13307FEB-7B35-447D-9820-25DD120F66C5}']
    function accept(entry: JObject): Boolean; cdecl;
  end;
  TJDirectoryStream_Filter = class(TJavaGenericImport<JDirectoryStream_FilterClass, JDirectoryStream_Filter>) end;

  JFileStoreClass = interface(JObjectClass)
    ['{257755A9-B23C-4F74-ADCB-BCC9F7B903B5}']
  end;

  [JavaSignature('java/nio/file/FileStore')]
  JFileStore = interface(JObject)
    ['{828937A9-B1C9-4C6B-8007-40E6DEA8474C}']
    function getAttribute(attribute: JString): JObject; cdecl;
    function getFileStoreAttributeView(type_: Jlang_Class): JFileStoreAttributeView; cdecl;
    function getTotalSpace: Int64; cdecl;
    function getUnallocatedSpace: Int64; cdecl;
    function getUsableSpace: Int64; cdecl;
    function isReadOnly: Boolean; cdecl;
    function name: JString; cdecl;
    function supportsFileAttributeView(type_: Jlang_Class): Boolean; cdecl; overload;
    function supportsFileAttributeView(name: JString): Boolean; cdecl; overload;
    function &type: JString; cdecl;
  end;
  TJFileStore = class(TJavaGenericImport<JFileStoreClass, JFileStore>) end;

  JFileSystemClass = interface(JObjectClass)
    ['{368BB60D-66F2-4C9F-805E-5754CD6B2417}']
  end;

  [JavaSignature('java/nio/file/FileSystem')]
  JFileSystem = interface(JObject)
    ['{5B239AC2-540A-4290-B23C-86E1EDB7BCC6}']
    procedure close; cdecl;
    function getFileStores: JIterable; cdecl;
    function getPathMatcher(syntaxAndPattern: JString): JPathMatcher; cdecl;
    function getRootDirectories: JIterable; cdecl;
    function getSeparator: JString; cdecl;
    function getUserPrincipalLookupService: JUserPrincipalLookupService; cdecl;
    function isOpen: Boolean; cdecl;
    function isReadOnly: Boolean; cdecl;
    function newWatchService: JWatchService; cdecl;
    function provider: JFileSystemProvider; cdecl;
    function supportedFileAttributeViews: JSet; cdecl;
  end;
  TJFileSystem = class(TJavaGenericImport<JFileSystemClass, JFileSystem>) end;

  JLinkOptionClass = interface(JEnumClass)
    ['{A2300811-0A02-4512-98DB-35E023A89464}']
    {class} function _GetNOFOLLOW_LINKS: JLinkOption; cdecl;
    {class} function valueOf(name: JString): JLinkOption; cdecl;
    {class} function values: TJavaObjectArray<JLinkOption>; cdecl;
    {class} property NOFOLLOW_LINKS: JLinkOption read _GetNOFOLLOW_LINKS;
  end;

  [JavaSignature('java/nio/file/LinkOption')]
  JLinkOption = interface(JEnum)
    ['{8515A9DE-C8C2-4B0D-873A-899A239D7FA1}']
  end;
  TJLinkOption = class(TJavaGenericImport<JLinkOptionClass, JLinkOption>) end;

  JOpenOptionClass = interface(IJavaClass)
    ['{C69FF94F-9424-409C-8002-5FD88B7C1E80}']
  end;

  [JavaSignature('java/nio/file/OpenOption')]
  JOpenOption = interface(IJavaInstance)
    ['{7FAD82D2-3D60-4AFF-8A36-FFCBD5692A6F}']
  end;
  TJOpenOption = class(TJavaGenericImport<JOpenOptionClass, JOpenOption>) end;

  Jfile_PathClass = interface(JComparableClass)
    ['{C7F07FCD-7195-455B-A38B-FC3DDB7C7CEB}']
  end;

  [JavaSignature('java/nio/file/Path')]
  Jfile_Path = interface(JComparable)
    ['{0AD66A9F-A263-42BD-B098-028D385F79B8}']
    function compareTo(other: Jfile_Path): Integer; cdecl;
    function endsWith(other: Jfile_Path): Boolean; cdecl; overload;
    function endsWith(other: JString): Boolean; cdecl; overload;
    function equals(other: JObject): Boolean; cdecl;
    function getFileName: Jfile_Path; cdecl;
    function getFileSystem: JFileSystem; cdecl;
    function getName(index: Integer): Jfile_Path; cdecl;
    function getNameCount: Integer; cdecl;
    function getParent: Jfile_Path; cdecl;
    function getRoot: Jfile_Path; cdecl;
    function hashCode: Integer; cdecl;
    function isAbsolute: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function normalize: Jfile_Path; cdecl;
    function relativize(other: Jfile_Path): Jfile_Path; cdecl;
    function resolve(other: Jfile_Path): Jfile_Path; cdecl; overload;
    function resolve(other: JString): Jfile_Path; cdecl; overload;
    function resolveSibling(other: Jfile_Path): Jfile_Path; cdecl; overload;
    function resolveSibling(other: JString): Jfile_Path; cdecl; overload;
    function startsWith(other: Jfile_Path): Boolean; cdecl; overload;
    function startsWith(other: JString): Boolean; cdecl; overload;
    function subpath(beginIndex: Integer; endIndex: Integer): Jfile_Path; cdecl;
    function toAbsolutePath: Jfile_Path; cdecl;
    function toFile: JFile; cdecl;
    function toString: JString; cdecl;
    //function toUri: JURI; cdecl;
  end;
  TJfile_Path = class(TJavaGenericImport<Jfile_PathClass, Jfile_Path>) end;

  JPathMatcherClass = interface(IJavaClass)
    ['{940B0CAD-33F9-4C87-868E-6D4BF2EB1C3B}']
  end;

  [JavaSignature('java/nio/file/PathMatcher')]
  JPathMatcher = interface(IJavaInstance)
    ['{0B8D485E-168A-4CAE-92CA-7DD9C770ED5D}']
    function matches(path: Jfile_Path): Boolean; cdecl;
  end;
  TJPathMatcher = class(TJavaGenericImport<JPathMatcherClass, JPathMatcher>) end;

  JWatchEvent_KindClass = interface(IJavaClass)
    ['{D57483F4-42A0-4F4F-8394-ACDC1A156748}']
  end;

  [JavaSignature('java/nio/file/WatchEvent$Kind')]
  JWatchEvent_Kind = interface(IJavaInstance)
    ['{B7E6034C-BFE8-414A-997E-BE8F5430473F}']
    function name: JString; cdecl;
    function &type: Jlang_Class; cdecl;
  end;
  TJWatchEvent_Kind = class(TJavaGenericImport<JWatchEvent_KindClass, JWatchEvent_Kind>) end;

  JWatchEvent_ModifierClass = interface(IJavaClass)
    ['{009D6EFF-C4B5-4616-BB7B-A502998590DB}']
  end;

  [JavaSignature('java/nio/file/WatchEvent$Modifier')]
  JWatchEvent_Modifier = interface(IJavaInstance)
    ['{457EE6CB-758D-4659-880C-BD5689021CE5}']
    function name: JString; cdecl;
  end;
  TJWatchEvent_Modifier = class(TJavaGenericImport<JWatchEvent_ModifierClass, JWatchEvent_Modifier>) end;

  JWatchKeyClass = interface(IJavaClass)
    ['{746EBF40-933E-420F-98D1-C82BE8319A77}']
  end;

  [JavaSignature('java/nio/file/WatchKey')]
  JWatchKey = interface(IJavaInstance)
    ['{E87F3CDF-A34A-4DD6-9338-B42D87A3F810}']
    procedure cancel; cdecl;
    function isValid: Boolean; cdecl;
    function pollEvents: JList; cdecl;
    function reset: Boolean; cdecl;
    function watchable: JWatchable; cdecl;
  end;
  TJWatchKey = class(TJavaGenericImport<JWatchKeyClass, JWatchKey>) end;

  JWatchServiceClass = interface(JCloseableClass)
    ['{865CBFEE-ED2E-4F04-A1DC-ECD854337C97}']
  end;

  [JavaSignature('java/nio/file/WatchService')]
  JWatchService = interface(JCloseable)
    ['{CD96788C-4D94-499F-893D-569F418AD0AD}']
    procedure close; cdecl;
    function poll: JWatchKey; cdecl; overload;
    function poll(timeout: Int64; unit_: JTimeUnit): JWatchKey; cdecl; overload;
    function take: JWatchKey; cdecl;
  end;
  TJWatchService = class(TJavaGenericImport<JWatchServiceClass, JWatchService>) end;

  JWatchableClass = interface(IJavaClass)
    ['{A8223BCE-0FF0-479A-B91D-9197692347A1}']
  end;

  [JavaSignature('java/nio/file/Watchable')]
  JWatchable = interface(IJavaInstance)
    ['{DCBB9154-B301-4BF2-A63D-3BB93A5D2048}']
  end;
  TJWatchable = class(TJavaGenericImport<JWatchableClass, JWatchable>) end;

  JAttributeViewClass = interface(IJavaClass)
    ['{AD295236-5FC4-43EE-96E8-252F9A78E53E}']
  end;

  [JavaSignature('java/nio/file/attribute/AttributeView')]
  JAttributeView = interface(IJavaInstance)
    ['{B5173328-7EC7-440A-82CC-B28BA1F3DE0F}']
    function name: JString; cdecl;
  end;
  TJAttributeView = class(TJavaGenericImport<JAttributeViewClass, JAttributeView>) end;

  JBasicFileAttributesClass = interface(IJavaClass)
    ['{0CF0EB31-0130-4BAB-BF10-4244D9AE93AD}']
  end;

  [JavaSignature('java/nio/file/attribute/BasicFileAttributes')]
  JBasicFileAttributes = interface(IJavaInstance)
    ['{ACE5A4C6-30F2-4668-888E-34A8482BFDBB}']
    function creationTime: JFileTime; cdecl;
    function fileKey: JObject; cdecl;
    function isDirectory: Boolean; cdecl;
    function isOther: Boolean; cdecl;
    function isRegularFile: Boolean; cdecl;
    function isSymbolicLink: Boolean; cdecl;
    function lastAccessTime: JFileTime; cdecl;
    function lastModifiedTime: JFileTime; cdecl;
    function size: Int64; cdecl;
  end;
  TJBasicFileAttributes = class(TJavaGenericImport<JBasicFileAttributesClass, JBasicFileAttributes>) end;

  JFileAttributeClass = interface(IJavaClass)
    ['{F377FE80-B20C-4D49-90C9-591D75814EAE}']
  end;

  [JavaSignature('java/nio/file/attribute/FileAttribute')]
  JFileAttribute = interface(IJavaInstance)
    ['{4E01F49B-ACE2-4322-B250-0826C7713C71}']
    function name: JString; cdecl;
    function value: JObject; cdecl;
  end;
  TJFileAttribute = class(TJavaGenericImport<JFileAttributeClass, JFileAttribute>) end;

  JFileAttributeViewClass = interface(JAttributeViewClass)
    ['{DAEE7CE5-149E-4557-A3EE-FFE24DC29521}']
  end;

  [JavaSignature('java/nio/file/attribute/FileAttributeView')]
  JFileAttributeView = interface(JAttributeView)
    ['{4F594D60-4B12-44A1-843E-0A14F301D823}']
  end;
  TJFileAttributeView = class(TJavaGenericImport<JFileAttributeViewClass, JFileAttributeView>) end;

  JFileStoreAttributeViewClass = interface(JAttributeViewClass)
    ['{C015741A-8EFB-4CF9-A3B8-3998722E1CF8}']
  end;

  [JavaSignature('java/nio/file/attribute/FileStoreAttributeView')]
  JFileStoreAttributeView = interface(JAttributeView)
    ['{0F03442B-3203-4685-B196-5E3EB36A9039}']
  end;
  TJFileStoreAttributeView = class(TJavaGenericImport<JFileStoreAttributeViewClass, JFileStoreAttributeView>) end;

  JFileTimeClass = interface(JObjectClass)
    ['{F53DC135-D2F3-4DC1-A52E-CA0335E1EB5E}']
    {class} function from(value: Int64; unit_: JTimeUnit): JFileTime; cdecl; overload;
    {class} function from(instant: JInstant): JFileTime; cdecl; overload;
    {class} function fromMillis(value: Int64): JFileTime; cdecl;
  end;

  [JavaSignature('java/nio/file/attribute/FileTime')]
  JFileTime = interface(JObject)
    ['{B8DDA58E-F438-4032-AC74-0CE24FEB5425}']
    function compareTo(other: JFileTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function &to(unit_: JTimeUnit): Int64; cdecl;
    function toInstant: JInstant; cdecl;
    function toMillis: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJFileTime = class(TJavaGenericImport<JFileTimeClass, JFileTime>) end;

  // java.nio.file.attribute.UserPrincipal
  // java.nio.file.attribute.GroupPrincipal
  JUserPrincipalLookupServiceClass = interface(JObjectClass)
    ['{04C1CEF3-0DF3-4A57-943C-B697AA9DB7FC}']
  end;

  [JavaSignature('java/nio/file/attribute/UserPrincipalLookupService')]
  JUserPrincipalLookupService = interface(JObject)
    ['{B0360D15-070D-44D5-89C3-73CC53B215A0}']
    //function lookupPrincipalByGroupName(group: JString): JGroupPrincipal; cdecl;
    //function lookupPrincipalByName(name: JString): JUserPrincipal; cdecl;
  end;
  TJUserPrincipalLookupService = class(TJavaGenericImport<JUserPrincipalLookupServiceClass, JUserPrincipalLookupService>) end;

  JFileSystemProviderClass = interface(JObjectClass)
    ['{FA011CCC-4B9B-4622-BE07-7E0E3C5B0FF2}']
    {class} function installedProviders: JList; cdecl;
  end;

  [JavaSignature('java/nio/file/spi/FileSystemProvider')]
  JFileSystemProvider = interface(JObject)
    ['{188F7D06-9FF8-4AF5-92F7-AF4A3168F7FE}']
    procedure createLink(link: Jfile_Path; existing: Jfile_Path); cdecl;
    procedure delete(path: Jfile_Path); cdecl;
    function deleteIfExists(path: Jfile_Path): Boolean; cdecl;
    function getFileStore(path: Jfile_Path): JFileStore; cdecl;
    //function getFileSystem(uri: JURI): JFileSystem; cdecl;
    //function getPath(uri: JURI): Jfile_Path; cdecl;
    function getScheme: JString; cdecl;
    function isHidden(path: Jfile_Path): Boolean; cdecl;
    function isSameFile(path: Jfile_Path; path2: Jfile_Path): Boolean; cdecl;
    function newDirectoryStream(dir: Jfile_Path; filter: JDirectoryStream_Filter): JDirectoryStream; cdecl;
    //function newFileSystem(uri: JURI; env: JMap): JFileSystem; cdecl; overload;
    function newFileSystem(path: Jfile_Path; env: JMap): JFileSystem; cdecl; overload;
    function readSymbolicLink(link: Jfile_Path): Jfile_Path; cdecl;
  end;
  TJFileSystemProvider = class(TJavaGenericImport<JFileSystemProviderClass, JFileSystemProvider>) end;

  JCharacterIteratorClass = interface(JCloneableClass)
    ['{1E5C976F-2309-499B-8A65-FEC351115AEE}']
    {class} function _GetDONE: Char; cdecl;
    {class} property DONE: Char read _GetDONE;
  end;

  [JavaSignature('java/text/CharacterIterator')]
  JCharacterIterator = interface(JCloneable)
    ['{E5B9E473-76E7-4041-97A5-A1642D9010AF}']
    function clone: JObject; cdecl;
    function current: Char; cdecl;
    function first: Char; cdecl;
    function getBeginIndex: Integer; cdecl;
    function getEndIndex: Integer; cdecl;
    function getIndex: Integer; cdecl;
    function last: Char; cdecl;
    function next: Char; cdecl;
    function previous: Char; cdecl;
    function setIndex(position: Integer): Char; cdecl;
  end;
  TJCharacterIterator = class(TJavaGenericImport<JCharacterIteratorClass, JCharacterIterator>) end;

  JAttributedCharacterIteratorClass = interface(JCharacterIteratorClass)
    ['{6594E2E5-2893-4511-92FE-65045681414C}']
  end;

  [JavaSignature('java/text/AttributedCharacterIterator')]
  JAttributedCharacterIterator = interface(JCharacterIterator)
    ['{CAC4C1F7-69A7-4AF1-85CF-28B7AC6C174E}']
    function getAllAttributeKeys: JSet; cdecl;
    function getAttribute(attribute: JAttributedCharacterIterator_Attribute): JObject; cdecl;
    function getAttributes: JMap; cdecl;
    function getRunLimit: Integer; cdecl; overload;
    function getRunLimit(attribute: JAttributedCharacterIterator_Attribute): Integer; cdecl; overload;
    function getRunLimit(attributes: JSet): Integer; cdecl; overload;
    function getRunStart: Integer; cdecl; overload;
    function getRunStart(attribute: JAttributedCharacterIterator_Attribute): Integer; cdecl; overload;
    function getRunStart(attributes: JSet): Integer; cdecl; overload;
  end;
  TJAttributedCharacterIterator = class(TJavaGenericImport<JAttributedCharacterIteratorClass, JAttributedCharacterIterator>) end;

  JAttributedCharacterIterator_AttributeClass = interface(JObjectClass)
    ['{2A4E44E3-1055-47D3-9D7C-306D8FC1B7B5}']
    {class} function _GetINPUT_METHOD_SEGMENT: JAttributedCharacterIterator_Attribute; cdecl;
    {class} function _GetLANGUAGE: JAttributedCharacterIterator_Attribute; cdecl;
    {class} function _GetREADING: JAttributedCharacterIterator_Attribute; cdecl;
    {class} property INPUT_METHOD_SEGMENT: JAttributedCharacterIterator_Attribute read _GetINPUT_METHOD_SEGMENT;
    {class} property LANGUAGE: JAttributedCharacterIterator_Attribute read _GetLANGUAGE;
    {class} property READING: JAttributedCharacterIterator_Attribute read _GetREADING;
  end;

  [JavaSignature('java/text/AttributedCharacterIterator$Attribute')]
  JAttributedCharacterIterator_Attribute = interface(JObject)
    ['{18526153-8CA3-4BDA-AC30-F568F5361582}']
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAttributedCharacterIterator_Attribute = class(TJavaGenericImport<JAttributedCharacterIterator_AttributeClass, JAttributedCharacterIterator_Attribute>) end;

  JFieldPositionClass = interface(JObjectClass)
    ['{F58B6EC9-95AC-427C-9E49-18A65DCC6A3D}']
    {class} function init(field: Integer): JFieldPosition; cdecl; overload;
    {class} function init(attribute: JFormat_Field): JFieldPosition; cdecl; overload;
    {class} function init(attribute: JFormat_Field; fieldID: Integer): JFieldPosition; cdecl; overload;
  end;

  [JavaSignature('java/text/FieldPosition')]
  JFieldPosition = interface(JObject)
    ['{10819166-C974-4752-BD60-DC299ECF476E}']
    function equals(obj: JObject): Boolean; cdecl;
    function getBeginIndex: Integer; cdecl;
    function getEndIndex: Integer; cdecl;
    function getField: Integer; cdecl;
    function getFieldAttribute: JFormat_Field; cdecl;
    function hashCode: Integer; cdecl;
    procedure setBeginIndex(bi: Integer); cdecl;
    procedure setEndIndex(ei: Integer); cdecl;
    function toString: JString; cdecl;
  end;
  TJFieldPosition = class(TJavaGenericImport<JFieldPositionClass, JFieldPosition>) end;

  JFormatClass = interface(JObjectClass)
    ['{B3360D82-FFC6-472C-B0C7-DA4B605FA6C7}']
  end;

  [JavaSignature('java/text/Format')]
  JFormat = interface(JObject)
    ['{621A5512-28D0-465D-A17C-D91BA62AC2BC}']
    function clone: JObject; cdecl;
    function format(obj: JObject): JString; cdecl; overload;
    function format(obj: JObject; toAppendTo: JStringBuffer; pos: JFieldPosition): JStringBuffer; cdecl; overload;
    function formatToCharacterIterator(obj: JObject): JAttributedCharacterIterator; cdecl;
    function parseObject(source: JString; pos: JParsePosition): JObject; cdecl; overload;
    function parseObject(source: JString): JObject; cdecl; overload;
  end;
  TJFormat = class(TJavaGenericImport<JFormatClass, JFormat>) end;

  JFormat_FieldClass = interface(JAttributedCharacterIterator_AttributeClass)
    ['{5A479036-DED0-43F9-9F53-BFBA7EB3D38E}']
  end;

  [JavaSignature('java/text/Format$Field')]
  JFormat_Field = interface(JAttributedCharacterIterator_Attribute)
    ['{B776B5A5-CA40-43FB-8222-CFBF9C422DF9}']
  end;
  TJFormat_Field = class(TJavaGenericImport<JFormat_FieldClass, JFormat_Field>) end;

  JParsePositionClass = interface(JObjectClass)
    ['{0724101A-25F5-4AC4-BD4D-261CAD09EEB7}']
    {class} function init(index: Integer): JParsePosition; cdecl;
  end;

  [JavaSignature('java/text/ParsePosition')]
  JParsePosition = interface(JObject)
    ['{A9807DE3-9CD3-4E13-8AAC-C04A36AD7FBD}']
    function equals(obj: JObject): Boolean; cdecl;
    function getErrorIndex: Integer; cdecl;
    function getIndex: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure setErrorIndex(ei: Integer); cdecl;
    procedure setIndex(index: Integer); cdecl;
    function toString: JString; cdecl;
  end;
  TJParsePosition = class(TJavaGenericImport<JParsePositionClass, JParsePosition>) end;

  JClockClass = interface(JObjectClass)
    ['{BE2ADFA2-61A1-43E7-B76E-1E4B70683C21}']
    {class} function fixed(fixedInstant: JInstant; zone: JZoneId): JClock; cdecl;
    {class} function offset(baseClock: JClock; offsetDuration: Jtime_Duration): JClock; cdecl;
    {class} function system(zone: JZoneId): JClock; cdecl;
    {class} function systemDefaultZone: JClock; cdecl;
    {class} function systemUTC: JClock; cdecl;
    {class} function tick(baseClock: JClock; tickDuration: Jtime_Duration): JClock; cdecl;
    {class} function tickMinutes(zone: JZoneId): JClock; cdecl;
    {class} function tickSeconds(zone: JZoneId): JClock; cdecl;
  end;

  [JavaSignature('java/time/Clock')]
  JClock = interface(JObject)
    ['{5098054D-7C8E-4EAD-A5A9-EFBD0F010B04}']
    function equals(obj: JObject): Boolean; cdecl;
    function getZone: JZoneId; cdecl;
    function hashCode: Integer; cdecl;
    function instant: JInstant; cdecl;
    function millis: Int64; cdecl;
    function withZone(zone: JZoneId): JClock; cdecl;
  end;
  TJClock = class(TJavaGenericImport<JClockClass, JClock>) end;

  JDayOfWeekClass = interface(JEnumClass)
    ['{3385BD9F-F681-47A1-AD40-DF9628BB2656}']
    {class} function _GetFRIDAY: JDayOfWeek; cdecl;
    {class} function _GetMONDAY: JDayOfWeek; cdecl;
    {class} function _GetSATURDAY: JDayOfWeek; cdecl;
    {class} function _GetSUNDAY: JDayOfWeek; cdecl;
    {class} function _GetTHURSDAY: JDayOfWeek; cdecl;
    {class} function _GetTUESDAY: JDayOfWeek; cdecl;
    {class} function _GetWEDNESDAY: JDayOfWeek; cdecl;
    {class} function from(temporal: JTemporalAccessor): JDayOfWeek; cdecl;
    {class} function &of(dayOfWeek: Integer): JDayOfWeek; cdecl;
    {class} function valueOf(name: JString): JDayOfWeek; cdecl;
    {class} function values: TJavaObjectArray<JDayOfWeek>; cdecl;
    {class} property FRIDAY: JDayOfWeek read _GetFRIDAY;
    {class} property MONDAY: JDayOfWeek read _GetMONDAY;
    {class} property SATURDAY: JDayOfWeek read _GetSATURDAY;
    {class} property SUNDAY: JDayOfWeek read _GetSUNDAY;
    {class} property THURSDAY: JDayOfWeek read _GetTHURSDAY;
    {class} property TUESDAY: JDayOfWeek read _GetTUESDAY;
    {class} property WEDNESDAY: JDayOfWeek read _GetWEDNESDAY;
  end;

  [JavaSignature('java/time/DayOfWeek')]
  JDayOfWeek = interface(JEnum)
    ['{D6FD6BEF-2368-4F24-9DEA-A1927EF1C3FC}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDisplayName(style: JTextStyle; locale: JLocale): JString; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getValue: Integer; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl;
    function minus(days: Int64): JDayOfWeek; cdecl;
    function plus(days: Int64): JDayOfWeek; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
  end;
  TJDayOfWeek = class(TJavaGenericImport<JDayOfWeekClass, JDayOfWeek>) end;

  Jtime_DurationClass = interface(JObjectClass)
    ['{4BB29ECC-A65F-43E2-9085-76E96ECCAEB2}']
    {class} function _GetZERO: Jtime_Duration; cdecl;
    {class} function between(startInclusive: JTemporal; endExclusive: JTemporal): Jtime_Duration; cdecl;
    {class} function from(amount: JTemporalAmount): Jtime_Duration; cdecl;
    {class} function &of(amount: Int64; unit_: JTemporalUnit): Jtime_Duration; cdecl;
    {class} function ofDays(days: Int64): Jtime_Duration; cdecl;
    {class} function ofHours(hours: Int64): Jtime_Duration; cdecl;
    {class} function ofMillis(millis: Int64): Jtime_Duration; cdecl;
    {class} function ofMinutes(minutes: Int64): Jtime_Duration; cdecl;
    {class} function ofNanos(nanos: Int64): Jtime_Duration; cdecl;
    {class} function ofSeconds(seconds: Int64): Jtime_Duration; cdecl; overload;
    {class} function ofSeconds(seconds: Int64; nanoAdjustment: Int64): Jtime_Duration; cdecl; overload;
    {class} function parse(text: JCharSequence): Jtime_Duration; cdecl;
    {class} property ZERO: Jtime_Duration read _GetZERO;
  end;

  [JavaSignature('java/time/Duration')]
  Jtime_Duration = interface(JObject)
    ['{7DCBB469-642B-45CD-ADE5-DA2F7CA08D72}']
    function abs: Jtime_Duration; cdecl;
    function addTo(temporal: JTemporal): JTemporal; cdecl;
    function compareTo(otherDuration: Jtime_Duration): Integer; cdecl;
    function dividedBy(divisor: Int64): Jtime_Duration; cdecl;
    function equals(otherDuration: JObject): Boolean; cdecl;
    function &get(unit_: JTemporalUnit): Int64; cdecl;
    function getNano: Integer; cdecl;
    function getSeconds: Int64; cdecl;
    function getUnits: JList; cdecl;
    function hashCode: Integer; cdecl;
    function isNegative: Boolean; cdecl;
    function isZero: Boolean; cdecl;
    function minus(duration: Jtime_Duration): Jtime_Duration; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): Jtime_Duration; cdecl; overload;
    function minusDays(daysToSubtract: Int64): Jtime_Duration; cdecl;
    function minusHours(hoursToSubtract: Int64): Jtime_Duration; cdecl;
    function minusMillis(millisToSubtract: Int64): Jtime_Duration; cdecl;
    function minusMinutes(minutesToSubtract: Int64): Jtime_Duration; cdecl;
    function minusNanos(nanosToSubtract: Int64): Jtime_Duration; cdecl;
    function minusSeconds(secondsToSubtract: Int64): Jtime_Duration; cdecl;
    function multipliedBy(multiplicand: Int64): Jtime_Duration; cdecl;
    function negated: Jtime_Duration; cdecl;
    function plus(duration: Jtime_Duration): Jtime_Duration; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): Jtime_Duration; cdecl; overload;
    function plusDays(daysToAdd: Int64): Jtime_Duration; cdecl;
    function plusHours(hoursToAdd: Int64): Jtime_Duration; cdecl;
    function plusMillis(millisToAdd: Int64): Jtime_Duration; cdecl;
    function plusMinutes(minutesToAdd: Int64): Jtime_Duration; cdecl;
    function plusNanos(nanosToAdd: Int64): Jtime_Duration; cdecl;
    function plusSeconds(secondsToAdd: Int64): Jtime_Duration; cdecl;
    function subtractFrom(temporal: JTemporal): JTemporal; cdecl;
    function toDays: Int64; cdecl;
    function toHours: Int64; cdecl;
    function toMillis: Int64; cdecl;
    function toMinutes: Int64; cdecl;
    function toNanos: Int64; cdecl;
    function toString: JString; cdecl;
    function withNanos(nanoOfSecond: Integer): Jtime_Duration; cdecl;
    function withSeconds(seconds: Int64): Jtime_Duration; cdecl;
  end;
  TJtime_Duration = class(TJavaGenericImport<Jtime_DurationClass, Jtime_Duration>) end;

  JInstantClass = interface(JObjectClass)
    ['{CEC50A54-F3AE-452B-908E-1A78F3C56DE3}']
    {class} function _GetEPOCH: JInstant; cdecl;
    {class} function _GetMAX: JInstant; cdecl;
    {class} function _GetMIN: JInstant; cdecl;
    {class} function from(temporal: JTemporalAccessor): JInstant; cdecl;
    {class} function now: JInstant; cdecl; overload;
    {class} function now(clock: JClock): JInstant; cdecl; overload;
    {class} function ofEpochMilli(epochMilli: Int64): JInstant; cdecl;
    {class} function ofEpochSecond(epochSecond: Int64): JInstant; cdecl; overload;
    {class} function ofEpochSecond(epochSecond: Int64; nanoAdjustment: Int64): JInstant; cdecl; overload;
    {class} function parse(text: JCharSequence): JInstant; cdecl;
    {class} property EPOCH: JInstant read _GetEPOCH;
    {class} property MAX: JInstant read _GetMAX;
    {class} property MIN: JInstant read _GetMIN;
  end;

  [JavaSignature('java/time/Instant')]
  JInstant = interface(JObject)
    ['{64439F72-48D1-41FC-806D-E9FB1C806F6B}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atOffset(offset: JZoneOffset): JOffsetDateTime; cdecl;
    function atZone(zone: JZoneId): JZonedDateTime; cdecl;
    function compareTo(otherInstant: JInstant): Integer; cdecl;
    function equals(otherInstant: JObject): Boolean; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getEpochSecond: Int64; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getNano: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(otherInstant: JInstant): Boolean; cdecl;
    function isBefore(otherInstant: JInstant): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JInstant; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JInstant; cdecl; overload;
    function minusMillis(millisToSubtract: Int64): JInstant; cdecl;
    function minusNanos(nanosToSubtract: Int64): JInstant; cdecl;
    function minusSeconds(secondsToSubtract: Int64): JInstant; cdecl;
    function plus(amountToAdd: JTemporalAmount): JInstant; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JInstant; cdecl; overload;
    function plusMillis(millisToAdd: Int64): JInstant; cdecl;
    function plusNanos(nanosToAdd: Int64): JInstant; cdecl;
    function plusSeconds(secondsToAdd: Int64): JInstant; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toEpochMilli: Int64; cdecl;
    function toString: JString; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JInstant; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JInstant; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JInstant; cdecl; overload;
  end;
  TJInstant = class(TJavaGenericImport<JInstantClass, JInstant>) end;

  JLocalDateClass = interface(JObjectClass)
    ['{0298591F-E2AF-4F53-B9C9-8598FAA7651A}']
    {class} function _GetMAX: JLocalDate; cdecl;
    {class} function _GetMIN: JLocalDate; cdecl;
    {class} function from(temporal: JTemporalAccessor): JLocalDate; cdecl;
    {class} function now: JLocalDate; cdecl; overload;
    {class} function now(zone: JZoneId): JLocalDate; cdecl; overload;
    {class} function now(clock: JClock): JLocalDate; cdecl; overload;
    {class} function &of(year: Integer; month: JMonth; dayOfMonth: Integer): JLocalDate; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer): JLocalDate; cdecl; overload;
    {class} function ofEpochDay(epochDay: Int64): JLocalDate; cdecl;
    {class} function ofYearDay(year: Integer; dayOfYear: Integer): JLocalDate; cdecl;
    {class} function parse(text: JCharSequence): JLocalDate; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JLocalDate; cdecl; overload;
    {class} property MAX: JLocalDate read _GetMAX;
    {class} property MIN: JLocalDate read _GetMIN;
  end;

  [JavaSignature('java/time/LocalDate')]
  JLocalDate = interface(JObject)
    ['{A47DE364-3856-4262-928B-6E03C355D18B}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atStartOfDay: JLocalDateTime; cdecl; overload;
    function atStartOfDay(zone: JZoneId): JZonedDateTime; cdecl; overload;
    function atTime(time: JLocalTime): JLocalDateTime; cdecl; overload;
    function atTime(hour: Integer; minute: Integer): JLocalDateTime; cdecl; overload;
    function atTime(hour: Integer; minute: Integer; second: Integer): JLocalDateTime; cdecl; overload;
    function atTime(hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer): JLocalDateTime; cdecl; overload;
    function atTime(time: JOffsetTime): JOffsetDateTime; cdecl; overload;
    function compareTo(other: JChronoLocalDate): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getChronology: JIsoChronology; cdecl;
    function getDayOfMonth: Integer; cdecl;
    function getDayOfWeek: JDayOfWeek; cdecl;
    function getDayOfYear: Integer; cdecl;
    function getEra: JEra; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMonth: JMonth; cdecl;
    function getMonthValue: Integer; cdecl;
    function getYear: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JChronoLocalDate): Boolean; cdecl;
    function isBefore(other: JChronoLocalDate): Boolean; cdecl;
    function isEqual(other: JChronoLocalDate): Boolean; cdecl;
    function isLeapYear: Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function lengthOfMonth: Integer; cdecl;
    function lengthOfYear: Integer; cdecl;
    function minus(amountToSubtract: JTemporalAmount): JLocalDate; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JLocalDate; cdecl; overload;
    function minusDays(daysToSubtract: Int64): JLocalDate; cdecl;
    function minusMonths(monthsToSubtract: Int64): JLocalDate; cdecl;
    function minusWeeks(weeksToSubtract: Int64): JLocalDate; cdecl;
    function minusYears(yearsToSubtract: Int64): JLocalDate; cdecl;
    function plus(amountToAdd: JTemporalAmount): JLocalDate; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JLocalDate; cdecl; overload;
    function plusDays(daysToAdd: Int64): JLocalDate; cdecl;
    function plusMonths(monthsToAdd: Int64): JLocalDate; cdecl;
    function plusWeeks(weeksToAdd: Int64): JLocalDate; cdecl;
    function plusYears(yearsToAdd: Int64): JLocalDate; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toEpochDay: Int64; cdecl;
    function toString: JString; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl; overload;
    function &until(endDateExclusive: JChronoLocalDate): JPeriod; cdecl; overload;
    function &with(adjuster: JTemporalAdjuster): JLocalDate; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JLocalDate; cdecl; overload;
    function withDayOfMonth(dayOfMonth: Integer): JLocalDate; cdecl;
    function withDayOfYear(dayOfYear: Integer): JLocalDate; cdecl;
    function withMonth(month: Integer): JLocalDate; cdecl;
    function withYear(year: Integer): JLocalDate; cdecl;
  end;
  TJLocalDate = class(TJavaGenericImport<JLocalDateClass, JLocalDate>) end;

  JLocalDateTimeClass = interface(JObjectClass)
    ['{66493F01-1AEA-4E54-9F21-D6AA04D39D54}']
    {class} function _GetMAX: JLocalDateTime; cdecl;
    {class} function _GetMIN: JLocalDateTime; cdecl;
    {class} function from(temporal: JTemporalAccessor): JLocalDateTime; cdecl;
    {class} function now: JLocalDateTime; cdecl; overload;
    {class} function now(zone: JZoneId): JLocalDateTime; cdecl; overload;
    {class} function now(clock: JClock): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: JMonth; dayOfMonth: Integer; hour: Integer; minute: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: JMonth; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: JMonth; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer; hour: Integer; minute: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer): JLocalDateTime; cdecl; overload;
    {class} function &of(date: JLocalDate; time: JLocalTime): JLocalDateTime; cdecl; overload;
    {class} function ofEpochSecond(epochSecond: Int64; nanoOfSecond: Integer; offset: JZoneOffset): JLocalDateTime; cdecl;
    {class} function ofInstant(instant: JInstant; zone: JZoneId): JLocalDateTime; cdecl;
    {class} function parse(text: JCharSequence): JLocalDateTime; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JLocalDateTime; cdecl; overload;
    {class} property MAX: JLocalDateTime read _GetMAX;
    {class} property MIN: JLocalDateTime read _GetMIN;
  end;

  [JavaSignature('java/time/LocalDateTime')]
  JLocalDateTime = interface(JObject)
    ['{628942E7-1397-4058-A923-66F0A9D5576E}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atOffset(offset: JZoneOffset): JOffsetDateTime; cdecl;
    function atZone(zone: JZoneId): JZonedDateTime; cdecl;
    function compareTo(other: JChronoLocalDateTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDayOfMonth: Integer; cdecl;
    function getDayOfWeek: JDayOfWeek; cdecl;
    function getDayOfYear: Integer; cdecl;
    function getHour: Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMinute: Integer; cdecl;
    function getMonth: JMonth; cdecl;
    function getMonthValue: Integer; cdecl;
    function getNano: Integer; cdecl;
    function getSecond: Integer; cdecl;
    function getYear: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JChronoLocalDateTime): Boolean; cdecl;
    function isBefore(other: JChronoLocalDateTime): Boolean; cdecl;
    function isEqual(other: JChronoLocalDateTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JLocalDateTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JLocalDateTime; cdecl; overload;
    function minusDays(days: Int64): JLocalDateTime; cdecl;
    function minusHours(hours: Int64): JLocalDateTime; cdecl;
    function minusMinutes(minutes: Int64): JLocalDateTime; cdecl;
    function minusMonths(months: Int64): JLocalDateTime; cdecl;
    function minusNanos(nanos: Int64): JLocalDateTime; cdecl;
    function minusSeconds(seconds: Int64): JLocalDateTime; cdecl;
    function minusWeeks(weeks: Int64): JLocalDateTime; cdecl;
    function minusYears(years: Int64): JLocalDateTime; cdecl;
    function plus(amountToAdd: JTemporalAmount): JLocalDateTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JLocalDateTime; cdecl; overload;
    function plusDays(days: Int64): JLocalDateTime; cdecl;
    function plusHours(hours: Int64): JLocalDateTime; cdecl;
    function plusMinutes(minutes: Int64): JLocalDateTime; cdecl;
    function plusMonths(months: Int64): JLocalDateTime; cdecl;
    function plusNanos(nanos: Int64): JLocalDateTime; cdecl;
    function plusSeconds(seconds: Int64): JLocalDateTime; cdecl;
    function plusWeeks(weeks: Int64): JLocalDateTime; cdecl;
    function plusYears(years: Int64): JLocalDateTime; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toLocalDate: JLocalDate; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toString: JString; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JLocalDateTime; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JLocalDateTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JLocalDateTime; cdecl; overload;
    function withDayOfMonth(dayOfMonth: Integer): JLocalDateTime; cdecl;
    function withDayOfYear(dayOfYear: Integer): JLocalDateTime; cdecl;
    function withHour(hour: Integer): JLocalDateTime; cdecl;
    function withMinute(minute: Integer): JLocalDateTime; cdecl;
    function withMonth(month: Integer): JLocalDateTime; cdecl;
    function withNano(nanoOfSecond: Integer): JLocalDateTime; cdecl;
    function withSecond(second: Integer): JLocalDateTime; cdecl;
    function withYear(year: Integer): JLocalDateTime; cdecl;
  end;
  TJLocalDateTime = class(TJavaGenericImport<JLocalDateTimeClass, JLocalDateTime>) end;

  JLocalTimeClass = interface(JObjectClass)
    ['{C62B039B-151C-4C8D-B9B5-CE7F5A99F523}']
    {class} function _GetMAX: JLocalTime; cdecl;
    {class} function _GetMIDNIGHT: JLocalTime; cdecl;
    {class} function _GetMIN: JLocalTime; cdecl;
    {class} function _GetNOON: JLocalTime; cdecl;
    {class} function from(temporal: JTemporalAccessor): JLocalTime; cdecl;
    {class} function now: JLocalTime; cdecl; overload;
    {class} function now(zone: JZoneId): JLocalTime; cdecl; overload;
    {class} function now(clock: JClock): JLocalTime; cdecl; overload;
    {class} function &of(hour: Integer; minute: Integer): JLocalTime; cdecl; overload;
    {class} function &of(hour: Integer; minute: Integer; second: Integer): JLocalTime; cdecl; overload;
    {class} function &of(hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer): JLocalTime; cdecl; overload;
    {class} function ofNanoOfDay(nanoOfDay: Int64): JLocalTime; cdecl;
    {class} function ofSecondOfDay(secondOfDay: Int64): JLocalTime; cdecl;
    {class} function parse(text: JCharSequence): JLocalTime; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JLocalTime; cdecl; overload;
    {class} property MAX: JLocalTime read _GetMAX;
    {class} property MIDNIGHT: JLocalTime read _GetMIDNIGHT;
    {class} property MIN: JLocalTime read _GetMIN;
    {class} property NOON: JLocalTime read _GetNOON;
  end;

  [JavaSignature('java/time/LocalTime')]
  JLocalTime = interface(JObject)
    ['{2405545A-289F-4EB3-A3A2-938F52BC0B0D}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atDate(date: JLocalDate): JLocalDateTime; cdecl;
    function atOffset(offset: JZoneOffset): JOffsetTime; cdecl;
    function compareTo(other: JLocalTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getHour: Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMinute: Integer; cdecl;
    function getNano: Integer; cdecl;
    function getSecond: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JLocalTime): Boolean; cdecl;
    function isBefore(other: JLocalTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JLocalTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JLocalTime; cdecl; overload;
    function minusHours(hoursToSubtract: Int64): JLocalTime; cdecl;
    function minusMinutes(minutesToSubtract: Int64): JLocalTime; cdecl;
    function minusNanos(nanosToSubtract: Int64): JLocalTime; cdecl;
    function minusSeconds(secondsToSubtract: Int64): JLocalTime; cdecl;
    function plus(amountToAdd: JTemporalAmount): JLocalTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JLocalTime; cdecl; overload;
    function plusHours(hoursToAdd: Int64): JLocalTime; cdecl;
    function plusMinutes(minutesToAdd: Int64): JLocalTime; cdecl;
    function plusNanos(nanosToAdd: Int64): JLocalTime; cdecl;
    function plusSeconds(secondstoAdd: Int64): JLocalTime; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toNanoOfDay: Int64; cdecl;
    function toSecondOfDay: Integer; cdecl;
    function toString: JString; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JLocalTime; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JLocalTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JLocalTime; cdecl; overload;
    function withHour(hour: Integer): JLocalTime; cdecl;
    function withMinute(minute: Integer): JLocalTime; cdecl;
    function withNano(nanoOfSecond: Integer): JLocalTime; cdecl;
    function withSecond(second: Integer): JLocalTime; cdecl;
  end;
  TJLocalTime = class(TJavaGenericImport<JLocalTimeClass, JLocalTime>) end;

  JMonthClass = interface(JEnumClass)
    ['{7888C319-AE17-4499-8E13-2B6468B6BA6C}']
    {class} function _GetAPRIL: JMonth; cdecl;
    {class} function _GetAUGUST: JMonth; cdecl;
    {class} function _GetDECEMBER: JMonth; cdecl;
    {class} function _GetFEBRUARY: JMonth; cdecl;
    {class} function _GetJANUARY: JMonth; cdecl;
    {class} function _GetJULY: JMonth; cdecl;
    {class} function _GetJUNE: JMonth; cdecl;
    {class} function _GetMARCH: JMonth; cdecl;
    {class} function _GetMAY: JMonth; cdecl;
    {class} function _GetNOVEMBER: JMonth; cdecl;
    {class} function _GetOCTOBER: JMonth; cdecl;
    {class} function _GetSEPTEMBER: JMonth; cdecl;
    {class} function from(temporal: JTemporalAccessor): JMonth; cdecl;
    {class} function &of(month: Integer): JMonth; cdecl;
    {class} function valueOf(name: JString): JMonth; cdecl;
    {class} function values: TJavaObjectArray<JMonth>; cdecl;
    {class} property APRIL: JMonth read _GetAPRIL;
    {class} property AUGUST: JMonth read _GetAUGUST;
    {class} property DECEMBER: JMonth read _GetDECEMBER;
    {class} property FEBRUARY: JMonth read _GetFEBRUARY;
    {class} property JANUARY: JMonth read _GetJANUARY;
    {class} property JULY: JMonth read _GetJULY;
    {class} property JUNE: JMonth read _GetJUNE;
    {class} property MARCH: JMonth read _GetMARCH;
    {class} property MAY: JMonth read _GetMAY;
    {class} property NOVEMBER: JMonth read _GetNOVEMBER;
    {class} property OCTOBER: JMonth read _GetOCTOBER;
    {class} property SEPTEMBER: JMonth read _GetSEPTEMBER;
  end;

  [JavaSignature('java/time/Month')]
  JMonth = interface(JEnum)
    ['{31D6AE11-DA20-45F3-AE42-49C020750FD2}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function firstDayOfYear(leapYear: Boolean): Integer; cdecl;
    function firstMonthOfQuarter: JMonth; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDisplayName(style: JTextStyle; locale: JLocale): JString; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getValue: Integer; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl;
    function length(leapYear: Boolean): Integer; cdecl;
    function maxLength: Integer; cdecl;
    function minLength: Integer; cdecl;
    function minus(months: Int64): JMonth; cdecl;
    function plus(months: Int64): JMonth; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
  end;
  TJMonth = class(TJavaGenericImport<JMonthClass, JMonth>) end;

  JOffsetDateTimeClass = interface(JObjectClass)
    ['{3915F653-D047-4752-B63B-2B99F20C1BFF}']
    {class} function _GetMAX: JOffsetDateTime; cdecl;
    {class} function _GetMIN: JOffsetDateTime; cdecl;
    {class} function from(temporal: JTemporalAccessor): JOffsetDateTime; cdecl;
    {class} function now: JOffsetDateTime; cdecl; overload;
    {class} function now(zone: JZoneId): JOffsetDateTime; cdecl; overload;
    {class} function now(clock: JClock): JOffsetDateTime; cdecl; overload;
    {class} function &of(date: JLocalDate; time: JLocalTime; offset: JZoneOffset): JOffsetDateTime; cdecl; overload;
    {class} function &of(dateTime: JLocalDateTime; offset: JZoneOffset): JOffsetDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer; offset: JZoneOffset): JOffsetDateTime; cdecl; overload;
    {class} function ofInstant(instant: JInstant; zone: JZoneId): JOffsetDateTime; cdecl;
    {class} function parse(text: JCharSequence): JOffsetDateTime; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JOffsetDateTime; cdecl; overload;
    {class} function timeLineOrder: JComparator; cdecl;
    {class} property MAX: JOffsetDateTime read _GetMAX;
    {class} property MIN: JOffsetDateTime read _GetMIN;
  end;

  [JavaSignature('java/time/OffsetDateTime')]
  JOffsetDateTime = interface(JObject)
    ['{4BD67AA9-A558-4EAC-B9F3-C089BFB1D8E5}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atZoneSameInstant(zone: JZoneId): JZonedDateTime; cdecl;
    function atZoneSimilarLocal(zone: JZoneId): JZonedDateTime; cdecl;
    function compareTo(other: JOffsetDateTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDayOfMonth: Integer; cdecl;
    function getDayOfWeek: JDayOfWeek; cdecl;
    function getDayOfYear: Integer; cdecl;
    function getHour: Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMinute: Integer; cdecl;
    function getMonth: JMonth; cdecl;
    function getMonthValue: Integer; cdecl;
    function getNano: Integer; cdecl;
    function getOffset: JZoneOffset; cdecl;
    function getSecond: Integer; cdecl;
    function getYear: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JOffsetDateTime): Boolean; cdecl;
    function isBefore(other: JOffsetDateTime): Boolean; cdecl;
    function isEqual(other: JOffsetDateTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JOffsetDateTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JOffsetDateTime; cdecl; overload;
    function minusDays(days: Int64): JOffsetDateTime; cdecl;
    function minusHours(hours: Int64): JOffsetDateTime; cdecl;
    function minusMinutes(minutes: Int64): JOffsetDateTime; cdecl;
    function minusMonths(months: Int64): JOffsetDateTime; cdecl;
    function minusNanos(nanos: Int64): JOffsetDateTime; cdecl;
    function minusSeconds(seconds: Int64): JOffsetDateTime; cdecl;
    function minusWeeks(weeks: Int64): JOffsetDateTime; cdecl;
    function minusYears(years: Int64): JOffsetDateTime; cdecl;
    function plus(amountToAdd: JTemporalAmount): JOffsetDateTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JOffsetDateTime; cdecl; overload;
    function plusDays(days: Int64): JOffsetDateTime; cdecl;
    function plusHours(hours: Int64): JOffsetDateTime; cdecl;
    function plusMinutes(minutes: Int64): JOffsetDateTime; cdecl;
    function plusMonths(months: Int64): JOffsetDateTime; cdecl;
    function plusNanos(nanos: Int64): JOffsetDateTime; cdecl;
    function plusSeconds(seconds: Int64): JOffsetDateTime; cdecl;
    function plusWeeks(weeks: Int64): JOffsetDateTime; cdecl;
    function plusYears(years: Int64): JOffsetDateTime; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toEpochSecond: Int64; cdecl;
    function toInstant: JInstant; cdecl;
    function toLocalDate: JLocalDate; cdecl;
    function toLocalDateTime: JLocalDateTime; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toOffsetTime: JOffsetTime; cdecl;
    function toString: JString; cdecl;
    function toZonedDateTime: JZonedDateTime; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JOffsetDateTime; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JOffsetDateTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JOffsetDateTime; cdecl; overload;
    function withDayOfMonth(dayOfMonth: Integer): JOffsetDateTime; cdecl;
    function withDayOfYear(dayOfYear: Integer): JOffsetDateTime; cdecl;
    function withHour(hour: Integer): JOffsetDateTime; cdecl;
    function withMinute(minute: Integer): JOffsetDateTime; cdecl;
    function withMonth(month: Integer): JOffsetDateTime; cdecl;
    function withNano(nanoOfSecond: Integer): JOffsetDateTime; cdecl;
    function withOffsetSameInstant(offset: JZoneOffset): JOffsetDateTime; cdecl;
    function withOffsetSameLocal(offset: JZoneOffset): JOffsetDateTime; cdecl;
    function withSecond(second: Integer): JOffsetDateTime; cdecl;
    function withYear(year: Integer): JOffsetDateTime; cdecl;
  end;
  TJOffsetDateTime = class(TJavaGenericImport<JOffsetDateTimeClass, JOffsetDateTime>) end;

  JOffsetTimeClass = interface(JObjectClass)
    ['{D68E7A75-3F64-4A99-B12C-F2BE0F3BDF2D}']
    {class} function _GetMAX: JOffsetTime; cdecl;
    {class} function _GetMIN: JOffsetTime; cdecl;
    {class} function from(temporal: JTemporalAccessor): JOffsetTime; cdecl;
    {class} function now: JOffsetTime; cdecl; overload;
    {class} function now(zone: JZoneId): JOffsetTime; cdecl; overload;
    {class} function now(clock: JClock): JOffsetTime; cdecl; overload;
    {class} function &of(time: JLocalTime; offset: JZoneOffset): JOffsetTime; cdecl; overload;
    {class} function &of(hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer; offset: JZoneOffset): JOffsetTime; cdecl; overload;
    {class} function ofInstant(instant: JInstant; zone: JZoneId): JOffsetTime; cdecl;
    {class} function parse(text: JCharSequence): JOffsetTime; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JOffsetTime; cdecl; overload;
    {class} property MAX: JOffsetTime read _GetMAX;
    {class} property MIN: JOffsetTime read _GetMIN;
  end;

  [JavaSignature('java/time/OffsetTime')]
  JOffsetTime = interface(JObject)
    ['{C984267C-64F5-4E7D-812E-B41300987338}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atDate(date: JLocalDate): JOffsetDateTime; cdecl;
    function compareTo(other: JOffsetTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getHour: Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMinute: Integer; cdecl;
    function getNano: Integer; cdecl;
    function getOffset: JZoneOffset; cdecl;
    function getSecond: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JOffsetTime): Boolean; cdecl;
    function isBefore(other: JOffsetTime): Boolean; cdecl;
    function isEqual(other: JOffsetTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JOffsetTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JOffsetTime; cdecl; overload;
    function minusHours(hours: Int64): JOffsetTime; cdecl;
    function minusMinutes(minutes: Int64): JOffsetTime; cdecl;
    function minusNanos(nanos: Int64): JOffsetTime; cdecl;
    function minusSeconds(seconds: Int64): JOffsetTime; cdecl;
    function plus(amountToAdd: JTemporalAmount): JOffsetTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JOffsetTime; cdecl; overload;
    function plusHours(hours: Int64): JOffsetTime; cdecl;
    function plusMinutes(minutes: Int64): JOffsetTime; cdecl;
    function plusNanos(nanos: Int64): JOffsetTime; cdecl;
    function plusSeconds(seconds: Int64): JOffsetTime; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toString: JString; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JOffsetTime; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JOffsetTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JOffsetTime; cdecl; overload;
    function withHour(hour: Integer): JOffsetTime; cdecl;
    function withMinute(minute: Integer): JOffsetTime; cdecl;
    function withNano(nanoOfSecond: Integer): JOffsetTime; cdecl;
    function withOffsetSameInstant(offset: JZoneOffset): JOffsetTime; cdecl;
    function withOffsetSameLocal(offset: JZoneOffset): JOffsetTime; cdecl;
    function withSecond(second: Integer): JOffsetTime; cdecl;
  end;
  TJOffsetTime = class(TJavaGenericImport<JOffsetTimeClass, JOffsetTime>) end;

  JPeriodClass = interface(JObjectClass)
    ['{8E30B7C3-6FE7-45A0-82D3-8E3B6971E653}']
    {class} function _GetZERO: JPeriod; cdecl;
    {class} function between(startDateInclusive: JLocalDate; endDateExclusive: JLocalDate): JPeriod; cdecl;
    {class} function from(amount: JTemporalAmount): JPeriod; cdecl;
    {class} function &of(years: Integer; months: Integer; days: Integer): JPeriod; cdecl;
    {class} function ofDays(days: Integer): JPeriod; cdecl;
    {class} function ofMonths(months: Integer): JPeriod; cdecl;
    {class} function ofWeeks(weeks: Integer): JPeriod; cdecl;
    {class} function ofYears(years: Integer): JPeriod; cdecl;
    {class} function parse(text: JCharSequence): JPeriod; cdecl;
    {class} property ZERO: JPeriod read _GetZERO;
  end;

  [JavaSignature('java/time/Period')]
  JPeriod = interface(JObject)
    ['{73A08CE4-1E78-463F-8428-E92D1220CB95}']
    function addTo(temporal: JTemporal): JTemporal; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function &get(unit_: JTemporalUnit): Int64; cdecl;
    function getChronology: JIsoChronology; cdecl;
    function getDays: Integer; cdecl;
    function getMonths: Integer; cdecl;
    function getUnits: JList; cdecl;
    function getYears: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isNegative: Boolean; cdecl;
    function isZero: Boolean; cdecl;
    function minus(amountToSubtract: JTemporalAmount): JPeriod; cdecl;
    function minusDays(daysToSubtract: Int64): JPeriod; cdecl;
    function minusMonths(monthsToSubtract: Int64): JPeriod; cdecl;
    function minusYears(yearsToSubtract: Int64): JPeriod; cdecl;
    function multipliedBy(scalar: Integer): JPeriod; cdecl;
    function negated: JPeriod; cdecl;
    function normalized: JPeriod; cdecl;
    function plus(amountToAdd: JTemporalAmount): JPeriod; cdecl;
    function plusDays(daysToAdd: Int64): JPeriod; cdecl;
    function plusMonths(monthsToAdd: Int64): JPeriod; cdecl;
    function plusYears(yearsToAdd: Int64): JPeriod; cdecl;
    function subtractFrom(temporal: JTemporal): JTemporal; cdecl;
    function toString: JString; cdecl;
    function toTotalMonths: Int64; cdecl;
    function withDays(days: Integer): JPeriod; cdecl;
    function withMonths(months: Integer): JPeriod; cdecl;
    function withYears(years: Integer): JPeriod; cdecl;
  end;
  TJPeriod = class(TJavaGenericImport<JPeriodClass, JPeriod>) end;

  JZoneIdClass = interface(JObjectClass)
    ['{E52F2721-449C-41F1-AB54-08AF52419012}']
    {class} function _GetSHORT_IDS: JMap; cdecl;
    {class} function from(temporal: JTemporalAccessor): JZoneId; cdecl;
    {class} function getAvailableZoneIds: JSet; cdecl;
    {class} function &of(zoneId: JString; aliasMap: JMap): JZoneId; cdecl; overload;
    {class} function &of(zoneId: JString): JZoneId; cdecl; overload;
    {class} function ofOffset(prefix: JString; offset: JZoneOffset): JZoneId; cdecl;
    {class} function systemDefault: JZoneId; cdecl;
    {class} property SHORT_IDS: JMap read _GetSHORT_IDS;
  end;

  [JavaSignature('java/time/ZoneId')]
  JZoneId = interface(JObject)
    ['{52C6249F-8F81-4BC3-917E-D9A7EE283A43}']
    function equals(obj: JObject): Boolean; cdecl;
    function getDisplayName(style: JTextStyle; locale: JLocale): JString; cdecl;
    function getId: JString; cdecl;
    function getRules: JZoneRules; cdecl;
    function hashCode: Integer; cdecl;
    function normalized: JZoneId; cdecl;
    function toString: JString; cdecl;
  end;
  TJZoneId = class(TJavaGenericImport<JZoneIdClass, JZoneId>) end;

  JZoneOffsetClass = interface(JZoneIdClass)
    ['{AE51E1AF-54C6-4EF2-8517-D3EEE4EFB63F}']
    {class} function _GetMAX: JZoneOffset; cdecl;
    {class} function _GetMIN: JZoneOffset; cdecl;
    {class} function _GetUTC: JZoneOffset; cdecl;
    {class} function from(temporal: JTemporalAccessor): JZoneOffset; cdecl;
    {class} function &of(offsetId: JString): JZoneOffset; cdecl;
    {class} function ofHours(hours: Integer): JZoneOffset; cdecl;
    {class} function ofHoursMinutes(hours: Integer; minutes: Integer): JZoneOffset; cdecl;
    {class} function ofHoursMinutesSeconds(hours: Integer; minutes: Integer; seconds: Integer): JZoneOffset; cdecl;
    {class} function ofTotalSeconds(totalSeconds: Integer): JZoneOffset; cdecl;
    {class} property MAX: JZoneOffset read _GetMAX;
    {class} property MIN: JZoneOffset read _GetMIN;
    {class} property UTC: JZoneOffset read _GetUTC;
  end;

  [JavaSignature('java/time/ZoneOffset')]
  JZoneOffset = interface(JZoneId)
    ['{4E862086-3310-4348-84AF-1D4B2B697F50}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function compareTo(other: JZoneOffset): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getId: JString; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getRules: JZoneRules; cdecl;
    function getTotalSeconds: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toString: JString; cdecl;
  end;
  TJZoneOffset = class(TJavaGenericImport<JZoneOffsetClass, JZoneOffset>) end;

  JZonedDateTimeClass = interface(JObjectClass)
    ['{37DB99E6-7A08-4861-A349-B79831E8612F}']
    {class} function from(temporal: JTemporalAccessor): JZonedDateTime; cdecl;
    {class} function now: JZonedDateTime; cdecl; overload;
    {class} function now(zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function now(clock: JClock): JZonedDateTime; cdecl; overload;
    {class} function &of(date: JLocalDate; time: JLocalTime; zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function &of(localDateTime: JLocalDateTime; zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function &of(year: Integer; month: Integer; dayOfMonth: Integer; hour: Integer; minute: Integer; second: Integer; nanoOfSecond: Integer; zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function ofInstant(instant: JInstant; zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function ofInstant(localDateTime: JLocalDateTime; offset: JZoneOffset; zone: JZoneId): JZonedDateTime; cdecl; overload;
    {class} function ofLocal(localDateTime: JLocalDateTime; zone: JZoneId; preferredOffset: JZoneOffset): JZonedDateTime; cdecl;
    {class} function ofStrict(localDateTime: JLocalDateTime; offset: JZoneOffset; zone: JZoneId): JZonedDateTime; cdecl;
    {class} function parse(text: JCharSequence): JZonedDateTime; cdecl; overload;
    {class} function parse(text: JCharSequence; formatter: JDateTimeFormatter): JZonedDateTime; cdecl; overload;
  end;

  [JavaSignature('java/time/ZonedDateTime')]
  JZonedDateTime = interface(JObject)
    ['{D680CDE8-3B08-42DD-9557-3AC4DFA78DC5}']
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDayOfMonth: Integer; cdecl;
    function getDayOfWeek: JDayOfWeek; cdecl;
    function getDayOfYear: Integer; cdecl;
    function getHour: Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getMinute: Integer; cdecl;
    function getMonth: JMonth; cdecl;
    function getMonthValue: Integer; cdecl;
    function getNano: Integer; cdecl;
    function getOffset: JZoneOffset; cdecl;
    function getSecond: Integer; cdecl;
    function getYear: Integer; cdecl;
    function getZone: JZoneId; cdecl;
    function hashCode: Integer; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amountToSubtract: JTemporalAmount): JZonedDateTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JZonedDateTime; cdecl; overload;
    function minusDays(days: Int64): JZonedDateTime; cdecl;
    function minusHours(hours: Int64): JZonedDateTime; cdecl;
    function minusMinutes(minutes: Int64): JZonedDateTime; cdecl;
    function minusMonths(months: Int64): JZonedDateTime; cdecl;
    function minusNanos(nanos: Int64): JZonedDateTime; cdecl;
    function minusSeconds(seconds: Int64): JZonedDateTime; cdecl;
    function minusWeeks(weeks: Int64): JZonedDateTime; cdecl;
    function minusYears(years: Int64): JZonedDateTime; cdecl;
    function plus(amountToAdd: JTemporalAmount): JZonedDateTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JZonedDateTime; cdecl; overload;
    function plusDays(days: Int64): JZonedDateTime; cdecl;
    function plusHours(hours: Int64): JZonedDateTime; cdecl;
    function plusMinutes(minutes: Int64): JZonedDateTime; cdecl;
    function plusMonths(months: Int64): JZonedDateTime; cdecl;
    function plusNanos(nanos: Int64): JZonedDateTime; cdecl;
    function plusSeconds(seconds: Int64): JZonedDateTime; cdecl;
    function plusWeeks(weeks: Int64): JZonedDateTime; cdecl;
    function plusYears(years: Int64): JZonedDateTime; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toLocalDate: JLocalDate; cdecl;
    function toLocalDateTime: JLocalDateTime; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toOffsetDateTime: JOffsetDateTime; cdecl;
    function toString: JString; cdecl;
    function truncatedTo(unit_: JTemporalUnit): JZonedDateTime; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JZonedDateTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JZonedDateTime; cdecl; overload;
    function withDayOfMonth(dayOfMonth: Integer): JZonedDateTime; cdecl;
    function withDayOfYear(dayOfYear: Integer): JZonedDateTime; cdecl;
    function withEarlierOffsetAtOverlap: JZonedDateTime; cdecl;
    function withFixedOffsetZone: JZonedDateTime; cdecl;
    function withHour(hour: Integer): JZonedDateTime; cdecl;
    function withLaterOffsetAtOverlap: JZonedDateTime; cdecl;
    function withMinute(minute: Integer): JZonedDateTime; cdecl;
    function withMonth(month: Integer): JZonedDateTime; cdecl;
    function withNano(nanoOfSecond: Integer): JZonedDateTime; cdecl;
    function withSecond(second: Integer): JZonedDateTime; cdecl;
    function withYear(year: Integer): JZonedDateTime; cdecl;
    function withZoneSameInstant(zone: JZoneId): JZonedDateTime; cdecl;
    function withZoneSameLocal(zone: JZoneId): JZonedDateTime; cdecl;
  end;
  TJZonedDateTime = class(TJavaGenericImport<JZonedDateTimeClass, JZonedDateTime>) end;

  JAbstractChronologyClass = interface(JObjectClass)
    ['{0932F028-38D2-4B1D-B2C9-B0F327A1F95C}']
  end;

  [JavaSignature('java/time/chrono/AbstractChronology')]
  JAbstractChronology = interface(JObject)
    ['{19AB65DD-A526-4B9B-ADE3-46CE54059DF2}']
    function compareTo(other: JChronology): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function resolveDate(fieldValues: JMap; resolverStyle: JResolverStyle): JChronoLocalDate; cdecl;
    function toString: JString; cdecl;
  end;
  TJAbstractChronology = class(TJavaGenericImport<JAbstractChronologyClass, JAbstractChronology>) end;

  JChronoLocalDateClass = interface(JComparableClass)
    ['{74C058D3-6D21-49C4-82AF-FC7103251820}']
    {class} function from(temporal: JTemporalAccessor): JChronoLocalDate; cdecl;
    {class} function timeLineOrder: JComparator; cdecl;
  end;

  [JavaSignature('java/time/chrono/ChronoLocalDate')]
  JChronoLocalDate = interface(JComparable)
    ['{47BEFEF4-2F51-4213-8297-12AE37E35A37}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atTime(localTime: JLocalTime): JChronoLocalDateTime; cdecl;
    function compareTo(other: JChronoLocalDate): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function getChronology: JChronology; cdecl;
    function getEra: JEra; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JChronoLocalDate): Boolean; cdecl;
    function isBefore(other: JChronoLocalDate): Boolean; cdecl;
    function isEqual(other: JChronoLocalDate): Boolean; cdecl;
    function isLeapYear: Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function lengthOfMonth: Integer; cdecl;
    function lengthOfYear: Integer; cdecl;
    function minus(amount: JTemporalAmount): JChronoLocalDate; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JChronoLocalDate; cdecl; overload;
    function plus(amount: JTemporalAmount): JChronoLocalDate; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JChronoLocalDate; cdecl; overload;
    function query(query: JTemporalQuery): JObject; cdecl;
    function toEpochDay: Int64; cdecl;
    function toString: JString; cdecl;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl; overload;
    function &until(endDateExclusive: JChronoLocalDate): JChronoPeriod; cdecl; overload;
    function &with(adjuster: JTemporalAdjuster): JChronoLocalDate; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JChronoLocalDate; cdecl; overload;
  end;
  TJChronoLocalDate = class(TJavaGenericImport<JChronoLocalDateClass, JChronoLocalDate>) end;

  JChronoLocalDateTimeClass = interface(JComparableClass)
    ['{EEB50850-FAEA-4889-8B6A-68314F1F3987}']
    {class} function from(temporal: JTemporalAccessor): JChronoLocalDateTime; cdecl;
    {class} function timeLineOrder: JComparator; cdecl;
  end;

  [JavaSignature('java/time/chrono/ChronoLocalDateTime')]
  JChronoLocalDateTime = interface(JComparable)
    ['{E53A49C9-142A-4A5C-B61D-18DC861738A6}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function atZone(zone: JZoneId): JChronoZonedDateTime; cdecl;
    function compareTo(other: JChronoLocalDateTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function getChronology: JChronology; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JChronoLocalDateTime): Boolean; cdecl;
    function isBefore(other: JChronoLocalDateTime): Boolean; cdecl;
    function isEqual(other: JChronoLocalDateTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amount: JTemporalAmount): JChronoLocalDateTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JChronoLocalDateTime; cdecl; overload;
    function plus(amount: JTemporalAmount): JChronoLocalDateTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JChronoLocalDateTime; cdecl; overload;
    function query(query: JTemporalQuery): JObject; cdecl;
    function toEpochSecond(offset: JZoneOffset): Int64; cdecl;
    function toInstant(offset: JZoneOffset): JInstant; cdecl;
    function toLocalDate: JChronoLocalDate; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toString: JString; cdecl;
    function &with(adjuster: JTemporalAdjuster): JChronoLocalDateTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JChronoLocalDateTime; cdecl; overload;
  end;
  TJChronoLocalDateTime = class(TJavaGenericImport<JChronoLocalDateTimeClass, JChronoLocalDateTime>) end;

  JTemporalAmountClass = interface(IJavaClass)
    ['{6A70967E-6B81-4267-9285-0461B547C9C4}']
  end;

  [JavaSignature('java/time/temporal/TemporalAmount')]
  JTemporalAmount = interface(IJavaInstance)
    ['{DDF92685-8B5C-4752-846A-CED6398D7E27}']
    function addTo(temporal: JTemporal): JTemporal; cdecl;
    function &get(unit_: JTemporalUnit): Int64; cdecl;
    function getUnits: JList; cdecl;
    function subtractFrom(temporal: JTemporal): JTemporal; cdecl;
  end;
  TJTemporalAmount = class(TJavaGenericImport<JTemporalAmountClass, JTemporalAmount>) end;

  JChronoPeriodClass = interface(JTemporalAmountClass)
    ['{E0FA34AC-EFA9-4572-87D2-1EEEA5CE167F}']
    {class} function between(startDateInclusive: JChronoLocalDate; endDateExclusive: JChronoLocalDate): JChronoPeriod; cdecl;
  end;

  [JavaSignature('java/time/chrono/ChronoPeriod')]
  JChronoPeriod = interface(JTemporalAmount)
    ['{B4A47071-AFCC-4BD7-A8EA-A35ABBAC22B1}']
    function addTo(temporal: JTemporal): JTemporal; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function &get(unit_: JTemporalUnit): Int64; cdecl;
    function getChronology: JChronology; cdecl;
    function getUnits: JList; cdecl;
    function hashCode: Integer; cdecl;
    function isNegative: Boolean; cdecl;
    function isZero: Boolean; cdecl;
    function minus(amountToSubtract: JTemporalAmount): JChronoPeriod; cdecl;
    function multipliedBy(scalar: Integer): JChronoPeriod; cdecl;
    function negated: JChronoPeriod; cdecl;
    function normalized: JChronoPeriod; cdecl;
    function plus(amountToAdd: JTemporalAmount): JChronoPeriod; cdecl;
    function subtractFrom(temporal: JTemporal): JTemporal; cdecl;
    function toString: JString; cdecl;
  end;
  TJChronoPeriod = class(TJavaGenericImport<JChronoPeriodClass, JChronoPeriod>) end;

  JChronoZonedDateTimeClass = interface(JComparableClass)
    ['{059ABCFD-AB2D-4326-8103-85D2B7FEFBBE}']
    {class} function from(temporal: JTemporalAccessor): JChronoZonedDateTime; cdecl;
    {class} function timeLineOrder: JComparator; cdecl;
  end;

  [JavaSignature('java/time/chrono/ChronoZonedDateTime')]
  JChronoZonedDateTime = interface(JComparable)
    ['{6B6FFF58-A785-4D73-854F-BAEE4588EE5C}']
    function compareTo(other: JChronoZonedDateTime): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function format(formatter: JDateTimeFormatter): JString; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getChronology: JChronology; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getOffset: JZoneOffset; cdecl;
    function getZone: JZoneId; cdecl;
    function hashCode: Integer; cdecl;
    function isAfter(other: JChronoZonedDateTime): Boolean; cdecl;
    function isBefore(other: JChronoZonedDateTime): Boolean; cdecl;
    function isEqual(other: JChronoZonedDateTime): Boolean; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl; overload;
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl; overload;
    function minus(amount: JTemporalAmount): JChronoZonedDateTime; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JChronoZonedDateTime; cdecl; overload;
    function plus(amount: JTemporalAmount): JChronoZonedDateTime; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JChronoZonedDateTime; cdecl; overload;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
    function toEpochSecond: Int64; cdecl;
    function toInstant: JInstant; cdecl;
    function toLocalDate: JChronoLocalDate; cdecl;
    function toLocalDateTime: JChronoLocalDateTime; cdecl;
    function toLocalTime: JLocalTime; cdecl;
    function toString: JString; cdecl;
    function &with(adjuster: JTemporalAdjuster): JChronoZonedDateTime; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JChronoZonedDateTime; cdecl; overload;
    function withEarlierOffsetAtOverlap: JChronoZonedDateTime; cdecl;
    function withLaterOffsetAtOverlap: JChronoZonedDateTime; cdecl;
    function withZoneSameInstant(zone: JZoneId): JChronoZonedDateTime; cdecl;
    function withZoneSameLocal(zone: JZoneId): JChronoZonedDateTime; cdecl;
  end;
  TJChronoZonedDateTime = class(TJavaGenericImport<JChronoZonedDateTimeClass, JChronoZonedDateTime>) end;

  JChronologyClass = interface(JComparableClass)
    ['{D41BF08B-953F-4F20-BB9C-7C686ECA03C2}']
    {class} function from(temporal: JTemporalAccessor): JChronology; cdecl;
    {class} function getAvailableChronologies: JSet; cdecl;
    {class} function &of(id: JString): JChronology; cdecl;
    {class} function ofLocale(locale: JLocale): JChronology; cdecl;
  end;

  [JavaSignature('java/time/chrono/Chronology')]
  JChronology = interface(JComparable)
    ['{3946B1A9-D169-4894-948F-106B086F481E}']
    function compareTo(other: JChronology): Integer; cdecl;
    function date(era: JEra; yearOfEra: Integer; month: Integer; dayOfMonth: Integer): JChronoLocalDate; cdecl; overload;
    function date(prolepticYear: Integer; month: Integer; dayOfMonth: Integer): JChronoLocalDate; cdecl; overload;
    function date(temporal: JTemporalAccessor): JChronoLocalDate; cdecl; overload;
    function dateEpochDay(epochDay: Int64): JChronoLocalDate; cdecl;
    function dateNow: JChronoLocalDate; cdecl; overload;
    function dateNow(zone: JZoneId): JChronoLocalDate; cdecl; overload;
    function dateNow(clock: JClock): JChronoLocalDate; cdecl; overload;
    function dateYearDay(era: JEra; yearOfEra: Integer; dayOfYear: Integer): JChronoLocalDate; cdecl; overload;
    function dateYearDay(prolepticYear: Integer; dayOfYear: Integer): JChronoLocalDate; cdecl; overload;
    function equals(obj: JObject): Boolean; cdecl;
    function eraOf(eraValue: Integer): JEra; cdecl;
    function eras: JList; cdecl;
    function getCalendarType: JString; cdecl;
    function getDisplayName(style: JTextStyle; locale: JLocale): JString; cdecl;
    function getId: JString; cdecl;
    function hashCode: Integer; cdecl;
    function isLeapYear(prolepticYear: Int64): Boolean; cdecl;
    function localDateTime(temporal: JTemporalAccessor): JChronoLocalDateTime; cdecl;
    function period(years: Integer; months: Integer; days: Integer): JChronoPeriod; cdecl;
    function prolepticYear(era: JEra; yearOfEra: Integer): Integer; cdecl;
    function range(field: JChronoField): JValueRange; cdecl;
    function resolveDate(fieldValues: JMap; resolverStyle: JResolverStyle): JChronoLocalDate; cdecl;
    function toString: JString; cdecl;
    function zonedDateTime(temporal: JTemporalAccessor): JChronoZonedDateTime; cdecl; overload;
    function zonedDateTime(instant: JInstant; zone: JZoneId): JChronoZonedDateTime; cdecl; overload;
  end;
  TJChronology = class(TJavaGenericImport<JChronologyClass, JChronology>) end;

  JTemporalAccessorClass = interface(IJavaClass)
    ['{7B245385-F9E9-4B63-ACA8-F3F5D73F1C01}']
  end;

  [JavaSignature('java/time/temporal/TemporalAccessor')]
  JTemporalAccessor = interface(IJavaInstance)
    ['{0421DC83-A9DB-4889-87FC-7619678B99A4}']
    function &get(field: JTemporalField): Integer; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
  end;
  TJTemporalAccessor = class(TJavaGenericImport<JTemporalAccessorClass, JTemporalAccessor>) end;

  JEraClass = interface(JTemporalAccessorClass)
    ['{49E6F614-3CC8-41C1-9B71-CC2858002452}']
  end;

  [JavaSignature('java/time/chrono/Era')]
  JEra = interface(JTemporalAccessor)
    ['{0C3B0785-4DB1-433F-A813-ACF3B9E88462}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
    function &get(field: JTemporalField): Integer; cdecl;
    function getDisplayName(style: JTextStyle; locale: JLocale): JString; cdecl;
    function getLong(field: JTemporalField): Int64; cdecl;
    function getValue: Integer; cdecl;
    function isSupported(field: JTemporalField): Boolean; cdecl;
    function query(query: JTemporalQuery): JObject; cdecl;
    function range(field: JTemporalField): JValueRange; cdecl;
  end;
  TJEra = class(TJavaGenericImport<JEraClass, JEra>) end;

  JIsoChronologyClass = interface(JAbstractChronologyClass)
    ['{D90C5996-F97B-444C-B6F4-0A68D40A54DE}']
    {class} function _GetINSTANCE: JIsoChronology; cdecl;
    {class} property INSTANCE: JIsoChronology read _GetINSTANCE;
  end;

  [JavaSignature('java/time/chrono/IsoChronology')]
  JIsoChronology = interface(JAbstractChronology)
    ['{8EFD7590-60D2-41CA-AF0C-619649365169}']
    function date(era: JEra; yearOfEra: Integer; month: Integer; dayOfMonth: Integer): JLocalDate; cdecl; overload;
    function date(prolepticYear: Integer; month: Integer; dayOfMonth: Integer): JLocalDate; cdecl; overload;
    function date(temporal: JTemporalAccessor): JLocalDate; cdecl; overload;
    function dateEpochDay(epochDay: Int64): JLocalDate; cdecl;
    function dateNow: JLocalDate; cdecl; overload;
    function dateNow(zone: JZoneId): JLocalDate; cdecl; overload;
    function dateNow(clock: JClock): JLocalDate; cdecl; overload;
    function dateYearDay(era: JEra; yearOfEra: Integer; dayOfYear: Integer): JLocalDate; cdecl; overload;
    function dateYearDay(prolepticYear: Integer; dayOfYear: Integer): JLocalDate; cdecl; overload;
    function eraOf(eraValue: Integer): JIsoEra; cdecl;
    function eras: JList; cdecl;
    function getCalendarType: JString; cdecl;
    function getId: JString; cdecl;
    function isLeapYear(prolepticYear: Int64): Boolean; cdecl;
    function localDateTime(temporal: JTemporalAccessor): JLocalDateTime; cdecl;
    function period(years: Integer; months: Integer; days: Integer): JPeriod; cdecl;
    function prolepticYear(era: JEra; yearOfEra: Integer): Integer; cdecl;
    function range(field: JChronoField): JValueRange; cdecl;
    function resolveDate(fieldValues: JMap; resolverStyle: JResolverStyle): JLocalDate; cdecl;
    function zonedDateTime(temporal: JTemporalAccessor): JZonedDateTime; cdecl; overload;
    function zonedDateTime(instant: JInstant; zone: JZoneId): JZonedDateTime; cdecl; overload;
  end;
  TJIsoChronology = class(TJavaGenericImport<JIsoChronologyClass, JIsoChronology>) end;

  JIsoEraClass = interface(JEnumClass)
    ['{295EE426-29D7-4C76-97A2-B6EFFFCD3724}']
    {class} function _GetBCE: JIsoEra; cdecl;
    {class} function _GetCE: JIsoEra; cdecl;
    {class} function &of(isoEra: Integer): JIsoEra; cdecl;
    {class} function valueOf(name: JString): JIsoEra; cdecl;
    {class} function values: TJavaObjectArray<JIsoEra>; cdecl;
    {class} property BCE: JIsoEra read _GetBCE;
    {class} property CE: JIsoEra read _GetCE;
  end;

  [JavaSignature('java/time/chrono/IsoEra')]
  JIsoEra = interface(JEnum)
    ['{98E1F19A-BDE2-4211-AB25-DB7A6BDA8E9C}']
    function getValue: Integer; cdecl;
  end;
  TJIsoEra = class(TJavaGenericImport<JIsoEraClass, JIsoEra>) end;

  JDateTimeFormatterClass = interface(JObjectClass)
    ['{BDA56E1C-FD32-4DF9-B1A7-40F92547C095}']
    {class} function _GetBASIC_ISO_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_DATE_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_INSTANT: JDateTimeFormatter; cdecl;
    {class} function _GetISO_LOCAL_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_LOCAL_DATE_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_LOCAL_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_OFFSET_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_OFFSET_DATE_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_OFFSET_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_ORDINAL_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetISO_WEEK_DATE: JDateTimeFormatter; cdecl;
    {class} function _GetISO_ZONED_DATE_TIME: JDateTimeFormatter; cdecl;
    {class} function _GetRFC_1123_DATE_TIME: JDateTimeFormatter; cdecl;
    {class} function ofLocalizedDate(dateStyle: JFormatStyle): JDateTimeFormatter; cdecl;
    {class} function ofLocalizedDateTime(dateTimeStyle: JFormatStyle): JDateTimeFormatter; cdecl; overload;
    {class} function ofLocalizedDateTime(dateStyle: JFormatStyle; timeStyle: JFormatStyle): JDateTimeFormatter; cdecl; overload;
    {class} function ofLocalizedTime(timeStyle: JFormatStyle): JDateTimeFormatter; cdecl;
    {class} function ofPattern(pattern: JString): JDateTimeFormatter; cdecl; overload;
    {class} function ofPattern(pattern: JString; locale: JLocale): JDateTimeFormatter; cdecl; overload;
    {class} function parsedExcessDays: JTemporalQuery; cdecl;
    {class} function parsedLeapSecond: JTemporalQuery; cdecl;
    {class} property BASIC_ISO_DATE: JDateTimeFormatter read _GetBASIC_ISO_DATE;
    {class} property ISO_DATE: JDateTimeFormatter read _GetISO_DATE;
    {class} property ISO_DATE_TIME: JDateTimeFormatter read _GetISO_DATE_TIME;
    {class} property ISO_INSTANT: JDateTimeFormatter read _GetISO_INSTANT;
    {class} property ISO_LOCAL_DATE: JDateTimeFormatter read _GetISO_LOCAL_DATE;
    {class} property ISO_LOCAL_DATE_TIME: JDateTimeFormatter read _GetISO_LOCAL_DATE_TIME;
    {class} property ISO_LOCAL_TIME: JDateTimeFormatter read _GetISO_LOCAL_TIME;
    {class} property ISO_OFFSET_DATE: JDateTimeFormatter read _GetISO_OFFSET_DATE;
    {class} property ISO_OFFSET_DATE_TIME: JDateTimeFormatter read _GetISO_OFFSET_DATE_TIME;
    {class} property ISO_OFFSET_TIME: JDateTimeFormatter read _GetISO_OFFSET_TIME;
    {class} property ISO_ORDINAL_DATE: JDateTimeFormatter read _GetISO_ORDINAL_DATE;
    {class} property ISO_TIME: JDateTimeFormatter read _GetISO_TIME;
    {class} property ISO_WEEK_DATE: JDateTimeFormatter read _GetISO_WEEK_DATE;
    {class} property ISO_ZONED_DATE_TIME: JDateTimeFormatter read _GetISO_ZONED_DATE_TIME;
    {class} property RFC_1123_DATE_TIME: JDateTimeFormatter read _GetRFC_1123_DATE_TIME;
  end;

  [JavaSignature('java/time/format/DateTimeFormatter')]
  JDateTimeFormatter = interface(JObject)
    ['{29AA9616-FA0F-4373-B4CB-204FD3DA4A9A}']
    function format(temporal: JTemporalAccessor): JString; cdecl;
    procedure formatTo(temporal: JTemporalAccessor; appendable: JAppendable); cdecl;
    function getChronology: JChronology; cdecl;
    function getDecimalStyle: JDecimalStyle; cdecl;
    function getLocale: JLocale; cdecl;
    function getResolverFields: JSet; cdecl;
    function getResolverStyle: JResolverStyle; cdecl;
    function getZone: JZoneId; cdecl;
    function parse(text: JCharSequence): JTemporalAccessor; cdecl; overload;
    function parse(text: JCharSequence; position: JParsePosition): JTemporalAccessor; cdecl; overload;
    function parse(text: JCharSequence; query: JTemporalQuery): JObject; cdecl; overload;
    function parseUnresolved(text: JCharSequence; position: JParsePosition): JTemporalAccessor; cdecl;
    function toFormat: JFormat; cdecl; overload;
    function toFormat(parseQuery: JTemporalQuery): JFormat; cdecl; overload;
    function toString: JString; cdecl;
    function withChronology(chrono: JChronology): JDateTimeFormatter; cdecl;
    function withDecimalStyle(decimalStyle: JDecimalStyle): JDateTimeFormatter; cdecl;
    function withLocale(locale: JLocale): JDateTimeFormatter; cdecl;
    function withResolverFields(resolverFields: JSet): JDateTimeFormatter; cdecl; overload;
    function withResolverStyle(resolverStyle: JResolverStyle): JDateTimeFormatter; cdecl;
    function withZone(zone: JZoneId): JDateTimeFormatter; cdecl;
  end;
  TJDateTimeFormatter = class(TJavaGenericImport<JDateTimeFormatterClass, JDateTimeFormatter>) end;

  JDecimalStyleClass = interface(JObjectClass)
    ['{2DBE716F-960E-42FA-BB7E-45E620FD1600}']
    {class} function _GetSTANDARD: JDecimalStyle; cdecl;
    {class} function getAvailableLocales: JSet; cdecl;
    {class} function &of(locale: JLocale): JDecimalStyle; cdecl;
    {class} function ofDefaultLocale: JDecimalStyle; cdecl;
    {class} property STANDARD: JDecimalStyle read _GetSTANDARD;
  end;

  [JavaSignature('java/time/format/DecimalStyle')]
  JDecimalStyle = interface(JObject)
    ['{0E610382-E531-46E6-A94E-63D5FB74B0A8}']
    function equals(obj: JObject): Boolean; cdecl;
    function getDecimalSeparator: Char; cdecl;
    function getNegativeSign: Char; cdecl;
    function getPositiveSign: Char; cdecl;
    function getZeroDigit: Char; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    function withDecimalSeparator(decimalSeparator: Char): JDecimalStyle; cdecl;
    function withNegativeSign(negativeSign: Char): JDecimalStyle; cdecl;
    function withPositiveSign(positiveSign: Char): JDecimalStyle; cdecl;
    function withZeroDigit(zeroDigit: Char): JDecimalStyle; cdecl;
  end;
  TJDecimalStyle = class(TJavaGenericImport<JDecimalStyleClass, JDecimalStyle>) end;

  JFormatStyleClass = interface(JEnumClass)
    ['{A7C8A242-2E4C-46EA-A2F1-F3BE9FC0515D}']
    {class} function _GetFULL: JFormatStyle; cdecl;
    {class} function _GetLONG: JFormatStyle; cdecl;
    {class} function _GetMEDIUM: JFormatStyle; cdecl;
    {class} function _GetSHORT: JFormatStyle; cdecl;
    {class} function valueOf(name: JString): JFormatStyle; cdecl;
    {class} function values: TJavaObjectArray<JFormatStyle>; cdecl;
    {class} property FULL: JFormatStyle read _GetFULL;
    {class} property LONG: JFormatStyle read _GetLONG;
    {class} property MEDIUM: JFormatStyle read _GetMEDIUM;
    {class} property SHORT: JFormatStyle read _GetSHORT;
  end;

  [JavaSignature('java/time/format/FormatStyle')]
  JFormatStyle = interface(JEnum)
    ['{1BCCCF8B-F5EB-4F35-A2F3-80D3E394AF97}']
  end;
  TJFormatStyle = class(TJavaGenericImport<JFormatStyleClass, JFormatStyle>) end;

  JResolverStyleClass = interface(JEnumClass)
    ['{42EE3459-65A1-42AA-9056-CE171E9DDEDC}']
    {class} function _GetLENIENT: JResolverStyle; cdecl;
    {class} function _GetSMART: JResolverStyle; cdecl;
    {class} function _GetSTRICT: JResolverStyle; cdecl;
    {class} function valueOf(name: JString): JResolverStyle; cdecl;
    {class} function values: TJavaObjectArray<JResolverStyle>; cdecl;
    {class} property LENIENT: JResolverStyle read _GetLENIENT;
    {class} property SMART: JResolverStyle read _GetSMART;
    {class} property &STRICT: JResolverStyle read _GetSTRICT;
  end;

  [JavaSignature('java/time/format/ResolverStyle')]
  JResolverStyle = interface(JEnum)
    ['{DE009868-567F-4BEE-9989-3BC6BB0D8ABA}']
  end;
  TJResolverStyle = class(TJavaGenericImport<JResolverStyleClass, JResolverStyle>) end;

  JTextStyleClass = interface(JEnumClass)
    ['{10BE82A8-202D-46FB-A862-B1816144957F}']
    {class} function _GetFULL: JTextStyle; cdecl;
    {class} function _GetFULL_STANDALONE: JTextStyle; cdecl;
    {class} function _GetNARROW: JTextStyle; cdecl;
    {class} function _GetNARROW_STANDALONE: JTextStyle; cdecl;
    {class} function _GetSHORT: JTextStyle; cdecl;
    {class} function _GetSHORT_STANDALONE: JTextStyle; cdecl;
    {class} function valueOf(name: JString): JTextStyle; cdecl;
    {class} function values: TJavaObjectArray<JTextStyle>; cdecl;
    {class} property FULL: JTextStyle read _GetFULL;
    {class} property FULL_STANDALONE: JTextStyle read _GetFULL_STANDALONE;
    {class} property NARROW: JTextStyle read _GetNARROW;
    {class} property NARROW_STANDALONE: JTextStyle read _GetNARROW_STANDALONE;
    {class} property SHORT: JTextStyle read _GetSHORT;
    {class} property SHORT_STANDALONE: JTextStyle read _GetSHORT_STANDALONE;
  end;

  [JavaSignature('java/time/format/TextStyle')]
  JTextStyle = interface(JEnum)
    ['{2B53FE7D-A7FA-469F-B350-564E01F7B0D6}']
    function asNormal: JTextStyle; cdecl;
    function asStandalone: JTextStyle; cdecl;
    function isStandalone: Boolean; cdecl;
  end;
  TJTextStyle = class(TJavaGenericImport<JTextStyleClass, JTextStyle>) end;

  JChronoFieldClass = interface(JEnumClass)
    ['{2D0A63E7-F3FA-4D1A-A631-A3CF58CFA52C}']
    {class} function _GetALIGNED_DAY_OF_WEEK_IN_MONTH: JChronoField; cdecl;
    {class} function _GetALIGNED_DAY_OF_WEEK_IN_YEAR: JChronoField; cdecl;
    {class} function _GetALIGNED_WEEK_OF_MONTH: JChronoField; cdecl;
    {class} function _GetALIGNED_WEEK_OF_YEAR: JChronoField; cdecl;
    {class} function _GetAMPM_OF_DAY: JChronoField; cdecl;
    {class} function _GetCLOCK_HOUR_OF_AMPM: JChronoField; cdecl;
    {class} function _GetCLOCK_HOUR_OF_DAY: JChronoField; cdecl;
    {class} function _GetDAY_OF_MONTH: JChronoField; cdecl;
    {class} function _GetDAY_OF_WEEK: JChronoField; cdecl;
    {class} function _GetDAY_OF_YEAR: JChronoField; cdecl;
    {class} function _GetEPOCH_DAY: JChronoField; cdecl;
    {class} function _GetERA: JChronoField; cdecl;
    {class} function _GetHOUR_OF_AMPM: JChronoField; cdecl;
    {class} function _GetHOUR_OF_DAY: JChronoField; cdecl;
    {class} function _GetINSTANT_SECONDS: JChronoField; cdecl;
    {class} function _GetMICRO_OF_DAY: JChronoField; cdecl;
    {class} function _GetMICRO_OF_SECOND: JChronoField; cdecl;
    {class} function _GetMILLI_OF_DAY: JChronoField; cdecl;
    {class} function _GetMILLI_OF_SECOND: JChronoField; cdecl;
    {class} function _GetMINUTE_OF_DAY: JChronoField; cdecl;
    {class} function _GetMINUTE_OF_HOUR: JChronoField; cdecl;
    {class} function _GetMONTH_OF_YEAR: JChronoField; cdecl;
    {class} function _GetNANO_OF_DAY: JChronoField; cdecl;
    {class} function _GetNANO_OF_SECOND: JChronoField; cdecl;
    {class} function _GetOFFSET_SECONDS: JChronoField; cdecl;
    {class} function _GetPROLEPTIC_MONTH: JChronoField; cdecl;
    {class} function _GetSECOND_OF_DAY: JChronoField; cdecl;
    {class} function _GetSECOND_OF_MINUTE: JChronoField; cdecl;
    {class} function _GetYEAR: JChronoField; cdecl;
    {class} function _GetYEAR_OF_ERA: JChronoField; cdecl;
    {class} function valueOf(name: JString): JChronoField; cdecl;
    {class} function values: TJavaObjectArray<JChronoField>; cdecl;
    {class} property ALIGNED_DAY_OF_WEEK_IN_MONTH: JChronoField read _GetALIGNED_DAY_OF_WEEK_IN_MONTH;
    {class} property ALIGNED_DAY_OF_WEEK_IN_YEAR: JChronoField read _GetALIGNED_DAY_OF_WEEK_IN_YEAR;
    {class} property ALIGNED_WEEK_OF_MONTH: JChronoField read _GetALIGNED_WEEK_OF_MONTH;
    {class} property ALIGNED_WEEK_OF_YEAR: JChronoField read _GetALIGNED_WEEK_OF_YEAR;
    {class} property AMPM_OF_DAY: JChronoField read _GetAMPM_OF_DAY;
    {class} property CLOCK_HOUR_OF_AMPM: JChronoField read _GetCLOCK_HOUR_OF_AMPM;
    {class} property CLOCK_HOUR_OF_DAY: JChronoField read _GetCLOCK_HOUR_OF_DAY;
    {class} property DAY_OF_MONTH: JChronoField read _GetDAY_OF_MONTH;
    {class} property DAY_OF_WEEK: JChronoField read _GetDAY_OF_WEEK;
    {class} property DAY_OF_YEAR: JChronoField read _GetDAY_OF_YEAR;
    {class} property EPOCH_DAY: JChronoField read _GetEPOCH_DAY;
    {class} property ERA: JChronoField read _GetERA;
    {class} property HOUR_OF_AMPM: JChronoField read _GetHOUR_OF_AMPM;
    {class} property HOUR_OF_DAY: JChronoField read _GetHOUR_OF_DAY;
    {class} property INSTANT_SECONDS: JChronoField read _GetINSTANT_SECONDS;
    {class} property MICRO_OF_DAY: JChronoField read _GetMICRO_OF_DAY;
    {class} property MICRO_OF_SECOND: JChronoField read _GetMICRO_OF_SECOND;
    {class} property MILLI_OF_DAY: JChronoField read _GetMILLI_OF_DAY;
    {class} property MILLI_OF_SECOND: JChronoField read _GetMILLI_OF_SECOND;
    {class} property MINUTE_OF_DAY: JChronoField read _GetMINUTE_OF_DAY;
    {class} property MINUTE_OF_HOUR: JChronoField read _GetMINUTE_OF_HOUR;
    {class} property MONTH_OF_YEAR: JChronoField read _GetMONTH_OF_YEAR;
    {class} property NANO_OF_DAY: JChronoField read _GetNANO_OF_DAY;
    {class} property NANO_OF_SECOND: JChronoField read _GetNANO_OF_SECOND;
    {class} property OFFSET_SECONDS: JChronoField read _GetOFFSET_SECONDS;
    {class} property PROLEPTIC_MONTH: JChronoField read _GetPROLEPTIC_MONTH;
    {class} property SECOND_OF_DAY: JChronoField read _GetSECOND_OF_DAY;
    {class} property SECOND_OF_MINUTE: JChronoField read _GetSECOND_OF_MINUTE;
    {class} property YEAR: JChronoField read _GetYEAR;
    {class} property YEAR_OF_ERA: JChronoField read _GetYEAR_OF_ERA;
  end;

  [JavaSignature('java/time/temporal/ChronoField')]
  JChronoField = interface(JEnum)
    ['{15F403B8-5EA9-4D3D-BC93-D67416D8959C}']
    function adjustInto(temporal: JTemporal; newValue: Int64): JTemporal; cdecl;
    function checkValidIntValue(value: Int64): Integer; cdecl;
    function checkValidValue(value: Int64): Int64; cdecl;
    function getBaseUnit: JTemporalUnit; cdecl;
    function getDisplayName(locale: JLocale): JString; cdecl;
    function getFrom(temporal: JTemporalAccessor): Int64; cdecl;
    function getRangeUnit: JTemporalUnit; cdecl;
    function isDateBased: Boolean; cdecl;
    function isSupportedBy(temporal: JTemporalAccessor): Boolean; cdecl;
    function isTimeBased: Boolean; cdecl;
    function range: JValueRange; cdecl;
    function rangeRefinedBy(temporal: JTemporalAccessor): JValueRange; cdecl;
    function toString: JString; cdecl;
  end;
  TJChronoField = class(TJavaGenericImport<JChronoFieldClass, JChronoField>) end;

  JTemporalClass = interface(JTemporalAccessorClass)
    ['{1A85325F-BD90-4A29-899B-AC0BA01DB983}']
  end;

  [JavaSignature('java/time/temporal/Temporal')]
  JTemporal = interface(JTemporalAccessor)
    ['{FA7289DB-4B0A-4A73-AEBD-B13E9C4D21CE}']
    function isSupported(unit_: JTemporalUnit): Boolean; cdecl;
    function minus(amount: JTemporalAmount): JTemporal; cdecl; overload;
    function minus(amountToSubtract: Int64; unit_: JTemporalUnit): JTemporal; cdecl; overload;
    function plus(amount: JTemporalAmount): JTemporal; cdecl; overload;
    function plus(amountToAdd: Int64; unit_: JTemporalUnit): JTemporal; cdecl; overload;
    function &until(endExclusive: JTemporal; unit_: JTemporalUnit): Int64; cdecl;
    function &with(adjuster: JTemporalAdjuster): JTemporal; cdecl; overload;
    function &with(field: JTemporalField; newValue: Int64): JTemporal; cdecl; overload;
  end;
  TJTemporal = class(TJavaGenericImport<JTemporalClass, JTemporal>) end;

  JTemporalAdjusterClass = interface(IJavaClass)
    ['{42C7C64D-5B6C-49F6-8F0B-F3AF5F4C4331}']
  end;

  [JavaSignature('java/time/temporal/TemporalAdjuster')]
  JTemporalAdjuster = interface(IJavaInstance)
    ['{18310EBC-FF7E-4FDC-8F75-D3DA123BC7D2}']
    function adjustInto(temporal: JTemporal): JTemporal; cdecl;
  end;
  TJTemporalAdjuster = class(TJavaGenericImport<JTemporalAdjusterClass, JTemporalAdjuster>) end;

  JTemporalFieldClass = interface(IJavaClass)
    ['{CA4D3C6A-588D-46E5-9AF4-7F57D2BB9FDB}']
  end;

  [JavaSignature('java/time/temporal/TemporalField')]
  JTemporalField = interface(IJavaInstance)
    ['{EDAAA04C-7379-4F5F-9BF1-1BF06BF642A0}']
    function adjustInto(temporal: JTemporal; newValue: Int64): JTemporal; cdecl;
    function getBaseUnit: JTemporalUnit; cdecl;
    function getDisplayName(locale: JLocale): JString; cdecl;
    function getFrom(temporal: JTemporalAccessor): Int64; cdecl;
    function getRangeUnit: JTemporalUnit; cdecl;
    function isDateBased: Boolean; cdecl;
    function isSupportedBy(temporal: JTemporalAccessor): Boolean; cdecl;
    function isTimeBased: Boolean; cdecl;
    function range: JValueRange; cdecl;
    function rangeRefinedBy(temporal: JTemporalAccessor): JValueRange; cdecl;
    function resolve(fieldValues: JMap; partialTemporal: JTemporalAccessor; resolverStyle: JResolverStyle): JTemporalAccessor; cdecl;
    function toString: JString; cdecl;
  end;
  TJTemporalField = class(TJavaGenericImport<JTemporalFieldClass, JTemporalField>) end;

  JTemporalQueryClass = interface(IJavaClass)
    ['{BD6D88B5-B213-4B55-B715-57B2A14CC328}']
  end;

  [JavaSignature('java/time/temporal/TemporalQuery')]
  JTemporalQuery = interface(IJavaInstance)
    ['{9CA1A58F-9DE4-44FE-AC9A-9775BB389F8C}']
    function queryFrom(temporal: JTemporalAccessor): JObject; cdecl;
  end;
  TJTemporalQuery = class(TJavaGenericImport<JTemporalQueryClass, JTemporalQuery>) end;

  JTemporalUnitClass = interface(IJavaClass)
    ['{FF9EA5BA-C5A7-4F46-9553-AEFA88FBEC35}']
  end;

  [JavaSignature('java/time/temporal/TemporalUnit')]
  JTemporalUnit = interface(IJavaInstance)
    ['{A356B0F1-6D31-44D1-95DA-C34E7526017F}']
    function addTo(temporal: JTemporal; amount: Int64): JTemporal; cdecl;
    function between(temporal1Inclusive: JTemporal; temporal2Exclusive: JTemporal): Int64; cdecl;
    function getDuration: Jtime_Duration; cdecl;
    function isDateBased: Boolean; cdecl;
    function isDurationEstimated: Boolean; cdecl;
    function isSupportedBy(temporal: JTemporal): Boolean; cdecl;
    function isTimeBased: Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJTemporalUnit = class(TJavaGenericImport<JTemporalUnitClass, JTemporalUnit>) end;

  JValueRangeClass = interface(JObjectClass)
    ['{394447EA-BF26-4286-8B15-13702C680670}']
    {class} function &of(min: Int64; max: Int64): JValueRange; cdecl; overload;
    {class} function &of(min: Int64; maxSmallest: Int64; maxLargest: Int64): JValueRange; cdecl; overload;
    {class} function &of(minSmallest: Int64; minLargest: Int64; maxSmallest: Int64; maxLargest: Int64): JValueRange; cdecl; overload;
  end;

  [JavaSignature('java/time/temporal/ValueRange')]
  JValueRange = interface(JObject)
    ['{C7045356-666D-484E-AA4F-062E90BFFB90}']
    function checkValidIntValue(value: Int64; field: JTemporalField): Integer; cdecl;
    function checkValidValue(value: Int64; field: JTemporalField): Int64; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getLargestMinimum: Int64; cdecl;
    function getMaximum: Int64; cdecl;
    function getMinimum: Int64; cdecl;
    function getSmallestMaximum: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function isFixed: Boolean; cdecl;
    function isIntValue: Boolean; cdecl;
    function isValidIntValue(value: Int64): Boolean; cdecl;
    function isValidValue(value: Int64): Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJValueRange = class(TJavaGenericImport<JValueRangeClass, JValueRange>) end;

  JZoneOffsetTransitionClass = interface(JObjectClass)
    ['{77618F07-7EEB-47C8-A607-0704A9B4FE15}']
    {class} function &of(transition: JLocalDateTime; offsetBefore: JZoneOffset; offsetAfter: JZoneOffset): JZoneOffsetTransition; cdecl;
  end;

  [JavaSignature('java/time/zone/ZoneOffsetTransition')]
  JZoneOffsetTransition = interface(JObject)
    ['{5E5D6A97-CC73-4FBB-BBEB-91B24D00E155}']
    function compareTo(transition: JZoneOffsetTransition): Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function getDateTimeAfter: JLocalDateTime; cdecl;
    function getDateTimeBefore: JLocalDateTime; cdecl;
    function getDuration: Jtime_Duration; cdecl;
    function getInstant: JInstant; cdecl;
    function getOffsetAfter: JZoneOffset; cdecl;
    function getOffsetBefore: JZoneOffset; cdecl;
    function hashCode: Integer; cdecl;
    function isGap: Boolean; cdecl;
    function isOverlap: Boolean; cdecl;
    function isValidOffset(offset: JZoneOffset): Boolean; cdecl;
    function toEpochSecond: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJZoneOffsetTransition = class(TJavaGenericImport<JZoneOffsetTransitionClass, JZoneOffsetTransition>) end;

  JZoneRulesClass = interface(JObjectClass)
    ['{394567D5-7531-4461-8DCA-34FFFA25091D}']
    {class} function &of(baseStandardOffset: JZoneOffset; baseWallOffset: JZoneOffset; standardOffsetTransitionList: JList; transitionList: JList; lastRules: JList): JZoneRules; cdecl; overload;
    {class} function &of(offset: JZoneOffset): JZoneRules; cdecl; overload;
  end;

  [JavaSignature('java/time/zone/ZoneRules')]
  JZoneRules = interface(JObject)
    ['{CC6C75EB-7BEF-465F-A492-BE172FA7AF28}']
    function equals(otherRules: JObject): Boolean; cdecl;
    function getDaylightSavings(instant: JInstant): Jtime_Duration; cdecl;
    function getOffset(instant: JInstant): JZoneOffset; cdecl; overload;
    function getOffset(localDateTime: JLocalDateTime): JZoneOffset; cdecl; overload;
    function getStandardOffset(instant: JInstant): JZoneOffset; cdecl;
    function getTransition(localDateTime: JLocalDateTime): JZoneOffsetTransition; cdecl;
    function getTransitionRules: JList; cdecl;
    function getTransitions: JList; cdecl;
    function getValidOffsets(localDateTime: JLocalDateTime): JList; cdecl;
    function hashCode: Integer; cdecl;
    function isDaylightSavings(instant: JInstant): Boolean; cdecl;
    function isFixedOffset: Boolean; cdecl;
    function isValidOffset(localDateTime: JLocalDateTime; offset: JZoneOffset): Boolean; cdecl;
    function nextTransition(instant: JInstant): JZoneOffsetTransition; cdecl;
    function previousTransition(instant: JInstant): JZoneOffsetTransition; cdecl;
    function toString: JString; cdecl;
  end;
  TJZoneRules = class(TJavaGenericImport<JZoneRulesClass, JZoneRules>) end;

  JAbstractCollectionClass = interface(JObjectClass)
    ['{27541496-F538-45DB-BFC7-9ED05E5680C3}']
  end;

  [JavaSignature('java/util/AbstractCollection')]
  JAbstractCollection = interface(JObject)
    ['{4A5BA15A-2B07-4768-AA91-4BA9C93882C1}']
    function add(e: JObject): Boolean; cdecl;
    function addAll(c: JCollection): Boolean; cdecl;
    procedure clear; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function containsAll(c: JCollection): Boolean; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function remove(o: JObject): Boolean; cdecl;
    function removeAll(c: JCollection): Boolean; cdecl;
    function retainAll(c: JCollection): Boolean; cdecl;
    function size: Integer; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(a: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
    function toString: JString; cdecl;
  end;
  TJAbstractCollection = class(TJavaGenericImport<JAbstractCollectionClass, JAbstractCollection>) end;

  JAbstractListClass = interface(JAbstractCollectionClass)
    ['{4495F751-BABA-4349-8D4B-997761ED3876}']
  end;

  [JavaSignature('java/util/AbstractList')]
  JAbstractList = interface(JAbstractCollection)
    ['{2E98325B-7293-4E06-A775-240FDD287E27}']
    function add(e: JObject): Boolean; cdecl; overload;
    procedure add(index: Integer; element: JObject); cdecl; overload;
    function addAll(index: Integer; c: JCollection): Boolean; cdecl;
    procedure clear; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function &get(index: Integer): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function indexOf(o: JObject): Integer; cdecl;
    function iterator: JIterator; cdecl;
    function lastIndexOf(o: JObject): Integer; cdecl;
    function listIterator: JListIterator; cdecl; overload;
    function listIterator(index: Integer): JListIterator; cdecl; overload;
    function remove(index: Integer): JObject; cdecl;
    function &set(index: Integer; element: JObject): JObject; cdecl;
    function subList(fromIndex: Integer; toIndex: Integer): JList; cdecl;
  end;
  TJAbstractList = class(TJavaGenericImport<JAbstractListClass, JAbstractList>) end;

  JAbstractMapClass = interface(JObjectClass)
    ['{05119E45-9501-4270-B2BB-EE7E314695CB}']
  end;

  [JavaSignature('java/util/AbstractMap')]
  JAbstractMap = interface(JObject)
    ['{63FD2094-7BFB-41B4-AED8-F781B97F6EB6}']
    procedure clear; cdecl;
    function containsKey(key: JObject): Boolean; cdecl;
    function containsValue(value: JObject): Boolean; cdecl;
    function entrySet: JSet; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function &get(key: JObject): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function keySet: JSet; cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    procedure putAll(m: JMap); cdecl;
    function remove(key: JObject): JObject; cdecl;
    function size: Integer; cdecl;
    function toString: JString; cdecl;
    function values: JCollection; cdecl;
  end;
  TJAbstractMap = class(TJavaGenericImport<JAbstractMapClass, JAbstractMap>) end;

  JAbstractSetClass = interface(JAbstractCollectionClass)
    ['{C8EA147C-D0DB-4E27-B8B5-77A04711A2F3}']
  end;

  [JavaSignature('java/util/AbstractSet')]
  JAbstractSet = interface(JAbstractCollection)
    ['{A520B68E-843E-46B8-BBB3-1A40DE9E92CE}']
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function removeAll(c: JCollection): Boolean; cdecl;
  end;
  TJAbstractSet = class(TJavaGenericImport<JAbstractSetClass, JAbstractSet>) end;

  JArrayListClass = interface(JAbstractListClass)
    ['{0CC7FC88-8B13-4F0A-9635-26FEEED49F94}']
    {class} function init(initialCapacity: Integer): JArrayList; cdecl; overload;
    {class} function init: JArrayList; cdecl; overload;
    {class} function init(c: JCollection): JArrayList; cdecl; overload;
  end;

  [JavaSignature('java/util/ArrayList')]
  JArrayList = interface(JAbstractList)
    ['{B1D54E97-F848-4301-BA5B-F32921164AFA}']
    function add(e: JObject): Boolean; cdecl; overload;
    procedure add(index: Integer; element: JObject); cdecl; overload;
    function addAll(c: JCollection): Boolean; cdecl; overload;
    function addAll(index: Integer; c: JCollection): Boolean; cdecl; overload;
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    procedure ensureCapacity(minCapacity: Integer); cdecl;
    procedure forEach(action: JConsumer); cdecl;
    function &get(index: Integer): JObject; cdecl;
    function indexOf(o: JObject): Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function lastIndexOf(o: JObject): Integer; cdecl;
    function listIterator(index: Integer): JListIterator; cdecl; overload;
    function listIterator: JListIterator; cdecl; overload;
    function remove(index: Integer): JObject; cdecl; overload;
    function remove(o: JObject): Boolean; cdecl; overload;
    function removeAll(c: JCollection): Boolean; cdecl;
    function removeIf(filter: Jfunction_Predicate): Boolean; cdecl;
    procedure replaceAll(operator: JUnaryOperator); cdecl;
    function retainAll(c: JCollection): Boolean; cdecl;
    function &set(index: Integer; element: JObject): JObject; cdecl;
    function size: Integer; cdecl;
    procedure sort(c: JComparator); cdecl;
    function spliterator: JSpliterator; cdecl;
    function subList(fromIndex: Integer; toIndex: Integer): JList; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(a: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
    procedure trimToSize; cdecl;
  end;
  TJArrayList = class(TJavaGenericImport<JArrayListClass, JArrayList>) end;

  JBitSetClass = interface(JObjectClass)
    ['{1CB74061-9B52-4CCA-AB29-D87B5EE10BCB}']
    {class} function init: JBitSet; cdecl; overload;
    {class} function init(nbits: Integer): JBitSet; cdecl; overload;
    {class} function valueOf(longs: TJavaArray<Int64>): JBitSet; cdecl; overload;
    {class} function valueOf(lb: JLongBuffer): JBitSet; cdecl; overload;
    {class} function valueOf(bytes: TJavaArray<Byte>): JBitSet; cdecl; overload;
    {class} function valueOf(bb: JByteBuffer): JBitSet; cdecl; overload;
  end;

  [JavaSignature('java/util/BitSet')]
  JBitSet = interface(JObject)
    ['{2FBDF9C9-FEEE-4377-B2A2-D557CF0BEC31}']
    procedure &and(set_: JBitSet); cdecl;
    procedure andNot(set_: JBitSet); cdecl;
    function cardinality: Integer; cdecl;
    procedure clear(bitIndex: Integer); cdecl; overload;
    procedure clear(fromIndex: Integer; toIndex: Integer); cdecl; overload;
    procedure clear; cdecl; overload;
    function clone: JObject; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    procedure flip(bitIndex: Integer); cdecl; overload;
    procedure flip(fromIndex: Integer; toIndex: Integer); cdecl; overload;
    function &get(bitIndex: Integer): Boolean; cdecl; overload;
    function &get(fromIndex: Integer; toIndex: Integer): JBitSet; cdecl; overload;
    function hashCode: Integer; cdecl;
    function intersects(set_: JBitSet): Boolean; cdecl;
    function isEmpty: Boolean; cdecl;
    function length: Integer; cdecl;
    function nextClearBit(fromIndex: Integer): Integer; cdecl;
    function nextSetBit(fromIndex: Integer): Integer; cdecl;
    procedure &or(set_: JBitSet); cdecl;
    function previousClearBit(fromIndex: Integer): Integer; cdecl;
    function previousSetBit(fromIndex: Integer): Integer; cdecl;
    procedure &set(bitIndex: Integer); cdecl; overload;
    procedure &set(bitIndex: Integer; value: Boolean); cdecl; overload;
    procedure &set(fromIndex: Integer; toIndex: Integer); cdecl; overload;
    procedure &set(fromIndex: Integer; toIndex: Integer; value: Boolean); cdecl; overload;
    function size: Integer; cdecl;
    function stream: JIntStream; cdecl;
    function toByteArray: TJavaArray<Byte>; cdecl;
    function toLongArray: TJavaArray<Int64>; cdecl;
    function toString: JString; cdecl;
    procedure &xor(set_: JBitSet); cdecl;
  end;
  TJBitSet = class(TJavaGenericImport<JBitSetClass, JBitSet>) end;

  JCalendarClass = interface(JObjectClass)
    ['{51237FAA-7CDF-4E7E-9AE8-282DC2A930A1}']
    {class} function _GetALL_STYLES: Integer; cdecl;
    {class} function _GetAM: Integer; cdecl;
    {class} function _GetAM_PM: Integer; cdecl;
    {class} function _GetAPRIL: Integer; cdecl;
    {class} function _GetAUGUST: Integer; cdecl;
    {class} function _GetDATE: Integer; cdecl;
    {class} function _GetDAY_OF_MONTH: Integer; cdecl;
    {class} function _GetDAY_OF_WEEK: Integer; cdecl;
    {class} function _GetDAY_OF_WEEK_IN_MONTH: Integer; cdecl;
    {class} function _GetDAY_OF_YEAR: Integer; cdecl;
    {class} function _GetDECEMBER: Integer; cdecl;
    {class} function _GetDST_OFFSET: Integer; cdecl;
    {class} function _GetERA: Integer; cdecl;
    {class} function _GetFEBRUARY: Integer; cdecl;
    {class} function _GetFIELD_COUNT: Integer; cdecl;
    {class} function _GetFRIDAY: Integer; cdecl;
    {class} function _GetHOUR: Integer; cdecl;
    {class} function _GetHOUR_OF_DAY: Integer; cdecl;
    {class} function _GetJANUARY: Integer; cdecl;
    {class} function _GetJULY: Integer; cdecl;
    {class} function _GetJUNE: Integer; cdecl;
    {class} function _GetLONG: Integer; cdecl;
    {class} function _GetLONG_FORMAT: Integer; cdecl;
    {class} function _GetLONG_STANDALONE: Integer; cdecl;
    {class} function _GetMARCH: Integer; cdecl;
    {class} function _GetMAY: Integer; cdecl;
    {class} function _GetMILLISECOND: Integer; cdecl;
    {class} function _GetMINUTE: Integer; cdecl;
    {class} function _GetMONDAY: Integer; cdecl;
    {class} function _GetMONTH: Integer; cdecl;
    {class} function _GetNARROW_FORMAT: Integer; cdecl;
    {class} function _GetNARROW_STANDALONE: Integer; cdecl;
    {class} function _GetNOVEMBER: Integer; cdecl;
    {class} function _GetOCTOBER: Integer; cdecl;
    {class} function _GetPM: Integer; cdecl;
    {class} function _GetSATURDAY: Integer; cdecl;
    {class} function _GetSECOND: Integer; cdecl;
    {class} function _GetSEPTEMBER: Integer; cdecl;
    {class} function _GetSHORT: Integer; cdecl;
    {class} function _GetSHORT_FORMAT: Integer; cdecl;
    {class} function _GetSHORT_STANDALONE: Integer; cdecl;
    {class} function _GetSUNDAY: Integer; cdecl;
    {class} function _GetTHURSDAY: Integer; cdecl;
    {class} function _GetTUESDAY: Integer; cdecl;
    {class} function _GetUNDECIMBER: Integer; cdecl;
    {class} function _GetWEDNESDAY: Integer; cdecl;
    {class} function _GetWEEK_OF_MONTH: Integer; cdecl;
    {class} function _GetWEEK_OF_YEAR: Integer; cdecl;
    {class} function _GetYEAR: Integer; cdecl;
    {class} function _GetZONE_OFFSET: Integer; cdecl;
    {class} function getAvailableCalendarTypes: JSet; cdecl;
    {class} function getAvailableLocales: TJavaObjectArray<JLocale>; cdecl;
    {class} function getInstance: JCalendar; cdecl; overload;
    {class} function getInstance(zone: JTimeZone): JCalendar; cdecl; overload;
    {class} function getInstance(aLocale: JLocale): JCalendar; cdecl; overload;
    {class} function getInstance(zone: JTimeZone; aLocale: JLocale): JCalendar; cdecl; overload;
    {class} property ALL_STYLES: Integer read _GetALL_STYLES;
    {class} property AM: Integer read _GetAM;
    {class} property AM_PM: Integer read _GetAM_PM;
    {class} property APRIL: Integer read _GetAPRIL;
    {class} property AUGUST: Integer read _GetAUGUST;
    {class} property DATE: Integer read _GetDATE;
    {class} property DAY_OF_MONTH: Integer read _GetDAY_OF_MONTH;
    {class} property DAY_OF_WEEK: Integer read _GetDAY_OF_WEEK;
    {class} property DAY_OF_WEEK_IN_MONTH: Integer read _GetDAY_OF_WEEK_IN_MONTH;
    {class} property DAY_OF_YEAR: Integer read _GetDAY_OF_YEAR;
    {class} property DECEMBER: Integer read _GetDECEMBER;
    {class} property DST_OFFSET: Integer read _GetDST_OFFSET;
    {class} property ERA: Integer read _GetERA;
    {class} property FEBRUARY: Integer read _GetFEBRUARY;
    {class} property FIELD_COUNT: Integer read _GetFIELD_COUNT;
    {class} property FRIDAY: Integer read _GetFRIDAY;
    {class} property HOUR: Integer read _GetHOUR;
    {class} property HOUR_OF_DAY: Integer read _GetHOUR_OF_DAY;
    {class} property JANUARY: Integer read _GetJANUARY;
    {class} property JULY: Integer read _GetJULY;
    {class} property JUNE: Integer read _GetJUNE;
    {class} property LONG: Integer read _GetLONG;
    {class} property LONG_FORMAT: Integer read _GetLONG_FORMAT;
    {class} property LONG_STANDALONE: Integer read _GetLONG_STANDALONE;
    {class} property MARCH: Integer read _GetMARCH;
    {class} property MAY: Integer read _GetMAY;
    {class} property MILLISECOND: Integer read _GetMILLISECOND;
    {class} property MINUTE: Integer read _GetMINUTE;
    {class} property MONDAY: Integer read _GetMONDAY;
    {class} property MONTH: Integer read _GetMONTH;
    {class} property NARROW_FORMAT: Integer read _GetNARROW_FORMAT;
    {class} property NARROW_STANDALONE: Integer read _GetNARROW_STANDALONE;
    {class} property NOVEMBER: Integer read _GetNOVEMBER;
    {class} property OCTOBER: Integer read _GetOCTOBER;
    {class} property PM: Integer read _GetPM;
    {class} property SATURDAY: Integer read _GetSATURDAY;
    {class} property SECOND: Integer read _GetSECOND;
    {class} property SEPTEMBER: Integer read _GetSEPTEMBER;
    {class} property SHORT: Integer read _GetSHORT;
    {class} property SHORT_FORMAT: Integer read _GetSHORT_FORMAT;
    {class} property SHORT_STANDALONE: Integer read _GetSHORT_STANDALONE;
    {class} property SUNDAY: Integer read _GetSUNDAY;
    {class} property THURSDAY: Integer read _GetTHURSDAY;
    {class} property TUESDAY: Integer read _GetTUESDAY;
    {class} property UNDECIMBER: Integer read _GetUNDECIMBER;
    {class} property WEDNESDAY: Integer read _GetWEDNESDAY;
    {class} property WEEK_OF_MONTH: Integer read _GetWEEK_OF_MONTH;
    {class} property WEEK_OF_YEAR: Integer read _GetWEEK_OF_YEAR;
    {class} property YEAR: Integer read _GetYEAR;
    {class} property ZONE_OFFSET: Integer read _GetZONE_OFFSET;
  end;

  [JavaSignature('java/util/Calendar')]
  JCalendar = interface(JObject)
    ['{2C0409E5-97A4-47CA-9E75-6ACB1CA4515E}']
    procedure add(field: Integer; amount: Integer); cdecl;
    function after(when: JObject): Boolean; cdecl;
    function before(when: JObject): Boolean; cdecl;
    procedure clear; cdecl; overload;
    procedure clear(field: Integer); cdecl; overload;
    function clone: JObject; cdecl;
    function compareTo(anotherCalendar: JCalendar): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function &get(field: Integer): Integer; cdecl;
    function getActualMaximum(field: Integer): Integer; cdecl;
    function getActualMinimum(field: Integer): Integer; cdecl;
    function getCalendarType: JString; cdecl;
    function getDisplayName(field: Integer; style: Integer; locale: JLocale): JString; cdecl;
    function getDisplayNames(field: Integer; style: Integer; locale: JLocale): JMap; cdecl;
    function getFirstDayOfWeek: Integer; cdecl;
    function getGreatestMinimum(field: Integer): Integer; cdecl;
    function getLeastMaximum(field: Integer): Integer; cdecl;
    function getMaximum(field: Integer): Integer; cdecl;
    function getMinimalDaysInFirstWeek: Integer; cdecl;
    function getMinimum(field: Integer): Integer; cdecl;
    function getTime: JDate; cdecl;
    function getTimeInMillis: Int64; cdecl;
    function getTimeZone: JTimeZone; cdecl;
    function getWeekYear: Integer; cdecl;
    function getWeeksInWeekYear: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isLenient: Boolean; cdecl;
    function isSet(field: Integer): Boolean; cdecl;
    function isWeekDateSupported: Boolean; cdecl;
    procedure roll(field: Integer; up: Boolean); cdecl; overload;
    procedure roll(field: Integer; amount: Integer); cdecl; overload;
    procedure &set(field: Integer; value: Integer); cdecl; overload;
    procedure &set(year: Integer; month: Integer; date: Integer); cdecl; overload;
    procedure &set(year: Integer; month: Integer; date: Integer; hourOfDay: Integer; minute: Integer); cdecl; overload;
    procedure &set(year: Integer; month: Integer; date: Integer; hourOfDay: Integer; minute: Integer; second: Integer); cdecl; overload;
    procedure setFirstDayOfWeek(value: Integer); cdecl;
    procedure setLenient(lenient: Boolean); cdecl;
    procedure setMinimalDaysInFirstWeek(value: Integer); cdecl;
    procedure setTime(date: JDate); cdecl;
    procedure setTimeInMillis(millis: Int64); cdecl;
    procedure setTimeZone(value: JTimeZone); cdecl;
    procedure setWeekDate(weekYear: Integer; weekOfYear: Integer; dayOfWeek: Integer); cdecl;
    function toInstant: JInstant; cdecl;
    function toString: JString; cdecl;
  end;
  TJCalendar = class(TJavaGenericImport<JCalendarClass, JCalendar>) end;

  JCollectionClass = interface(JIterableClass)
    ['{2737AA1B-2E7C-406D-AF35-8B012C7D5803}']
  end;

  [JavaSignature('java/util/Collection')]
  JCollection = interface(JIterable)
    ['{9E58EE70-C0A7-4660-BF62-945FAE9F5EC3}']
    function add(e: JObject): Boolean; cdecl;
    function addAll(c: JCollection): Boolean; cdecl;
    procedure clear; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function containsAll(c: JCollection): Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function parallelStream: JStream; cdecl;
    function remove(o: JObject): Boolean; cdecl;
    function removeAll(c: JCollection): Boolean; cdecl;
    function removeIf(filter: Jfunction_Predicate): Boolean; cdecl;
    function retainAll(c: JCollection): Boolean; cdecl;
    function size: Integer; cdecl;
    function spliterator: JSpliterator; cdecl;
    function stream: JStream; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(a: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
  end;
  TJCollection = class(TJavaGenericImport<JCollectionClass, JCollection>) end;

  JComparatorClass = interface(IJavaClass)
    ['{BFB6395F-2694-4292-A1B5-87CC1138FB77}']
    {class} function comparing(keyExtractor: JFunction; keyComparator: JComparator): JComparator; cdecl; overload;
    {class} function comparing(keyExtractor: JFunction): JComparator; cdecl; overload;
    {class} function comparingDouble(keyExtractor: JToDoubleFunction): JComparator; cdecl;
    {class} function comparingInt(keyExtractor: JToIntFunction): JComparator; cdecl;
    {class} function comparingLong(keyExtractor: JToLongFunction): JComparator; cdecl;
    {class} function naturalOrder: JComparator; cdecl;
    {class} function nullsFirst(comparator: JComparator): JComparator; cdecl;
    {class} function nullsLast(comparator: JComparator): JComparator; cdecl;
    {class} function reverseOrder: JComparator; cdecl;
  end;

  [JavaSignature('java/util/Comparator')]
  JComparator = interface(IJavaInstance)
    ['{0754C41C-92B8-483B-88F0-B48BFE216D46}']
    function compare(o1: JObject; o2: JObject): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function reversed: JComparator; cdecl;
    function thenComparing(other: JComparator): JComparator; cdecl; overload;
    function thenComparing(keyExtractor: JFunction; keyComparator: JComparator): JComparator; cdecl; overload;
    function thenComparing(keyExtractor: JFunction): JComparator; cdecl; overload;
    function thenComparingDouble(keyExtractor: JToDoubleFunction): JComparator; cdecl;
    function thenComparingInt(keyExtractor: JToIntFunction): JComparator; cdecl;
    function thenComparingLong(keyExtractor: JToLongFunction): JComparator; cdecl;
  end;
  TJComparator = class(TJavaGenericImport<JComparatorClass, JComparator>) end;

  JDateClass = interface(JObjectClass)
    ['{37EABF6D-C7EE-4AB5-BE8B-5E439112E116}']
    {class} function init: JDate; cdecl; overload;
    {class} function init(date: Int64): JDate; cdecl; overload;
    {class} function init(year: Integer; month: Integer; date: Integer): JDate; cdecl; overload;//Deprecated
    {class} function init(year: Integer; month: Integer; date: Integer; hrs: Integer; min: Integer): JDate; cdecl; overload;//Deprecated
    {class} function init(year: Integer; month: Integer; date: Integer; hrs: Integer; min: Integer; sec: Integer): JDate; cdecl; overload;//Deprecated
    {class} function init(s: JString): JDate; cdecl; overload;//Deprecated
    {class} function UTC(year: Integer; month: Integer; date: Integer; hrs: Integer; min: Integer; sec: Integer): Int64; cdecl;//Deprecated
    {class} function from(instant: JInstant): JDate; cdecl;
    {class} function parse(s: JString): Int64; cdecl;//Deprecated
  end;

  [JavaSignature('java/util/Date')]
  JDate = interface(JObject)
    ['{282E2836-B390-44E4-A14F-EF481460BDF7}']
    function after(when: JDate): Boolean; cdecl;
    function before(when: JDate): Boolean; cdecl;
    function clone: JObject; cdecl;
    function compareTo(anotherDate: JDate): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getDate: Integer; cdecl;//Deprecated
    function getDay: Integer; cdecl;//Deprecated
    function getHours: Integer; cdecl;//Deprecated
    function getMinutes: Integer; cdecl;//Deprecated
    function getMonth: Integer; cdecl;//Deprecated
    function getSeconds: Integer; cdecl;//Deprecated
    function getTime: Int64; cdecl;
    function getTimezoneOffset: Integer; cdecl;//Deprecated
    function getYear: Integer; cdecl;//Deprecated
    function hashCode: Integer; cdecl;
    procedure setDate(date: Integer); cdecl;//Deprecated
    procedure setHours(hours: Integer); cdecl;//Deprecated
    procedure setMinutes(minutes: Integer); cdecl;//Deprecated
    procedure setMonth(month: Integer); cdecl;//Deprecated
    procedure setSeconds(seconds: Integer); cdecl;//Deprecated
    procedure setTime(time: Int64); cdecl;
    procedure setYear(year: Integer); cdecl;//Deprecated
    function toGMTString: JString; cdecl;//Deprecated
    function toInstant: JInstant; cdecl;
    function toLocaleString: JString; cdecl;//Deprecated
    function toString: JString; cdecl;
  end;
  TJDate = class(TJavaGenericImport<JDateClass, JDate>) end;

  JDictionaryClass = interface(JObjectClass)
    ['{33D1971B-B4C5-4FA5-9DE3-BD76F2FCBD29}']
    {class} function init: JDictionary; cdecl;
  end;

  [JavaSignature('java/util/Dictionary')]
  JDictionary = interface(JObject)
    ['{C52483EE-5BB5-4F8A-B6ED-411F1920D533}']
    function elements: JEnumeration; cdecl;
    function &get(key: JObject): JObject; cdecl;
    function isEmpty: Boolean; cdecl;
    function keys: JEnumeration; cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    function remove(key: JObject): JObject; cdecl;
    function size: Integer; cdecl;
  end;
  TJDictionary = class(TJavaGenericImport<JDictionaryClass, JDictionary>) end;

  JDoubleSummaryStatisticsClass = interface(JObjectClass)
    ['{D394965A-D960-4CF9-BD61-8ED2DFB32779}']
    {class} function init: JDoubleSummaryStatistics; cdecl;
  end;

  [JavaSignature('java/util/DoubleSummaryStatistics')]
  JDoubleSummaryStatistics = interface(JObject)
    ['{794D0B68-C6D8-4D6B-9100-38CDD48C4D51}']
    procedure accept(value: Double); cdecl;
    procedure combine(other: JDoubleSummaryStatistics); cdecl;
    function getAverage: Double; cdecl;
    function getCount: Int64; cdecl;
    function getMax: Double; cdecl;
    function getMin: Double; cdecl;
    function getSum: Double; cdecl;
    function toString: JString; cdecl;
  end;
  TJDoubleSummaryStatistics = class(TJavaGenericImport<JDoubleSummaryStatisticsClass, JDoubleSummaryStatistics>) end;

  JEnumSetClass = interface(JAbstractSetClass)
    ['{67EF0287-D91B-44E0-9574-4CA9974FBC38}']
    {class} function allOf(elementType: Jlang_Class): JEnumSet; cdecl;
    {class} function complementOf(s: JEnumSet): JEnumSet; cdecl;
    {class} function copyOf(s: JEnumSet): JEnumSet; cdecl; overload;
    {class} function copyOf(c: JCollection): JEnumSet; cdecl; overload;
    {class} function noneOf(elementType: Jlang_Class): JEnumSet; cdecl;
    {class} function &of(e: JEnum): JEnumSet; cdecl; overload;
    {class} function &of(e1: JEnum; e2: JEnum): JEnumSet; cdecl; overload;
    {class} function &of(e1: JEnum; e2: JEnum; e3: JEnum): JEnumSet; cdecl; overload;
    {class} function &of(e1: JEnum; e2: JEnum; e3: JEnum; e4: JEnum): JEnumSet; cdecl; overload;
    {class} function &of(e1: JEnum; e2: JEnum; e3: JEnum; e4: JEnum; e5: JEnum): JEnumSet; cdecl; overload;
    {class} function range(from: JEnum; to_: JEnum): JEnumSet; cdecl;
  end;

  [JavaSignature('java/util/EnumSet')]
  JEnumSet = interface(JAbstractSet)
    ['{C8A6B028-B797-406A-9EE4-B65671555D97}']
    function clone: JEnumSet; cdecl;
  end;
  TJEnumSet = class(TJavaGenericImport<JEnumSetClass, JEnumSet>) end;

  JEnumerationClass = interface(IJavaClass)
    ['{5E393BCD-3EF2-4764-A59C-37B4D44C289A}']
  end;

  [JavaSignature('java/util/Enumeration')]
  JEnumeration = interface(IJavaInstance)
    ['{8F9F8780-E6BE-4B67-A4F5-8EC28E1AE2EE}']
    function hasMoreElements: Boolean; cdecl;
    function nextElement: JObject; cdecl;
  end;
  TJEnumeration = class(TJavaGenericImport<JEnumerationClass, JEnumeration>) end;

  JGregorianCalendarClass = interface(JCalendarClass)
    ['{69F4EF00-93DA-4249-8A30-3A3E4A71DA03}']
    {class} function _GetAD: Integer; cdecl;
    {class} function _GetBC: Integer; cdecl;
    {class} function init: JGregorianCalendar; cdecl; overload;
    {class} function init(zone: JTimeZone): JGregorianCalendar; cdecl; overload;
    {class} function init(aLocale: JLocale): JGregorianCalendar; cdecl; overload;
    {class} function init(zone: JTimeZone; aLocale: JLocale): JGregorianCalendar; cdecl; overload;
    {class} function init(year: Integer; month: Integer; dayOfMonth: Integer): JGregorianCalendar; cdecl; overload;
    {class} function init(year: Integer; month: Integer; dayOfMonth: Integer; hourOfDay: Integer; minute: Integer): JGregorianCalendar; cdecl; overload;
    {class} function init(year: Integer; month: Integer; dayOfMonth: Integer; hourOfDay: Integer; minute: Integer; second: Integer): JGregorianCalendar; cdecl; overload;
    {class} function from(zdt: JZonedDateTime): JGregorianCalendar; cdecl;
    {class} property AD: Integer read _GetAD;
    {class} property BC: Integer read _GetBC;
  end;

  [JavaSignature('java/util/GregorianCalendar')]
  JGregorianCalendar = interface(JCalendar)
    ['{CB851885-16EA-49E7-8AAF-DBFE900DA328}']
    procedure add(field: Integer; amount: Integer); cdecl;
    function clone: JObject; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getActualMaximum(field: Integer): Integer; cdecl;
    function getActualMinimum(field: Integer): Integer; cdecl;
    function getCalendarType: JString; cdecl;
    function getGreatestMinimum(field: Integer): Integer; cdecl;
    function getGregorianChange: JDate; cdecl;
    function getLeastMaximum(field: Integer): Integer; cdecl;
    function getMaximum(field: Integer): Integer; cdecl;
    function getMinimum(field: Integer): Integer; cdecl;
    function getTimeZone: JTimeZone; cdecl;
    function getWeekYear: Integer; cdecl;
    function getWeeksInWeekYear: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isLeapYear(year: Integer): Boolean; cdecl;
    function isWeekDateSupported: Boolean; cdecl;
    procedure roll(field: Integer; up: Boolean); cdecl; overload;
    procedure roll(field: Integer; amount: Integer); cdecl; overload;
    procedure setGregorianChange(date: JDate); cdecl;
    procedure setTimeZone(zone: JTimeZone); cdecl;
    procedure setWeekDate(weekYear: Integer; weekOfYear: Integer; dayOfWeek: Integer); cdecl;
    function toZonedDateTime: JZonedDateTime; cdecl;
  end;
  TJGregorianCalendar = class(TJavaGenericImport<JGregorianCalendarClass, JGregorianCalendar>) end;

  JHashMapClass = interface(JAbstractMapClass)
    ['{AC953BC1-405B-4CDD-93D2-FBA77D171B56}']
    {class} function init(initialCapacity: Integer; loadFactor: Single): JHashMap; cdecl; overload;
    {class} function init(initialCapacity: Integer): JHashMap; cdecl; overload;
    {class} function init: JHashMap; cdecl; overload;
    {class} function init(m: JMap): JHashMap; cdecl; overload;
  end;

  [JavaSignature('java/util/HashMap')]
  JHashMap = interface(JAbstractMap)
    ['{FD560211-A7FE-4AB5-B510-BB43A31AA75D}']
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function compute(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function computeIfAbsent(key: JObject; mappingFunction: JFunction): JObject; cdecl;
    function computeIfPresent(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function containsKey(key: JObject): Boolean; cdecl;
    function containsValue(value: JObject): Boolean; cdecl;
    function entrySet: JSet; cdecl;
    procedure forEach(action: JBiConsumer); cdecl;
    function &get(key: JObject): JObject; cdecl;
    function getOrDefault(key: JObject; defaultValue: JObject): JObject; cdecl;
    function isEmpty: Boolean; cdecl;
    function keySet: JSet; cdecl;
    function merge(key: JObject; value: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    procedure putAll(m: JMap); cdecl;
    function putIfAbsent(key: JObject; value: JObject): JObject; cdecl;
    function remove(key: JObject): JObject; cdecl; overload;
    function remove(key: JObject; value: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; oldValue: JObject; newValue: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; value: JObject): JObject; cdecl; overload;
    procedure replaceAll(function_: JBiFunction); cdecl;
    function size: Integer; cdecl;
    function values: JCollection; cdecl;
  end;
  TJHashMap = class(TJavaGenericImport<JHashMapClass, JHashMap>) end;

  JHashSetClass = interface(JAbstractSetClass)
    ['{7828E4D4-4F9F-493D-869E-92BE600444D5}']
    {class} function init: JHashSet; cdecl; overload;
    {class} function init(c: JCollection): JHashSet; cdecl; overload;
    {class} function init(initialCapacity: Integer; loadFactor: Single): JHashSet; cdecl; overload;
    {class} function init(initialCapacity: Integer): JHashSet; cdecl; overload;
  end;

  [JavaSignature('java/util/HashSet')]
  JHashSet = interface(JAbstractSet)
    ['{A57B696D-8331-4C96-8759-7F2009371640}']
    function add(e: JObject): Boolean; cdecl;
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function remove(o: JObject): Boolean; cdecl;
    function size: Integer; cdecl;
    function spliterator: JSpliterator; cdecl;
  end;
  TJHashSet = class(TJavaGenericImport<JHashSetClass, JHashSet>) end;

  JHashtableClass = interface(JDictionaryClass)
    ['{0459EE5F-44DF-406D-B0F4-6D2F19D2222F}']
    {class} function init(initialCapacity: Integer; loadFactor: Single): JHashtable; cdecl; overload;
    {class} function init(initialCapacity: Integer): JHashtable; cdecl; overload;
    {class} function init: JHashtable; cdecl; overload;
    {class} function init(t: JMap): JHashtable; cdecl; overload;
  end;

  [JavaSignature('java/util/Hashtable')]
  JHashtable = interface(JDictionary)
    ['{7A995299-3381-4179-A8A2-21C4F0E2E755}']
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function compute(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function computeIfAbsent(key: JObject; mappingFunction: JFunction): JObject; cdecl;
    function computeIfPresent(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function &contains(value: JObject): Boolean; cdecl;
    function containsKey(key: JObject): Boolean; cdecl;
    function containsValue(value: JObject): Boolean; cdecl;
    function elements: JEnumeration; cdecl;
    function entrySet: JSet; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    procedure forEach(action: JBiConsumer); cdecl;
    function &get(key: JObject): JObject; cdecl;
    function getOrDefault(key: JObject; defaultValue: JObject): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function keySet: JSet; cdecl;
    function keys: JEnumeration; cdecl;
    function merge(key: JObject; value: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    procedure putAll(t: JMap); cdecl;
    function putIfAbsent(key: JObject; value: JObject): JObject; cdecl;
    function remove(key: JObject): JObject; cdecl; overload;
    function remove(key: JObject; value: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; oldValue: JObject; newValue: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; value: JObject): JObject; cdecl; overload;
    procedure replaceAll(function_: JBiFunction); cdecl;
    function size: Integer; cdecl;
    function toString: JString; cdecl;
    function values: JCollection; cdecl;
  end;
  TJHashtable = class(TJavaGenericImport<JHashtableClass, JHashtable>) end;

  JIntSummaryStatisticsClass = interface(JObjectClass)
    ['{BC378E37-ED74-4F4D-9404-87C2CE119186}']
    {class} function init: JIntSummaryStatistics; cdecl;
  end;

  [JavaSignature('java/util/IntSummaryStatistics')]
  JIntSummaryStatistics = interface(JObject)
    ['{95B2958E-3780-42D0-A774-74DDCADAAD52}']
    procedure accept(value: Integer); cdecl;
    procedure combine(other: JIntSummaryStatistics); cdecl;
    function getAverage: Double; cdecl;
    function getCount: Int64; cdecl;
    function getMax: Integer; cdecl;
    function getMin: Integer; cdecl;
    function getSum: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJIntSummaryStatistics = class(TJavaGenericImport<JIntSummaryStatisticsClass, JIntSummaryStatistics>) end;

  JIteratorClass = interface(IJavaClass)
    ['{2E525F5D-C766-4F79-B800-BA5FFA909E90}']
  end;

  [JavaSignature('java/util/Iterator')]
  JIterator = interface(IJavaInstance)
    ['{435EBC1F-CFE0-437C-B49B-45B5257B6953}']
    procedure forEachRemaining(action: JConsumer); cdecl;
    function hasNext: Boolean; cdecl;
    function next: JObject; cdecl;
    procedure remove; cdecl;
  end;
  TJIterator = class(TJavaGenericImport<JIteratorClass, JIterator>) end;

  JListClass = interface(JCollectionClass)
    ['{8EA06296-143F-4381-9369-A77209B622F0}']
  end;

  [JavaSignature('java/util/List')]
  JList = interface(JCollection)
    ['{3F85C565-F3F4-42D8-87EE-F724F72113C7}']
    function add(e: JObject): Boolean; cdecl; overload;
    procedure add(index: Integer; element: JObject); cdecl; overload;
    function addAll(c: JCollection): Boolean; cdecl; overload;
    function addAll(index: Integer; c: JCollection): Boolean; cdecl; overload;
    procedure clear; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function containsAll(c: JCollection): Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function &get(index: Integer): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function indexOf(o: JObject): Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function lastIndexOf(o: JObject): Integer; cdecl;
    function listIterator: JListIterator; cdecl; overload;
    function listIterator(index: Integer): JListIterator; cdecl; overload;
    function remove(o: JObject): Boolean; cdecl; overload;
    function remove(index: Integer): JObject; cdecl; overload;
    function removeAll(c: JCollection): Boolean; cdecl;
    procedure replaceAll(operator: JUnaryOperator); cdecl;
    function retainAll(c: JCollection): Boolean; cdecl;
    function &set(index: Integer; element: JObject): JObject; cdecl;
    function size: Integer; cdecl;
    procedure sort(c: JComparator); cdecl;
    function spliterator: JSpliterator; cdecl;
    function subList(fromIndex: Integer; toIndex: Integer): JList; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(a: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
  end;
  TJList = class(TJavaGenericImport<JListClass, JList>) end;

  JListIteratorClass = interface(JIteratorClass)
    ['{7541F5DD-8E71-44AE-ACD9-142ED2D42810}']
  end;

  [JavaSignature('java/util/ListIterator')]
  JListIterator = interface(JIterator)
    ['{B66BDA33-5CDD-43B1-B320-7353AE09C418}']
    procedure add(e: JObject); cdecl;
    function hasNext: Boolean; cdecl;
    function hasPrevious: Boolean; cdecl;
    function next: JObject; cdecl;
    function nextIndex: Integer; cdecl;
    function previous: JObject; cdecl;
    function previousIndex: Integer; cdecl;
    procedure remove; cdecl;
    procedure &set(e: JObject); cdecl;
  end;
  TJListIterator = class(TJavaGenericImport<JListIteratorClass, JListIterator>) end;

  JLocaleClass = interface(JObjectClass)
    ['{0A5D70AA-C01B-437F-97C8-FEE25C595AE7}']
    {class} function _GetCANADA: JLocale; cdecl;
    {class} function _GetCANADA_FRENCH: JLocale; cdecl;
    {class} function _GetCHINA: JLocale; cdecl;
    {class} function _GetCHINESE: JLocale; cdecl;
    {class} function _GetENGLISH: JLocale; cdecl;
    {class} function _GetFRANCE: JLocale; cdecl;
    {class} function _GetFRENCH: JLocale; cdecl;
    {class} function _GetGERMAN: JLocale; cdecl;
    {class} function _GetGERMANY: JLocale; cdecl;
    {class} function _GetITALIAN: JLocale; cdecl;
    {class} function _GetITALY: JLocale; cdecl;
    {class} function _GetJAPAN: JLocale; cdecl;
    {class} function _GetJAPANESE: JLocale; cdecl;
    {class} function _GetKOREA: JLocale; cdecl;
    {class} function _GetKOREAN: JLocale; cdecl;
    {class} function _GetPRC: JLocale; cdecl;
    {class} function _GetPRIVATE_USE_EXTENSION: Char; cdecl;
    {class} function _GetROOT: JLocale; cdecl;
    {class} function _GetSIMPLIFIED_CHINESE: JLocale; cdecl;
    {class} function _GetTAIWAN: JLocale; cdecl;
    {class} function _GetTRADITIONAL_CHINESE: JLocale; cdecl;
    {class} function _GetUK: JLocale; cdecl;
    {class} function _GetUNICODE_LOCALE_EXTENSION: Char; cdecl;
    {class} function _GetUS: JLocale; cdecl;
    {class} function init(language: JString; country: JString; variant: JString): JLocale; cdecl; overload;
    {class} function init(language: JString; country: JString): JLocale; cdecl; overload;
    {class} function init(language: JString): JLocale; cdecl; overload;
    {class} function filter(priorityList: JList; locales: JCollection; mode: JLocale_FilteringMode): JList; cdecl; overload;
    {class} function filter(priorityList: JList; locales: JCollection): JList; cdecl; overload;
    {class} function filterTags(priorityList: JList; tags: JCollection; mode: JLocale_FilteringMode): JList; cdecl; overload;
    {class} function filterTags(priorityList: JList; tags: JCollection): JList; cdecl; overload;
    {class} function forLanguageTag(languageTag: JString): JLocale; cdecl;
    {class} function getAvailableLocales: TJavaObjectArray<JLocale>; cdecl;
    {class} function getDefault: JLocale; cdecl; overload;
    {class} function getDefault(category: JLocale_Category): JLocale; cdecl; overload;
    {class} function getISOCountries: TJavaObjectArray<JString>; cdecl;
    {class} function getISOLanguages: TJavaObjectArray<JString>; cdecl;
    {class} function lookup(priorityList: JList; locales: JCollection): JLocale; cdecl;
    {class} function lookupTag(priorityList: JList; tags: JCollection): JString; cdecl;
    {class} procedure setDefault(newLocale: JLocale); cdecl; overload;
    {class} procedure setDefault(category: JLocale_Category; newLocale: JLocale); cdecl; overload;
    {class} property CANADA: JLocale read _GetCANADA;
    {class} property CANADA_FRENCH: JLocale read _GetCANADA_FRENCH;
    {class} property CHINA: JLocale read _GetCHINA;
    {class} property CHINESE: JLocale read _GetCHINESE;
    {class} property ENGLISH: JLocale read _GetENGLISH;
    {class} property FRANCE: JLocale read _GetFRANCE;
    {class} property FRENCH: JLocale read _GetFRENCH;
    {class} property GERMAN: JLocale read _GetGERMAN;
    {class} property GERMANY: JLocale read _GetGERMANY;
    {class} property ITALIAN: JLocale read _GetITALIAN;
    {class} property ITALY: JLocale read _GetITALY;
    {class} property JAPAN: JLocale read _GetJAPAN;
    {class} property JAPANESE: JLocale read _GetJAPANESE;
    {class} property KOREA: JLocale read _GetKOREA;
    {class} property KOREAN: JLocale read _GetKOREAN;
    {class} property PRC: JLocale read _GetPRC;
    {class} property PRIVATE_USE_EXTENSION: Char read _GetPRIVATE_USE_EXTENSION;
    {class} property ROOT: JLocale read _GetROOT;
    {class} property SIMPLIFIED_CHINESE: JLocale read _GetSIMPLIFIED_CHINESE;
    {class} property TAIWAN: JLocale read _GetTAIWAN;
    {class} property TRADITIONAL_CHINESE: JLocale read _GetTRADITIONAL_CHINESE;
    {class} property UK: JLocale read _GetUK;
    {class} property UNICODE_LOCALE_EXTENSION: Char read _GetUNICODE_LOCALE_EXTENSION;
    {class} property US: JLocale read _GetUS;
  end;

  [JavaSignature('java/util/Locale')]
  JLocale = interface(JObject)
    ['{877ADE25-1D13-4963-9A17-17EE17B3A0A8}']
    function clone: JObject; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getCountry: JString; cdecl;
    function getDisplayCountry: JString; cdecl; overload;
    function getDisplayCountry(locale: JLocale): JString; cdecl; overload;
    function getDisplayLanguage: JString; cdecl; overload;
    function getDisplayLanguage(locale: JLocale): JString; cdecl; overload;
    function getDisplayName: JString; cdecl; overload;
    function getDisplayName(locale: JLocale): JString; cdecl; overload;
    function getDisplayScript: JString; cdecl; overload;
    function getDisplayScript(inLocale: JLocale): JString; cdecl; overload;
    function getDisplayVariant: JString; cdecl; overload;
    function getDisplayVariant(inLocale: JLocale): JString; cdecl; overload;
    function getExtension(key: Char): JString; cdecl;
    function getExtensionKeys: JSet; cdecl;
    function getISO3Country: JString; cdecl;
    function getISO3Language: JString; cdecl;
    function getLanguage: JString; cdecl;
    function getScript: JString; cdecl;
    function getUnicodeLocaleAttributes: JSet; cdecl;
    function getUnicodeLocaleKeys: JSet; cdecl;
    function getUnicodeLocaleType(key: JString): JString; cdecl;
    function getVariant: JString; cdecl;
    function hasExtensions: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function stripExtensions: JLocale; cdecl;
    function toLanguageTag: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJLocale = class(TJavaGenericImport<JLocaleClass, JLocale>) end;

  JLocale_CategoryClass = interface(JEnumClass)
    ['{85F52362-9FE6-4A13-B7FB-C064880E706F}']
    {class} function _GetDISPLAY: JLocale_Category; cdecl;
    {class} function _GetFORMAT: JLocale_Category; cdecl;
    {class} function valueOf(name: JString): JLocale_Category; cdecl;
    {class} function values: TJavaObjectArray<JLocale_Category>; cdecl;
    {class} property DISPLAY: JLocale_Category read _GetDISPLAY;
    {class} property FORMAT: JLocale_Category read _GetFORMAT;
  end;

  [JavaSignature('java/util/Locale$Category')]
  JLocale_Category = interface(JEnum)
    ['{D145E7AF-375A-4B4A-BB9F-AA75D2AA48F7}']
  end;
  TJLocale_Category = class(TJavaGenericImport<JLocale_CategoryClass, JLocale_Category>) end;

  JLocale_FilteringModeClass = interface(JEnumClass)
    ['{198E288B-B730-4DE6-A526-59D9690C98E8}']
    {class} function _GetAUTOSELECT_FILTERING: JLocale_FilteringMode; cdecl;
    {class} function _GetEXTENDED_FILTERING: JLocale_FilteringMode; cdecl;
    {class} function _GetIGNORE_EXTENDED_RANGES: JLocale_FilteringMode; cdecl;
    {class} function _GetMAP_EXTENDED_RANGES: JLocale_FilteringMode; cdecl;
    {class} function _GetREJECT_EXTENDED_RANGES: JLocale_FilteringMode; cdecl;
    {class} function valueOf(name: JString): JLocale_FilteringMode; cdecl;
    {class} function values: TJavaObjectArray<JLocale_FilteringMode>; cdecl;
    {class} property AUTOSELECT_FILTERING: JLocale_FilteringMode read _GetAUTOSELECT_FILTERING;
    {class} property EXTENDED_FILTERING: JLocale_FilteringMode read _GetEXTENDED_FILTERING;
    {class} property IGNORE_EXTENDED_RANGES: JLocale_FilteringMode read _GetIGNORE_EXTENDED_RANGES;
    {class} property MAP_EXTENDED_RANGES: JLocale_FilteringMode read _GetMAP_EXTENDED_RANGES;
    {class} property REJECT_EXTENDED_RANGES: JLocale_FilteringMode read _GetREJECT_EXTENDED_RANGES;
  end;

  [JavaSignature('java/util/Locale$FilteringMode')]
  JLocale_FilteringMode = interface(JEnum)
    ['{C68D206C-7B4B-4650-9576-7982463DDA5E}']
  end;
  TJLocale_FilteringMode = class(TJavaGenericImport<JLocale_FilteringModeClass, JLocale_FilteringMode>) end;

  JLongSummaryStatisticsClass = interface(JObjectClass)
    ['{B546F8AF-ED71-4298-9215-9F644B2E0DB7}']
    {class} function init: JLongSummaryStatistics; cdecl;
  end;

  [JavaSignature('java/util/LongSummaryStatistics')]
  JLongSummaryStatistics = interface(JObject)
    ['{0523DA5A-E6D8-4CD0-87CE-BB1E9BF9D095}']
    procedure accept(value: Integer); cdecl; overload;
    procedure accept(value: Int64); cdecl; overload;
    procedure combine(other: JLongSummaryStatistics); cdecl;
    function getAverage: Double; cdecl;
    function getCount: Int64; cdecl;
    function getMax: Int64; cdecl;
    function getMin: Int64; cdecl;
    function getSum: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJLongSummaryStatistics = class(TJavaGenericImport<JLongSummaryStatisticsClass, JLongSummaryStatistics>) end;

  JMapClass = interface(IJavaClass)
    ['{2A7CE403-063B-45CA-9F4D-EA1E64304F1C}']
  end;

  [JavaSignature('java/util/Map')]
  JMap = interface(IJavaInstance)
    ['{BE6A5DBF-B121-4BF2-BC18-EB64729C7811}']
    procedure clear; cdecl;
    function compute(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function computeIfAbsent(key: JObject; mappingFunction: JFunction): JObject; cdecl;
    function computeIfPresent(key: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function containsKey(key: JObject): Boolean; cdecl;
    function containsValue(value: JObject): Boolean; cdecl;
    function entrySet: JSet; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    procedure forEach(action: JBiConsumer); cdecl;
    function &get(key: JObject): JObject; cdecl;
    function getOrDefault(key: JObject; defaultValue: JObject): JObject; cdecl;
    function hashCode: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function keySet: JSet; cdecl;
    function merge(key: JObject; value: JObject; remappingFunction: JBiFunction): JObject; cdecl;
    function put(key: JObject; value: JObject): JObject; cdecl;
    procedure putAll(m: JMap); cdecl;
    function putIfAbsent(key: JObject; value: JObject): JObject; cdecl;
    function remove(key: JObject): JObject; cdecl; overload;
    function remove(key: JObject; value: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; oldValue: JObject; newValue: JObject): Boolean; cdecl; overload;
    function replace(key: JObject; value: JObject): JObject; cdecl; overload;
    procedure replaceAll(function_: JBiFunction); cdecl;
    function size: Integer; cdecl;
    function values: JCollection; cdecl;
  end;
  TJMap = class(TJavaGenericImport<JMapClass, JMap>) end;

  Jutil_ObservableClass = interface(JObjectClass)
    ['{2BD8C696-02FF-4378-A514-ACD431BEE106}']
    {class} function init: Jutil_Observable; cdecl;
  end;

  [JavaSignature('java/util/Observable')]
  Jutil_Observable = interface(JObject)
    ['{B8443F0E-B41C-4475-934B-1C917FCF617B}']
    procedure addObserver(o: JObserver); cdecl;
    function countObservers: Integer; cdecl;
    procedure deleteObserver(o: JObserver); cdecl;
    procedure deleteObservers; cdecl;
    function hasChanged: Boolean; cdecl;
    procedure notifyObservers; cdecl; overload;
    procedure notifyObservers(arg: JObject); cdecl; overload;
  end;
  TJutil_Observable = class(TJavaGenericImport<Jutil_ObservableClass, Jutil_Observable>) end;

  JObserverClass = interface(IJavaClass)
    ['{8582EA20-ECD9-4C10-95BD-2C89B4D5BA6E}']
  end;

  [JavaSignature('java/util/Observer')]
  JObserver = interface(IJavaInstance)
    ['{452A1BDA-4B4E-406E-B455-BC56F012C1B7}']
    procedure update(o: Jutil_Observable; arg: JObject); cdecl;
  end;
  TJObserver = class(TJavaGenericImport<JObserverClass, JObserver>) end;

  JOptionalClass = interface(JObjectClass)
    ['{CB83B39E-6950-4052-8751-AEBCEBAF47D7}']
    {class} function empty: JOptional; cdecl;
    {class} function &of(value: JObject): JOptional; cdecl;
    {class} function ofNullable(value: JObject): JOptional; cdecl;
  end;

  [JavaSignature('java/util/Optional')]
  JOptional = interface(JObject)
    ['{A10DD170-3D2E-4578-A5EB-A2E9E9A49A08}']
    function equals(obj: JObject): Boolean; cdecl;
    function filter(predicate: Jfunction_Predicate): JOptional; cdecl;
    function flatMap(mapper: JFunction): JOptional; cdecl;
    function &get: JObject; cdecl;
    function hashCode: Integer; cdecl;
    procedure ifPresent(consumer: JConsumer); cdecl;
    function isPresent: Boolean; cdecl;
    function map(mapper: JFunction): JOptional; cdecl;
    function orElse(other: JObject): JObject; cdecl;
    function orElseGet(other: JSupplier): JObject; cdecl;
    function orElseThrow(exceptionSupplier: JSupplier): JObject; cdecl;
    function toString: JString; cdecl;
  end;
  TJOptional = class(TJavaGenericImport<JOptionalClass, JOptional>) end;

  JOptionalDoubleClass = interface(JObjectClass)
    ['{82CA5874-6B1C-4986-9856-3188D1D597C5}']
    {class} function empty: JOptionalDouble; cdecl;
    {class} function &of(value: Double): JOptionalDouble; cdecl;
  end;

  [JavaSignature('java/util/OptionalDouble')]
  JOptionalDouble = interface(JObject)
    ['{55E6B249-D464-45A3-A0FA-909DD19C5088}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAsDouble: Double; cdecl;
    function hashCode: Integer; cdecl;
    procedure ifPresent(consumer: JDoubleConsumer); cdecl;
    function isPresent: Boolean; cdecl;
    function orElse(other: Double): Double; cdecl;
    function orElseGet(other: JDoubleSupplier): Double; cdecl;
    function orElseThrow(exceptionSupplier: JSupplier): Double; cdecl;
    function toString: JString; cdecl;
  end;
  TJOptionalDouble = class(TJavaGenericImport<JOptionalDoubleClass, JOptionalDouble>) end;

  JOptionalIntClass = interface(JObjectClass)
    ['{3FCAC9CD-4A4A-49F7-A63C-F2400D2868CD}']
    {class} function empty: JOptionalInt; cdecl;
    {class} function &of(value: Integer): JOptionalInt; cdecl;
  end;

  [JavaSignature('java/util/OptionalInt')]
  JOptionalInt = interface(JObject)
    ['{E662855E-5EC0-4B0E-BB21-698174A66B2F}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAsInt: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure ifPresent(consumer: JIntConsumer); cdecl;
    function isPresent: Boolean; cdecl;
    function orElse(other: Integer): Integer; cdecl;
    function orElseGet(other: JIntSupplier): Integer; cdecl;
    function orElseThrow(exceptionSupplier: JSupplier): Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJOptionalInt = class(TJavaGenericImport<JOptionalIntClass, JOptionalInt>) end;

  JOptionalLongClass = interface(JObjectClass)
    ['{23DDE21A-3436-4EA5-96F5-EAED9342B5F4}']
    {class} function empty: JOptionalLong; cdecl;
    {class} function &of(value: Int64): JOptionalLong; cdecl;
  end;

  [JavaSignature('java/util/OptionalLong')]
  JOptionalLong = interface(JObject)
    ['{AF301C15-0637-4995-88C9-95F570D7F169}']
    function equals(obj: JObject): Boolean; cdecl;
    function getAsLong: Int64; cdecl;
    function hashCode: Integer; cdecl;
    procedure ifPresent(consumer: JLongConsumer); cdecl;
    function isPresent: Boolean; cdecl;
    function orElse(other: Int64): Int64; cdecl;
    function orElseGet(other: JLongSupplier): Int64; cdecl;
    function orElseThrow(exceptionSupplier: JSupplier): Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJOptionalLong = class(TJavaGenericImport<JOptionalLongClass, JOptionalLong>) end;

  JPrimitiveIteratorClass = interface(JIteratorClass)
    ['{A1CA462F-125B-4D2E-8EFA-105CEBFC81FC}']
  end;

  [JavaSignature('java/util/PrimitiveIterator')]
  JPrimitiveIterator = interface(JIterator)
    ['{0D766E2A-31E3-45AA-9E47-50BF0C81188C}']
    procedure forEachRemaining(action: JObject); cdecl;
  end;
  TJPrimitiveIterator = class(TJavaGenericImport<JPrimitiveIteratorClass, JPrimitiveIterator>) end;

  JPrimitiveIterator_OfDoubleClass = interface(JPrimitiveIteratorClass)
    ['{BD1EC9AD-DE6E-4D79-B1EA-CF416E8E0054}']
  end;

  [JavaSignature('java/util/PrimitiveIterator$OfDouble')]
  JPrimitiveIterator_OfDouble = interface(JPrimitiveIterator)
    ['{1CEEAA3A-8016-402A-8D73-6EBFC68F6F22}']
    procedure forEachRemaining(action: JDoubleConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function next: JDouble; cdecl;
    function nextDouble: Double; cdecl;
  end;
  TJPrimitiveIterator_OfDouble = class(TJavaGenericImport<JPrimitiveIterator_OfDoubleClass, JPrimitiveIterator_OfDouble>) end;

  JPrimitiveIterator_OfIntClass = interface(JPrimitiveIteratorClass)
    ['{F9D2404C-1307-4EB8-AF9F-9704C7CDE9A4}']
  end;

  [JavaSignature('java/util/PrimitiveIterator$OfInt')]
  JPrimitiveIterator_OfInt = interface(JPrimitiveIterator)
    ['{99F12F35-8B6C-45DA-B36D-0B5138CDEC04}']
    procedure forEachRemaining(action: JIntConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function next: JInteger; cdecl;
    function nextInt: Integer; cdecl;
  end;
  TJPrimitiveIterator_OfInt = class(TJavaGenericImport<JPrimitiveIterator_OfIntClass, JPrimitiveIterator_OfInt>) end;

  JPrimitiveIterator_OfLongClass = interface(JPrimitiveIteratorClass)
    ['{49090089-F968-427F-8CC9-B07B3BB832CB}']
  end;

  [JavaSignature('java/util/PrimitiveIterator$OfLong')]
  JPrimitiveIterator_OfLong = interface(JPrimitiveIterator)
    ['{15363668-D34E-4CA8-B3B9-4E5886B0C116}']
    procedure forEachRemaining(action: JLongConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function next: JLong; cdecl;
    function nextLong: Int64; cdecl;
  end;
  TJPrimitiveIterator_OfLong = class(TJavaGenericImport<JPrimitiveIterator_OfLongClass, JPrimitiveIterator_OfLong>) end;

  JPropertiesClass = interface(JHashtableClass)
    ['{CA354A9C-C42E-41BD-B104-6058143813A5}']
    {class} function init: JProperties; cdecl; overload;
    {class} function init(defaults: JProperties): JProperties; cdecl; overload;
  end;

  [JavaSignature('java/util/Properties')]
  JProperties = interface(JHashtable)
    ['{5F7AA87B-4EF0-4D76-923C-D7586F38760F}']
    function getProperty(key: JString): JString; cdecl; overload;
    function getProperty(key: JString; defaultValue: JString): JString; cdecl; overload;
    procedure list(out_: JPrintStream); cdecl; overload;
    procedure list(out_: JPrintWriter); cdecl; overload;
    procedure load(reader: JReader); cdecl; overload;
    procedure load(inStream: JInputStream); cdecl; overload;
    procedure loadFromXML(in_: JInputStream); cdecl;
    function propertyNames: JEnumeration; cdecl;
    procedure save(out_: JOutputStream; comments: JString); cdecl;//Deprecated
    function setProperty(key: JString; value: JString): JObject; cdecl;
    procedure store(writer: JWriter; comments: JString); cdecl; overload;
    procedure store(out_: JOutputStream; comments: JString); cdecl; overload;
    procedure storeToXML(os: JOutputStream; comment: JString); cdecl; overload;
    procedure storeToXML(os: JOutputStream; comment: JString; encoding: JString); cdecl; overload;
    function stringPropertyNames: JSet; cdecl;
  end;
  TJProperties = class(TJavaGenericImport<JPropertiesClass, JProperties>) end;

  JQueueClass = interface(JCollectionClass)
    ['{3A0B6ECD-D788-4FFA-9C17-6F7A761FE1DC}']
  end;

  [JavaSignature('java/util/Queue')]
  JQueue = interface(JCollection)
    ['{1F7FBC68-484A-4622-AE37-764E1EC7AF04}']
    function add(e: JObject): Boolean; cdecl;
    function element: JObject; cdecl;
    function offer(e: JObject): Boolean; cdecl;
    function peek: JObject; cdecl;
    function poll: JObject; cdecl;
    function remove: JObject; cdecl;
  end;
  TJQueue = class(TJavaGenericImport<JQueueClass, JQueue>) end;

  JRandomClass = interface(JObjectClass)
    ['{C50FE36A-6283-4523-BF77-15BB7A7B0F92}']
    {class} function init: JRandom; cdecl; overload;
    {class} function init(seed: Int64): JRandom; cdecl; overload;
  end;

  [JavaSignature('java/util/Random')]
  JRandom = interface(JObject)
    ['{F1C05381-73F2-4991-853B-B22575DB43D2}']
    function doubles(streamSize: Int64): JDoubleStream; cdecl; overload;
    function doubles: JDoubleStream; cdecl; overload;
    function doubles(streamSize: Int64; randomNumberOrigin: Double; randomNumberBound: Double): JDoubleStream; cdecl; overload;
    function doubles(randomNumberOrigin: Double; randomNumberBound: Double): JDoubleStream; cdecl; overload;
    function ints(streamSize: Int64): JIntStream; cdecl; overload;
    function ints: JIntStream; cdecl; overload;
    function ints(streamSize: Int64; randomNumberOrigin: Integer; randomNumberBound: Integer): JIntStream; cdecl; overload;
    function ints(randomNumberOrigin: Integer; randomNumberBound: Integer): JIntStream; cdecl; overload;
    function longs(streamSize: Int64): JLongStream; cdecl; overload;
    function longs: JLongStream; cdecl; overload;
    function longs(streamSize: Int64; randomNumberOrigin: Int64; randomNumberBound: Int64): JLongStream; cdecl; overload;
    function longs(randomNumberOrigin: Int64; randomNumberBound: Int64): JLongStream; cdecl; overload;
    function nextBoolean: Boolean; cdecl;
    procedure nextBytes(bytes: TJavaArray<Byte>); cdecl;
    function nextDouble: Double; cdecl;
    function nextFloat: Single; cdecl;
    function nextGaussian: Double; cdecl;
    function nextInt: Integer; cdecl; overload;
    function nextInt(bound: Integer): Integer; cdecl; overload;
    function nextLong: Int64; cdecl;
    procedure setSeed(seed: Int64); cdecl;
  end;
  TJRandom = class(TJavaGenericImport<JRandomClass, JRandom>) end;

  JSetClass = interface(JCollectionClass)
    ['{A3E290FD-FD46-4DA8-B728-07B04920F5DE}']
  end;

  [JavaSignature('java/util/Set')]
  JSet = interface(JCollection)
    ['{07BF19A2-0C1C-4ABF-9028-1F99DD0E0A79}']
    function add(e: JObject): Boolean; cdecl;
    function addAll(c: JCollection): Boolean; cdecl;
    procedure clear; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function containsAll(c: JCollection): Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function remove(o: JObject): Boolean; cdecl;
    function removeAll(c: JCollection): Boolean; cdecl;
    function retainAll(c: JCollection): Boolean; cdecl;
    function size: Integer; cdecl;
    function spliterator: JSpliterator; cdecl;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(a: TJavaObjectArray<JObject>): TJavaObjectArray<JObject>; cdecl; overload;
  end;
  TJSet = class(TJavaGenericImport<JSetClass, JSet>) end;

  JSortedMapClass = interface(JMapClass)
    ['{7665A1A5-0EE6-483D-A256-B13FA7E65230}']
  end;

  [JavaSignature('java/util/SortedMap')]
  JSortedMap = interface(JMap)
    ['{3FD4011C-7238-42A1-8E25-D7B3F130E88F}']
    function comparator: JComparator; cdecl;
    function entrySet: JSet; cdecl;
    function firstKey: JObject; cdecl;
    function headMap(toKey: JObject): JSortedMap; cdecl;
    function keySet: JSet; cdecl;
    function lastKey: JObject; cdecl;
    function subMap(fromKey: JObject; toKey: JObject): JSortedMap; cdecl;
    function tailMap(fromKey: JObject): JSortedMap; cdecl;
    function values: JCollection; cdecl;
  end;
  TJSortedMap = class(TJavaGenericImport<JSortedMapClass, JSortedMap>) end;

  JSpliteratorClass = interface(IJavaClass)
    ['{761CE3C7-3F2A-40D3-98D4-66816976ADDA}']
    {class} function _GetCONCURRENT: Integer; cdecl;
    {class} function _GetDISTINCT: Integer; cdecl;
    {class} function _GetIMMUTABLE: Integer; cdecl;
    {class} function _GetNONNULL: Integer; cdecl;
    {class} function _GetORDERED: Integer; cdecl;
    {class} function _GetSIZED: Integer; cdecl;
    {class} function _GetSORTED: Integer; cdecl;
    {class} function _GetSUBSIZED: Integer; cdecl;
    {class} property CONCURRENT: Integer read _GetCONCURRENT;
    {class} property DISTINCT: Integer read _GetDISTINCT;
    {class} property IMMUTABLE: Integer read _GetIMMUTABLE;
    {class} property NONNULL: Integer read _GetNONNULL;
    {class} property ORDERED: Integer read _GetORDERED;
    {class} property SIZED: Integer read _GetSIZED;
    {class} property SORTED: Integer read _GetSORTED;
    {class} property SUBSIZED: Integer read _GetSUBSIZED;
  end;

  [JavaSignature('java/util/Spliterator')]
  JSpliterator = interface(IJavaInstance)
    ['{3C0C81D2-3AA1-4C9C-973B-2C718E1E8787}']
    function characteristics: Integer; cdecl;
    function estimateSize: Int64; cdecl;
    procedure forEachRemaining(action: JConsumer); cdecl;
    function getComparator: JComparator; cdecl;
    function getExactSizeIfKnown: Int64; cdecl;
    function hasCharacteristics(characteristics: Integer): Boolean; cdecl;
    function tryAdvance(action: JConsumer): Boolean; cdecl;
    function trySplit: JSpliterator; cdecl;
  end;
  TJSpliterator = class(TJavaGenericImport<JSpliteratorClass, JSpliterator>) end;

  JSpliterator_OfPrimitiveClass = interface(JSpliteratorClass)
    ['{C97EEB5E-86A4-44C7-AE57-87B4E1DBD12B}']
  end;

  [JavaSignature('java/util/Spliterator$OfPrimitive')]
  JSpliterator_OfPrimitive = interface(JSpliterator)
    ['{59F4B88F-F844-4910-9210-364671E1E9EB}']
    procedure forEachRemaining(action: JObject); cdecl;
    function tryAdvance(action: JObject): Boolean; cdecl;
    function trySplit: JSpliterator_OfPrimitive; cdecl;
  end;
  TJSpliterator_OfPrimitive = class(TJavaGenericImport<JSpliterator_OfPrimitiveClass, JSpliterator_OfPrimitive>) end;

  JSpliterator_OfDoubleClass = interface(JSpliterator_OfPrimitiveClass)
    ['{0F3E8A32-2936-490C-9052-85EB104D90C0}']
  end;

  [JavaSignature('java/util/Spliterator$OfDouble')]
  JSpliterator_OfDouble = interface(JSpliterator_OfPrimitive)
    ['{A966A50D-7073-417F-847C-416A59E1ECF8}']
    procedure forEachRemaining(action: JDoubleConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function tryAdvance(action: JDoubleConsumer): Boolean; cdecl; overload;
    function tryAdvance(action: JConsumer): Boolean; cdecl; overload;
    function trySplit: JSpliterator_OfDouble; cdecl;
  end;
  TJSpliterator_OfDouble = class(TJavaGenericImport<JSpliterator_OfDoubleClass, JSpliterator_OfDouble>) end;

  JSpliterator_OfIntClass = interface(JSpliterator_OfPrimitiveClass)
    ['{5B4AC398-3105-447D-BE63-BA3D469D734E}']
  end;

  [JavaSignature('java/util/Spliterator$OfInt')]
  JSpliterator_OfInt = interface(JSpliterator_OfPrimitive)
    ['{4CE6C93D-43C5-4C9B-94F1-9117C16B6429}']
    procedure forEachRemaining(action: JIntConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function tryAdvance(action: JIntConsumer): Boolean; cdecl; overload;
    function tryAdvance(action: JConsumer): Boolean; cdecl; overload;
    function trySplit: JSpliterator_OfInt; cdecl;
  end;
  TJSpliterator_OfInt = class(TJavaGenericImport<JSpliterator_OfIntClass, JSpliterator_OfInt>) end;

  JSpliterator_OfLongClass = interface(JSpliterator_OfPrimitiveClass)
    ['{49370BB6-25ED-462E-BB19-33BB9E91FFE5}']
  end;

  [JavaSignature('java/util/Spliterator$OfLong')]
  JSpliterator_OfLong = interface(JSpliterator_OfPrimitive)
    ['{736FBDF1-B75F-48FA-B529-100FF6427577}']
    procedure forEachRemaining(action: JLongConsumer); cdecl; overload;
    procedure forEachRemaining(action: JConsumer); cdecl; overload;
    function tryAdvance(action: JLongConsumer): Boolean; cdecl; overload;
    function tryAdvance(action: JConsumer): Boolean; cdecl; overload;
    function trySplit: JSpliterator_OfLong; cdecl;
  end;
  TJSpliterator_OfLong = class(TJavaGenericImport<JSpliterator_OfLongClass, JSpliterator_OfLong>) end;

  JTimeZoneClass = interface(JObjectClass)
    ['{8F823620-CE10-44D5-82BA-24BFD63DCF80}']
    {class} function _GetLONG: Integer; cdecl;
    {class} function _GetSHORT: Integer; cdecl;
    {class} function init: JTimeZone; cdecl;
    {class} function getAvailableIDs(rawOffset: Integer): TJavaObjectArray<JString>; cdecl; overload;
    {class} function getAvailableIDs: TJavaObjectArray<JString>; cdecl; overload;
    {class} function getDefault: JTimeZone; cdecl;
    {class} function getTimeZone(id: JString): JTimeZone; cdecl; overload;
    {class} function getTimeZone(zoneId: JZoneId): JTimeZone; cdecl; overload;
    {class} procedure setDefault(timeZone: JTimeZone); cdecl;
    {class} property LONG: Integer read _GetLONG;
    {class} property SHORT: Integer read _GetSHORT;
  end;

  [JavaSignature('java/util/TimeZone')]
  JTimeZone = interface(JObject)
    ['{9D5215F4-A1B5-4B24-8B0B-EB3B88A0328D}']
    function clone: JObject; cdecl;
    function getDSTSavings: Integer; cdecl;
    function getDisplayName: JString; cdecl; overload;
    function getDisplayName(locale: JLocale): JString; cdecl; overload;
    function getDisplayName(daylight: Boolean; style: Integer): JString; cdecl; overload;
    function getDisplayName(daylightTime: Boolean; style: Integer; locale: JLocale): JString; cdecl; overload;
    function getID: JString; cdecl;
    function getOffset(era: Integer; year: Integer; month: Integer; day: Integer; dayOfWeek: Integer; milliseconds: Integer): Integer; cdecl; overload;
    function getOffset(date: Int64): Integer; cdecl; overload;
    function getRawOffset: Integer; cdecl;
    function hasSameRules(other: JTimeZone): Boolean; cdecl;
    function inDaylightTime(date: JDate): Boolean; cdecl;
    function observesDaylightTime: Boolean; cdecl;
    procedure setID(ID: JString); cdecl;
    procedure setRawOffset(offsetMillis: Integer); cdecl;
    function toZoneId: JZoneId; cdecl;
    function useDaylightTime: Boolean; cdecl;
  end;
  TJTimeZone = class(TJavaGenericImport<JTimeZoneClass, JTimeZone>) end;

  JTimerClass = interface(JObjectClass)
    ['{52E301A5-4F00-4743-94D1-BA38347CC59F}']
    {class} function init: JTimer; cdecl; overload;
    {class} function init(isDaemon: Boolean): JTimer; cdecl; overload;
    {class} function init(name: JString): JTimer; cdecl; overload;
    {class} function init(name: JString; isDaemon: Boolean): JTimer; cdecl; overload;
  end;

  [JavaSignature('java/util/Timer')]
  JTimer = interface(JObject)
    ['{131F841C-9357-49F0-A688-9AC5506F4C5A}']
    procedure cancel; cdecl;
    function purge: Integer; cdecl;
    procedure schedule(task: JTimerTask; delay: Int64); cdecl; overload;
    procedure schedule(task: JTimerTask; time: JDate); cdecl; overload;
    procedure schedule(task: JTimerTask; delay: Int64; period: Int64); cdecl; overload;
    procedure schedule(task: JTimerTask; firstTime: JDate; period: Int64); cdecl; overload;
    procedure scheduleAtFixedRate(task: JTimerTask; delay: Int64; period: Int64); cdecl; overload;
    procedure scheduleAtFixedRate(task: JTimerTask; firstTime: JDate; period: Int64); cdecl; overload;
  end;
  TJTimer = class(TJavaGenericImport<JTimerClass, JTimer>) end;

  JTimerTaskClass = interface(JObjectClass)
    ['{DC15DA86-BDCC-42A9-8B9D-7348D4AE0F13}']
  end;

  [JavaSignature('java/util/TimerTask')]
  JTimerTask = interface(JObject)
    ['{B01AA454-6E9B-4A26-A31E-8D9A32E59816}']
    function cancel: Boolean; cdecl;
    procedure run; cdecl;
    function scheduledExecutionTime: Int64; cdecl;
  end;
  TJTimerTask = class(TJavaGenericImport<JTimerTaskClass, JTimerTask>) end;

  JUUIDClass = interface(JObjectClass)
    ['{F254C874-67C8-4832-9619-9F686CB8E466}']
    {class} function init(mostSigBits: Int64; leastSigBits: Int64): JUUID; cdecl;
    {class} function fromString(name: JString): JUUID; cdecl;
    {class} function nameUUIDFromBytes(name: TJavaArray<Byte>): JUUID; cdecl;
    {class} function randomUUID: JUUID; cdecl;
  end;

  [JavaSignature('java/util/UUID')]
  JUUID = interface(JObject)
    ['{B280C48F-E064-4030-BFD0-FB5970A78101}']
    function clockSequence: Integer; cdecl;
    function compareTo(val: JUUID): Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function getLeastSignificantBits: Int64; cdecl;
    function getMostSignificantBits: Int64; cdecl;
    function hashCode: Integer; cdecl;
    function node: Int64; cdecl;
    function timestamp: Int64; cdecl;
    function toString: JString; cdecl;
    function variant: Integer; cdecl;
    function version: Integer; cdecl;
  end;
  TJUUID = class(TJavaGenericImport<JUUIDClass, JUUID>) end;

  JAbstractExecutorServiceClass = interface(JObjectClass)
    ['{3896A98A-B273-4500-B0D5-F7D69CD7D49E}']
    {class} function init: JAbstractExecutorService; cdecl;
  end;

  [JavaSignature('java/util/concurrent/AbstractExecutorService')]
  JAbstractExecutorService = interface(JObject)
    ['{7A846346-CB8B-442D-A705-40CB673B7A84}']
    function invokeAll(tasks: JCollection): JList; cdecl; overload;
    function invokeAll(tasks: JCollection; timeout: Int64; unit_: JTimeUnit): JList; cdecl; overload;
    function invokeAny(tasks: JCollection): JObject; cdecl; overload;
    function invokeAny(tasks: JCollection; timeout: Int64; unit_: JTimeUnit): JObject; cdecl; overload;
    function submit(task: JRunnable): JFuture; cdecl; overload;
    function submit(task: JRunnable; result: JObject): JFuture; cdecl; overload;
    function submit(task: JCallable): JFuture; cdecl; overload;
  end;
  TJAbstractExecutorService = class(TJavaGenericImport<JAbstractExecutorServiceClass, JAbstractExecutorService>) end;

  JBlockingQueueClass = interface(JQueueClass)
    ['{FEAC4030-F87A-4E78-9454-A48238AC00D8}']
  end;

  [JavaSignature('java/util/concurrent/BlockingQueue')]
  JBlockingQueue = interface(JQueue)
    ['{4F92390A-DED1-405E-894E-656C3AD20695}']
    function add(e: JObject): Boolean; cdecl;
    function &contains(o: JObject): Boolean; cdecl;
    function drainTo(c: JCollection): Integer; cdecl; overload;
    function drainTo(c: JCollection; maxElements: Integer): Integer; cdecl; overload;
    function offer(e: JObject): Boolean; cdecl; overload;
    function offer(e: JObject; timeout: Int64; unit_: JTimeUnit): Boolean; cdecl; overload;
    function poll(timeout: Int64; unit_: JTimeUnit): JObject; cdecl;
    procedure put(e: JObject); cdecl;
    function remainingCapacity: Integer; cdecl;
    function remove(o: JObject): Boolean; cdecl;
    function take: JObject; cdecl;
  end;
  TJBlockingQueue = class(TJavaGenericImport<JBlockingQueueClass, JBlockingQueue>) end;

  JCallableClass = interface(IJavaClass)
    ['{F12DB2A8-1E01-44A9-BFBE-C6F3E32F7A65}']
  end;

  [JavaSignature('java/util/concurrent/Callable')]
  JCallable = interface(IJavaInstance)
    ['{071A2E40-747B-4702-8DDB-D1749FB9B8FD}']
    function call: JObject; cdecl;
  end;
  TJCallable = class(TJavaGenericImport<JCallableClass, JCallable>) end;

  JCountDownLatchClass = interface(JObjectClass)
    ['{8BB952D3-8BF8-4704-BC03-DCE2997C03AC}']
    {class} function init(count: Integer): JCountDownLatch; cdecl;
  end;

  [JavaSignature('java/util/concurrent/CountDownLatch')]
  JCountDownLatch = interface(JObject)
    ['{302AA7D1-4CD0-45CB-868F-C1CF1209D276}']
    procedure await; cdecl; overload;
    function await(timeout: Int64; unit_: JTimeUnit): Boolean; cdecl; overload;
    procedure countDown; cdecl;
    function getCount: Int64; cdecl;
    function toString: JString; cdecl;
  end;
  TJCountDownLatch = class(TJavaGenericImport<JCountDownLatchClass, JCountDownLatch>) end;

  JDelayedClass = interface(JComparableClass)
    ['{67CD6011-1F40-4BCA-9E24-EDA55F6A4EA1}']
  end;

  [JavaSignature('java/util/concurrent/Delayed')]
  JDelayed = interface(JComparable)
    ['{2BE364E4-9B4A-4A34-BDED-D1D9773530BF}']
    function getDelay(unit_: JTimeUnit): Int64; cdecl;
  end;
  TJDelayed = class(TJavaGenericImport<JDelayedClass, JDelayed>) end;

  JExecutorClass = interface(IJavaClass)
    ['{0606DEEF-30E1-4E40-82A3-20FF3E89BD61}']
  end;

  [JavaSignature('java/util/concurrent/Executor')]
  JExecutor = interface(IJavaInstance)
    ['{B846ECEE-83CF-40BB-A4C5-FFC949DCEF15}']
    procedure execute(command: JRunnable); cdecl;
  end;
  TJExecutor = class(TJavaGenericImport<JExecutorClass, JExecutor>) end;

  JExecutorServiceClass = interface(JExecutorClass)
    ['{4CF14DA3-BA41-4F67-A2DE-F62C8B02177F}']
  end;

  [JavaSignature('java/util/concurrent/ExecutorService')]
  JExecutorService = interface(JExecutor)
    ['{37810DA0-1254-423D-B181-C62455CB5AE4}']
    function awaitTermination(timeout: Int64; unit_: JTimeUnit): Boolean; cdecl;
    function invokeAll(tasks: JCollection): JList; cdecl; overload;
    function invokeAll(tasks: JCollection; timeout: Int64; unit_: JTimeUnit): JList; cdecl; overload;
    function invokeAny(tasks: JCollection): JObject; cdecl; overload;
    function invokeAny(tasks: JCollection; timeout: Int64; unit_: JTimeUnit): JObject; cdecl; overload;
    function isShutdown: Boolean; cdecl;
    function isTerminated: Boolean; cdecl;
    procedure shutdown; cdecl;
    function shutdownNow: JList; cdecl;
    function submit(task: JCallable): JFuture; cdecl; overload;
    function submit(task: JRunnable; result: JObject): JFuture; cdecl; overload;
    function submit(task: JRunnable): JFuture; cdecl; overload;
  end;
  TJExecutorService = class(TJavaGenericImport<JExecutorServiceClass, JExecutorService>) end;

  JFutureClass = interface(IJavaClass)
    ['{1716BCA6-301F-4D84-956C-AC25D1787B40}']
  end;

  [JavaSignature('java/util/concurrent/Future')]
  JFuture = interface(IJavaInstance)
    ['{EFD52756-9DF1-45BD-9E0D-A36E3CDE3DB9}']
    function cancel(mayInterruptIfRunning: Boolean): Boolean; cdecl;
    function &get: JObject; cdecl; overload;
    function &get(timeout: Int64; unit_: JTimeUnit): JObject; cdecl; overload;
    function isCancelled: Boolean; cdecl;
    function isDone: Boolean; cdecl;
  end;
  TJFuture = class(TJavaGenericImport<JFutureClass, JFuture>) end;

  JRejectedExecutionHandlerClass = interface(IJavaClass)
    ['{59CBB7C6-368F-446D-92CB-DB8638AE3BBD}']
  end;

  [JavaSignature('java/util/concurrent/RejectedExecutionHandler')]
  JRejectedExecutionHandler = interface(IJavaInstance)
    ['{F75637CF-D111-4DE1-9820-CA00A2AA17C7}']
    procedure rejectedExecution(r: JRunnable; executor: JThreadPoolExecutor); cdecl;
  end;
  TJRejectedExecutionHandler = class(TJavaGenericImport<JRejectedExecutionHandlerClass, JRejectedExecutionHandler>) end;

  JScheduledFutureClass = interface(JDelayedClass)
    ['{6AEAD91E-6D96-4057-BD8D-8B28E3833E7E}']
  end;

  [JavaSignature('java/util/concurrent/ScheduledFuture')]
  JScheduledFuture = interface(JDelayed)
    ['{0D2AEB43-60E8-4488-9260-15E693B853DD}']
  end;
  TJScheduledFuture = class(TJavaGenericImport<JScheduledFutureClass, JScheduledFuture>) end;

  JThreadPoolExecutorClass = interface(JAbstractExecutorServiceClass)
    ['{DDC3110F-84AA-41F1-9D0F-9800A406A8A8}']
    {class} function init(corePoolSize: Integer; maximumPoolSize: Integer; keepAliveTime: Int64; unit_: JTimeUnit; workQueue: JBlockingQueue): JThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; maximumPoolSize: Integer; keepAliveTime: Int64; unit_: JTimeUnit; workQueue: JBlockingQueue; threadFactory: JThreadFactory): JThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; maximumPoolSize: Integer; keepAliveTime: Int64; unit_: JTimeUnit; workQueue: JBlockingQueue; handler: JRejectedExecutionHandler): JThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; maximumPoolSize: Integer; keepAliveTime: Int64; unit_: JTimeUnit; workQueue: JBlockingQueue; threadFactory: JThreadFactory; handler: JRejectedExecutionHandler): JThreadPoolExecutor; cdecl; overload;
  end;

  [JavaSignature('java/util/concurrent/ThreadPoolExecutor')]
  JThreadPoolExecutor = interface(JAbstractExecutorService)
    ['{866B2F57-7E31-4566-876F-4A35D526D76C}']
    procedure allowCoreThreadTimeOut(value: Boolean); cdecl;
    function allowsCoreThreadTimeOut: Boolean; cdecl;
    function awaitTermination(timeout: Int64; unit_: JTimeUnit): Boolean; cdecl;
    procedure execute(command: JRunnable); cdecl;
    function getActiveCount: Integer; cdecl;
    function getCompletedTaskCount: Int64; cdecl;
    function getCorePoolSize: Integer; cdecl;
    function getKeepAliveTime(unit_: JTimeUnit): Int64; cdecl;
    function getLargestPoolSize: Integer; cdecl;
    function getMaximumPoolSize: Integer; cdecl;
    function getPoolSize: Integer; cdecl;
    function getQueue: JBlockingQueue; cdecl;
    function getRejectedExecutionHandler: JRejectedExecutionHandler; cdecl;
    function getTaskCount: Int64; cdecl;
    function getThreadFactory: JThreadFactory; cdecl;
    function isShutdown: Boolean; cdecl;
    function isTerminated: Boolean; cdecl;
    function isTerminating: Boolean; cdecl;
    function prestartAllCoreThreads: Integer; cdecl;
    function prestartCoreThread: Boolean; cdecl;
    procedure purge; cdecl;
    function remove(task: JRunnable): Boolean; cdecl;
    procedure setCorePoolSize(corePoolSize: Integer); cdecl;
    procedure setKeepAliveTime(time: Int64; unit_: JTimeUnit); cdecl;
    procedure setMaximumPoolSize(maximumPoolSize: Integer); cdecl;
    procedure setRejectedExecutionHandler(handler: JRejectedExecutionHandler); cdecl;
    procedure setThreadFactory(threadFactory: JThreadFactory); cdecl;
    procedure shutdown; cdecl;
    function shutdownNow: JList; cdecl;
    function toString: JString; cdecl;
  end;
  TJThreadPoolExecutor = class(TJavaGenericImport<JThreadPoolExecutorClass, JThreadPoolExecutor>) end;

  JScheduledThreadPoolExecutorClass = interface(JThreadPoolExecutorClass)
    ['{E97835A3-4211-4A02-AC53-E0951A70BFCE}']
    {class} function init(corePoolSize: Integer): JScheduledThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; threadFactory: JThreadFactory): JScheduledThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; handler: JRejectedExecutionHandler): JScheduledThreadPoolExecutor; cdecl; overload;
    {class} function init(corePoolSize: Integer; threadFactory: JThreadFactory; handler: JRejectedExecutionHandler): JScheduledThreadPoolExecutor; cdecl; overload;
  end;

  [JavaSignature('java/util/concurrent/ScheduledThreadPoolExecutor')]
  JScheduledThreadPoolExecutor = interface(JThreadPoolExecutor)
    ['{7E9D716D-A52D-440A-B55A-21B9832960C6}']
    procedure execute(command: JRunnable); cdecl;
    function getContinueExistingPeriodicTasksAfterShutdownPolicy: Boolean; cdecl;
    function getExecuteExistingDelayedTasksAfterShutdownPolicy: Boolean; cdecl;
    function getQueue: JBlockingQueue; cdecl;
    function getRemoveOnCancelPolicy: Boolean; cdecl;
    function schedule(command: JRunnable; delay: Int64; unit_: JTimeUnit): JScheduledFuture; cdecl; overload;
    function schedule(callable: JCallable; delay: Int64; unit_: JTimeUnit): JScheduledFuture; cdecl; overload;
    function scheduleAtFixedRate(command: JRunnable; initialDelay: Int64; period: Int64; unit_: JTimeUnit): JScheduledFuture; cdecl;
    function scheduleWithFixedDelay(command: JRunnable; initialDelay: Int64; delay: Int64; unit_: JTimeUnit): JScheduledFuture; cdecl;
    procedure setContinueExistingPeriodicTasksAfterShutdownPolicy(value: Boolean); cdecl;
    procedure setExecuteExistingDelayedTasksAfterShutdownPolicy(value: Boolean); cdecl;
    procedure setRemoveOnCancelPolicy(value: Boolean); cdecl;
    procedure shutdown; cdecl;
    function shutdownNow: JList; cdecl;
    function submit(task: JRunnable): JFuture; cdecl; overload;
    function submit(task: JRunnable; result: JObject): JFuture; cdecl; overload;
    function submit(task: JCallable): JFuture; cdecl; overload;
  end;
  TJScheduledThreadPoolExecutor = class(TJavaGenericImport<JScheduledThreadPoolExecutorClass, JScheduledThreadPoolExecutor>) end;

  JThreadFactoryClass = interface(IJavaClass)
    ['{CD4277E8-4960-409B-B76C-70D202901E27}']
  end;

  [JavaSignature('java/util/concurrent/ThreadFactory')]
  JThreadFactory = interface(IJavaInstance)
    ['{D96A16B3-CE4E-4293-9BB0-FE84575F7E19}']
    function newThread(r: JRunnable): JThread; cdecl;
  end;
  TJThreadFactory = class(TJavaGenericImport<JThreadFactoryClass, JThreadFactory>) end;

  JTimeUnitClass = interface(JEnumClass)
    ['{005AE9B1-228D-48C4-BFD2-41DCEE712F3B}']
    {class} function _GetDAYS: JTimeUnit; cdecl;
    {class} function _GetHOURS: JTimeUnit; cdecl;
    {class} function _GetMICROSECONDS: JTimeUnit; cdecl;
    {class} function _GetMILLISECONDS: JTimeUnit; cdecl;
    {class} function _GetMINUTES: JTimeUnit; cdecl;
    {class} function _GetNANOSECONDS: JTimeUnit; cdecl;
    {class} function _GetSECONDS: JTimeUnit; cdecl;
    {class} function valueOf(name: JString): JTimeUnit; cdecl;
    {class} function values: TJavaObjectArray<JTimeUnit>; cdecl;
    {class} property DAYS: JTimeUnit read _GetDAYS;
    {class} property HOURS: JTimeUnit read _GetHOURS;
    {class} property MICROSECONDS: JTimeUnit read _GetMICROSECONDS;
    {class} property MILLISECONDS: JTimeUnit read _GetMILLISECONDS;
    {class} property MINUTES: JTimeUnit read _GetMINUTES;
    {class} property NANOSECONDS: JTimeUnit read _GetNANOSECONDS;
    {class} property SECONDS: JTimeUnit read _GetSECONDS;
  end;

  [JavaSignature('java/util/concurrent/TimeUnit')]
  JTimeUnit = interface(JEnum)
    ['{97B8E3BD-6430-4597-B01D-CD2AD51ECB2C}']
    function convert(sourceDuration: Int64; sourceUnit: JTimeUnit): Int64; cdecl;
    procedure sleep(timeout: Int64); cdecl;
    procedure timedJoin(thread: JThread; timeout: Int64); cdecl;
    procedure timedWait(obj: JObject; timeout: Int64); cdecl;
    function toDays(duration: Int64): Int64; cdecl;
    function toHours(duration: Int64): Int64; cdecl;
    function toMicros(duration: Int64): Int64; cdecl;
    function toMillis(duration: Int64): Int64; cdecl;
    function toMinutes(duration: Int64): Int64; cdecl;
    function toNanos(duration: Int64): Int64; cdecl;
    function toSeconds(duration: Int64): Int64; cdecl;
  end;
  TJTimeUnit = class(TJavaGenericImport<JTimeUnitClass, JTimeUnit>) end;

  JBiConsumerClass = interface(IJavaClass)
    ['{065BE993-4F2C-4871-9031-CC7C43C8D0AE}']
  end;

  [JavaSignature('java/util/function/BiConsumer')]
  JBiConsumer = interface(IJavaInstance)
    ['{5BAC9E18-EBE9-48E2-9773-E2E3B3804787}']
    procedure accept(t: JObject; u: JObject); cdecl;
    function andThen(after: JBiConsumer): JBiConsumer; cdecl;
  end;
  TJBiConsumer = class(TJavaGenericImport<JBiConsumerClass, JBiConsumer>) end;

  JBiFunctionClass = interface(IJavaClass)
    ['{5464C002-1FDC-48A1-A77A-E5FA20D8CF59}']
  end;

  [JavaSignature('java/util/function/BiFunction')]
  JBiFunction = interface(IJavaInstance)
    ['{EF9FF082-16D1-480E-AA7F-3CB4B4DC778A}']
    function andThen(after: JFunction): JBiFunction; cdecl;
    function apply(t: JObject; u: JObject): JObject; cdecl;
  end;
  TJBiFunction = class(TJavaGenericImport<JBiFunctionClass, JBiFunction>) end;

  JBinaryOperatorClass = interface(JBiFunctionClass)
    ['{95EEBC66-5B49-414A-8368-11A14437F334}']
    {class} function maxBy(comparator: JComparator): JBinaryOperator; cdecl;
    {class} function minBy(comparator: JComparator): JBinaryOperator; cdecl;
  end;

  [JavaSignature('java/util/function/BinaryOperator')]
  JBinaryOperator = interface(JBiFunction)
    ['{EEECC7C7-BFC2-4927-89D2-73D755113D1E}']
  end;
  TJBinaryOperator = class(TJavaGenericImport<JBinaryOperatorClass, JBinaryOperator>) end;

  JConsumerClass = interface(IJavaClass)
    ['{FD2040AB-3E2C-427F-9785-6F7D63AD1B30}']
  end;

  [JavaSignature('java/util/function/Consumer')]
  JConsumer = interface(IJavaInstance)
    ['{FA3FC0D0-8321-4890-9A76-43297FB1D573}']
    procedure accept(t: JObject); cdecl;
    function andThen(after: JConsumer): JConsumer; cdecl;
  end;
  TJConsumer = class(TJavaGenericImport<JConsumerClass, JConsumer>) end;

  JDoubleBinaryOperatorClass = interface(IJavaClass)
    ['{B3CBC9D2-7198-4AEA-AFAB-BE8BE48EED4D}']
  end;

  [JavaSignature('java/util/function/DoubleBinaryOperator')]
  JDoubleBinaryOperator = interface(IJavaInstance)
    ['{DADEB50A-87CB-419E-A485-278D4DA3EF5D}']
    function applyAsDouble(left: Double; right: Double): Double; cdecl;
  end;
  TJDoubleBinaryOperator = class(TJavaGenericImport<JDoubleBinaryOperatorClass, JDoubleBinaryOperator>) end;

  JDoubleConsumerClass = interface(IJavaClass)
    ['{83FD623D-BDE6-4FCE-A7DA-3BA39294EBCC}']
  end;

  [JavaSignature('java/util/function/DoubleConsumer')]
  JDoubleConsumer = interface(IJavaInstance)
    ['{264EB215-0144-445D-BB7E-AEE42056AC61}']
    procedure accept(value: Double); cdecl;
    function andThen(after: JDoubleConsumer): JDoubleConsumer; cdecl;
  end;
  TJDoubleConsumer = class(TJavaGenericImport<JDoubleConsumerClass, JDoubleConsumer>) end;

  JDoubleFunctionClass = interface(IJavaClass)
    ['{3DAA0C36-4EB9-4957-BEAD-3FB92C0D0017}']
  end;

  [JavaSignature('java/util/function/DoubleFunction')]
  JDoubleFunction = interface(IJavaInstance)
    ['{0332F11A-0C95-4329-99CE-B518E0F1D165}']
    function apply(value: Double): JObject; cdecl;
  end;
  TJDoubleFunction = class(TJavaGenericImport<JDoubleFunctionClass, JDoubleFunction>) end;

  JDoublePredicateClass = interface(IJavaClass)
    ['{D2568D36-370F-46DD-9B99-F0027FE19331}']
  end;

  [JavaSignature('java/util/function/DoublePredicate')]
  JDoublePredicate = interface(IJavaInstance)
    ['{1670F5A4-68D1-4D46-8448-9EBCE7A81A0C}']
    function &and(other: JDoublePredicate): JDoublePredicate; cdecl;
    function negate: JDoublePredicate; cdecl;
    function &or(other: JDoublePredicate): JDoublePredicate; cdecl;
    function test(value: Double): Boolean; cdecl;
  end;
  TJDoublePredicate = class(TJavaGenericImport<JDoublePredicateClass, JDoublePredicate>) end;

  JDoubleSupplierClass = interface(IJavaClass)
    ['{6AA866F7-143D-41B7-BDAB-6E5CA99864C3}']
  end;

  [JavaSignature('java/util/function/DoubleSupplier')]
  JDoubleSupplier = interface(IJavaInstance)
    ['{CD96F65D-B6FA-458E-9D90-75DF4A3259BD}']
    function getAsDouble: Double; cdecl;
  end;
  TJDoubleSupplier = class(TJavaGenericImport<JDoubleSupplierClass, JDoubleSupplier>) end;

  JDoubleToIntFunctionClass = interface(IJavaClass)
    ['{44D077FE-ADB6-451F-A7F5-F352EFF13F62}']
  end;

  [JavaSignature('java/util/function/DoubleToIntFunction')]
  JDoubleToIntFunction = interface(IJavaInstance)
    ['{83A128F0-9C61-4531-8317-BD8811A9FD45}']
    function applyAsInt(value: Double): Integer; cdecl;
  end;
  TJDoubleToIntFunction = class(TJavaGenericImport<JDoubleToIntFunctionClass, JDoubleToIntFunction>) end;

  JDoubleToLongFunctionClass = interface(IJavaClass)
    ['{1BCACF79-4F3E-43DF-A5E9-CE81B1FC57A7}']
  end;

  [JavaSignature('java/util/function/DoubleToLongFunction')]
  JDoubleToLongFunction = interface(IJavaInstance)
    ['{3C9BEE45-29C0-45E7-9393-367C99E61D96}']
    function applyAsLong(value: Double): Int64; cdecl;
  end;
  TJDoubleToLongFunction = class(TJavaGenericImport<JDoubleToLongFunctionClass, JDoubleToLongFunction>) end;

  JDoubleUnaryOperatorClass = interface(IJavaClass)
    ['{1C90EDBB-50AE-415B-938B-7620D852FA18}']
    {class} function identity: JDoubleUnaryOperator; cdecl;
  end;

  [JavaSignature('java/util/function/DoubleUnaryOperator')]
  JDoubleUnaryOperator = interface(IJavaInstance)
    ['{9760D589-5CA6-4D36-8886-B3A3D2E797A5}']
    function andThen(after: JDoubleUnaryOperator): JDoubleUnaryOperator; cdecl;
    function applyAsDouble(operand: Double): Double; cdecl;
    function compose(before: JDoubleUnaryOperator): JDoubleUnaryOperator; cdecl;
  end;
  TJDoubleUnaryOperator = class(TJavaGenericImport<JDoubleUnaryOperatorClass, JDoubleUnaryOperator>) end;

  JFunctionClass = interface(IJavaClass)
    ['{B894BE7C-C2EB-4FBD-82F2-5143E3C72087}']
    {class} function identity: JFunction; cdecl;
  end;

  [JavaSignature('java/util/function/Function')]
  JFunction = interface(IJavaInstance)
    ['{DE3AF3E0-AAC1-4F16-AE6F-8BDEE45712A5}']
    function andThen(after: JFunction): JFunction; cdecl;
    function apply(t: JObject): JObject; cdecl;
    function compose(before: JFunction): JFunction; cdecl;
  end;
  TJFunction = class(TJavaGenericImport<JFunctionClass, JFunction>) end;

  JIntBinaryOperatorClass = interface(IJavaClass)
    ['{D3FCC9B0-D9EC-4D50-A62D-41B1DF086A30}']
  end;

  [JavaSignature('java/util/function/IntBinaryOperator')]
  JIntBinaryOperator = interface(IJavaInstance)
    ['{A1B427B4-961D-4AAF-AF87-692D18530032}']
    function applyAsInt(left: Integer; right: Integer): Integer; cdecl;
  end;
  TJIntBinaryOperator = class(TJavaGenericImport<JIntBinaryOperatorClass, JIntBinaryOperator>) end;

  JIntConsumerClass = interface(IJavaClass)
    ['{8355AAF9-C5F8-48D9-A37F-96B167063465}']
  end;

  [JavaSignature('java/util/function/IntConsumer')]
  JIntConsumer = interface(IJavaInstance)
    ['{716831E0-3045-4BC6-BD4B-9CC2AFBAE951}']
    procedure accept(value: Integer); cdecl;
    function andThen(after: JIntConsumer): JIntConsumer; cdecl;
  end;
  TJIntConsumer = class(TJavaGenericImport<JIntConsumerClass, JIntConsumer>) end;

  JIntFunctionClass = interface(IJavaClass)
    ['{A1DBACC3-3DB3-4C44-948E-0B56328EC56A}']
  end;

  [JavaSignature('java/util/function/IntFunction')]
  JIntFunction = interface(IJavaInstance)
    ['{4C584C4F-CC64-464F-968F-3C96F00D1F2F}']
    function apply(value: Integer): JObject; cdecl;
  end;
  TJIntFunction = class(TJavaGenericImport<JIntFunctionClass, JIntFunction>) end;

  JIntPredicateClass = interface(IJavaClass)
    ['{3DC5487F-7B58-46A1-992D-471E84750E5C}']
  end;

  [JavaSignature('java/util/function/IntPredicate')]
  JIntPredicate = interface(IJavaInstance)
    ['{907EE188-53BE-435F-AFEB-65B0373D9B4D}']
    function &and(other: JIntPredicate): JIntPredicate; cdecl;
    function negate: JIntPredicate; cdecl;
    function &or(other: JIntPredicate): JIntPredicate; cdecl;
    function test(value: Integer): Boolean; cdecl;
  end;
  TJIntPredicate = class(TJavaGenericImport<JIntPredicateClass, JIntPredicate>) end;

  JIntSupplierClass = interface(IJavaClass)
    ['{34E94E9A-70CD-4EC7-A7AB-A930564D649A}']
  end;

  [JavaSignature('java/util/function/IntSupplier')]
  JIntSupplier = interface(IJavaInstance)
    ['{F933802B-916C-4BF4-91B0-EB8355583150}']
    function getAsInt: Integer; cdecl;
  end;
  TJIntSupplier = class(TJavaGenericImport<JIntSupplierClass, JIntSupplier>) end;

  JIntToDoubleFunctionClass = interface(IJavaClass)
    ['{ADC1836D-7074-4FB5-87EC-5EF0B09B89A8}']
  end;

  [JavaSignature('java/util/function/IntToDoubleFunction')]
  JIntToDoubleFunction = interface(IJavaInstance)
    ['{0CB8806D-99B5-4E0F-A6D4-0E474B509D44}']
    function applyAsDouble(value: Integer): Double; cdecl;
  end;
  TJIntToDoubleFunction = class(TJavaGenericImport<JIntToDoubleFunctionClass, JIntToDoubleFunction>) end;

  JIntToLongFunctionClass = interface(IJavaClass)
    ['{E26F1631-0AC6-433D-B248-58AD7F77BBF9}']
  end;

  [JavaSignature('java/util/function/IntToLongFunction')]
  JIntToLongFunction = interface(IJavaInstance)
    ['{41177A7E-3C96-428D-BFD1-FAB2B93AE1AA}']
    function applyAsLong(value: Integer): Int64; cdecl;
  end;
  TJIntToLongFunction = class(TJavaGenericImport<JIntToLongFunctionClass, JIntToLongFunction>) end;

  JIntUnaryOperatorClass = interface(IJavaClass)
    ['{D49C6AD7-D088-44A5-B2BD-4918638B974E}']
    {class} function identity: JIntUnaryOperator; cdecl;
  end;

  [JavaSignature('java/util/function/IntUnaryOperator')]
  JIntUnaryOperator = interface(IJavaInstance)
    ['{90D5FDB0-F70A-4575-BB9A-DFE77B24BC4E}']
    function andThen(after: JIntUnaryOperator): JIntUnaryOperator; cdecl;
    function applyAsInt(operand: Integer): Integer; cdecl;
    function compose(before: JIntUnaryOperator): JIntUnaryOperator; cdecl;
  end;
  TJIntUnaryOperator = class(TJavaGenericImport<JIntUnaryOperatorClass, JIntUnaryOperator>) end;

  JLongBinaryOperatorClass = interface(IJavaClass)
    ['{956BB45E-C61D-42BC-8216-FD9701523DD9}']
  end;

  [JavaSignature('java/util/function/LongBinaryOperator')]
  JLongBinaryOperator = interface(IJavaInstance)
    ['{D6D37837-D052-4CC5-966E-C2C45FEE43E2}']
    function applyAsLong(left: Int64; right: Int64): Int64; cdecl;
  end;
  TJLongBinaryOperator = class(TJavaGenericImport<JLongBinaryOperatorClass, JLongBinaryOperator>) end;

  JLongConsumerClass = interface(IJavaClass)
    ['{0387FD41-8255-4EF0-B5C4-C030D16AE68E}']
  end;

  [JavaSignature('java/util/function/LongConsumer')]
  JLongConsumer = interface(IJavaInstance)
    ['{3AE22FBB-7203-4AC4-B04F-71863C48C074}']
    procedure accept(value: Int64); cdecl;
    function andThen(after: JLongConsumer): JLongConsumer; cdecl;
  end;
  TJLongConsumer = class(TJavaGenericImport<JLongConsumerClass, JLongConsumer>) end;

  JLongFunctionClass = interface(IJavaClass)
    ['{F385D73D-A40A-4C56-95CA-3049ADA213E1}']
  end;

  [JavaSignature('java/util/function/LongFunction')]
  JLongFunction = interface(IJavaInstance)
    ['{C155EBFD-B19B-4757-9F25-207CC8C95612}']
    function apply(value: Int64): JObject; cdecl;
  end;
  TJLongFunction = class(TJavaGenericImport<JLongFunctionClass, JLongFunction>) end;

  JLongPredicateClass = interface(IJavaClass)
    ['{E7323BC2-F6D3-4141-9E06-430D82F04A06}']
  end;

  [JavaSignature('java/util/function/LongPredicate')]
  JLongPredicate = interface(IJavaInstance)
    ['{C099E986-10A1-4E8A-B24D-2FFB9811127D}']
    function &and(other: JLongPredicate): JLongPredicate; cdecl;
    function negate: JLongPredicate; cdecl;
    function &or(other: JLongPredicate): JLongPredicate; cdecl;
    function test(value: Int64): Boolean; cdecl;
  end;
  TJLongPredicate = class(TJavaGenericImport<JLongPredicateClass, JLongPredicate>) end;

  JLongSupplierClass = interface(IJavaClass)
    ['{AB5EB526-40B1-4750-B093-3C48C27E18E5}']
  end;

  [JavaSignature('java/util/function/LongSupplier')]
  JLongSupplier = interface(IJavaInstance)
    ['{90C098B2-7AC7-4A38-8955-506278DEC571}']
    function getAsLong: Int64; cdecl;
  end;
  TJLongSupplier = class(TJavaGenericImport<JLongSupplierClass, JLongSupplier>) end;

  JLongToDoubleFunctionClass = interface(IJavaClass)
    ['{A6A2D00E-2B16-4949-9C8F-EF94D4F3CEC8}']
  end;

  [JavaSignature('java/util/function/LongToDoubleFunction')]
  JLongToDoubleFunction = interface(IJavaInstance)
    ['{DF437697-4236-4220-ABA2-6C275D7A5D55}']
    function applyAsDouble(value: Int64): Double; cdecl;
  end;
  TJLongToDoubleFunction = class(TJavaGenericImport<JLongToDoubleFunctionClass, JLongToDoubleFunction>) end;

  JLongToIntFunctionClass = interface(IJavaClass)
    ['{F735EE2D-7F52-4A44-889C-C323F02B0240}']
  end;

  [JavaSignature('java/util/function/LongToIntFunction')]
  JLongToIntFunction = interface(IJavaInstance)
    ['{1E9E6841-D548-4AA9-BA1C-27546BACE98C}']
    function applyAsInt(value: Int64): Integer; cdecl;
  end;
  TJLongToIntFunction = class(TJavaGenericImport<JLongToIntFunctionClass, JLongToIntFunction>) end;

  JLongUnaryOperatorClass = interface(IJavaClass)
    ['{68D59977-B642-4966-B697-37ED7B906931}']
    {class} function identity: JLongUnaryOperator; cdecl;
  end;

  [JavaSignature('java/util/function/LongUnaryOperator')]
  JLongUnaryOperator = interface(IJavaInstance)
    ['{4E259A17-47EA-451A-B168-903CAB3E7208}']
    function andThen(after: JLongUnaryOperator): JLongUnaryOperator; cdecl;
    function applyAsLong(operand: Int64): Int64; cdecl;
    function compose(before: JLongUnaryOperator): JLongUnaryOperator; cdecl;
  end;
  TJLongUnaryOperator = class(TJavaGenericImport<JLongUnaryOperatorClass, JLongUnaryOperator>) end;

  JObjDoubleConsumerClass = interface(IJavaClass)
    ['{36A487A2-5A35-461E-BA24-9304EBBCDC5F}']
  end;

  [JavaSignature('java/util/function/ObjDoubleConsumer')]
  JObjDoubleConsumer = interface(IJavaInstance)
    ['{251FBA8B-B3E2-4481-A9FE-9150E9EE6520}']
    procedure accept(t: JObject; value: Double); cdecl;
  end;
  TJObjDoubleConsumer = class(TJavaGenericImport<JObjDoubleConsumerClass, JObjDoubleConsumer>) end;

  JObjIntConsumerClass = interface(IJavaClass)
    ['{E0BEE2E8-43E1-4122-9B4E-BDA7F0B289E6}']
  end;

  [JavaSignature('java/util/function/ObjIntConsumer')]
  JObjIntConsumer = interface(IJavaInstance)
    ['{998BBD5D-EE86-4B8A-9211-AA1362C55E51}']
    procedure accept(t: JObject; value: Integer); cdecl;
  end;
  TJObjIntConsumer = class(TJavaGenericImport<JObjIntConsumerClass, JObjIntConsumer>) end;

  JObjLongConsumerClass = interface(IJavaClass)
    ['{C26427D1-9159-4F57-BD51-6225CC9294FB}']
  end;

  [JavaSignature('java/util/function/ObjLongConsumer')]
  JObjLongConsumer = interface(IJavaInstance)
    ['{AECB9A3F-0DF8-44A4-B3A0-149EB31ACA28}']
    procedure accept(t: JObject; value: Int64); cdecl;
  end;
  TJObjLongConsumer = class(TJavaGenericImport<JObjLongConsumerClass, JObjLongConsumer>) end;

  Jfunction_PredicateClass = interface(IJavaClass)
    ['{959B15C1-7ABA-41B2-880C-AF80340211CF}']
    {class} function isEqual(targetRef: JObject): Jfunction_Predicate; cdecl;
  end;

  [JavaSignature('java/util/function/Predicate')]
  Jfunction_Predicate = interface(IJavaInstance)
    ['{CEEE51CA-6A23-4AC9-B2E2-24EC48DD6AA7}']
    function &and(other: Jfunction_Predicate): Jfunction_Predicate; cdecl;
    function negate: Jfunction_Predicate; cdecl;
    function &or(other: Jfunction_Predicate): Jfunction_Predicate; cdecl;
    function test(t: JObject): Boolean; cdecl;
  end;
  TJfunction_Predicate = class(TJavaGenericImport<Jfunction_PredicateClass, Jfunction_Predicate>) end;

  JSupplierClass = interface(IJavaClass)
    ['{04A70565-9F2F-4445-8BF9-06ADBC8C62BA}']
  end;

  [JavaSignature('java/util/function/Supplier')]
  JSupplier = interface(IJavaInstance)
    ['{CD2853E6-546F-479C-A934-CF56EE99450F}']
    function &get: JObject; cdecl;
  end;
  TJSupplier = class(TJavaGenericImport<JSupplierClass, JSupplier>) end;

  JToDoubleFunctionClass = interface(IJavaClass)
    ['{B546CD0E-82C4-4EE4-9299-16DAE9FB518A}']
  end;

  [JavaSignature('java/util/function/ToDoubleFunction')]
  JToDoubleFunction = interface(IJavaInstance)
    ['{81E092C0-A6E9-45D0-8AE8-7932A21B2DF3}']
    function applyAsDouble(value: JObject): Double; cdecl;
  end;
  TJToDoubleFunction = class(TJavaGenericImport<JToDoubleFunctionClass, JToDoubleFunction>) end;

  JToIntFunctionClass = interface(IJavaClass)
    ['{6F4F201F-78F9-4225-8744-E1F8615BF17D}']
  end;

  [JavaSignature('java/util/function/ToIntFunction')]
  JToIntFunction = interface(IJavaInstance)
    ['{AE45B514-C2A6-416A-A6CB-AC35761BFCF1}']
    function applyAsInt(value: JObject): Integer; cdecl;
  end;
  TJToIntFunction = class(TJavaGenericImport<JToIntFunctionClass, JToIntFunction>) end;

  JToLongFunctionClass = interface(IJavaClass)
    ['{96B05960-EDFA-497F-A0C2-51ABF28FD3D1}']
  end;

  [JavaSignature('java/util/function/ToLongFunction')]
  JToLongFunction = interface(IJavaInstance)
    ['{817FE784-2AE6-43EB-87FA-8347B62D8F23}']
    function applyAsLong(value: JObject): Int64; cdecl;
  end;
  TJToLongFunction = class(TJavaGenericImport<JToLongFunctionClass, JToLongFunction>) end;

  JUnaryOperatorClass = interface(JFunctionClass)
    ['{740E2077-1A4C-4DAA-89FD-F97932E9CB00}']
    {class} function identity: JUnaryOperator; cdecl;
  end;

  [JavaSignature('java/util/function/UnaryOperator')]
  JUnaryOperator = interface(JFunction)
    ['{3A91B090-A4A3-4C2E-8C35-8ACABCEA8156}']
  end;
  TJUnaryOperator = class(TJavaGenericImport<JUnaryOperatorClass, JUnaryOperator>) end;

  JBaseStreamClass = interface(JAutoCloseableClass)
    ['{3760B90D-4AAB-4159-BB0A-AF2AE9C2F783}']
  end;

  [JavaSignature('java/util/stream/BaseStream')]
  JBaseStream = interface(JAutoCloseable)
    ['{A94FAC16-CD7B-4534-9235-44E641FCFE39}']
    procedure close; cdecl;
    function isParallel: Boolean; cdecl;
    function iterator: JIterator; cdecl;
    function onClose(closeHandler: JRunnable): JBaseStream; cdecl;
    function parallel: JBaseStream; cdecl;
    function sequential: JBaseStream; cdecl;
    function spliterator: JSpliterator; cdecl;
    function unordered: JBaseStream; cdecl;
  end;
  TJBaseStream = class(TJavaGenericImport<JBaseStreamClass, JBaseStream>) end;

  JCollectorClass = interface(IJavaClass)
    ['{8589CE91-2E05-4B98-9CA0-69EA9E0372C4}']
  end;

  [JavaSignature('java/util/stream/Collector')]
  JCollector = interface(IJavaInstance)
    ['{49CB9A3B-ACE2-47C5-8E3D-CA380693AD2E}']
    function accumulator: JBiConsumer; cdecl;
    function characteristics: JSet; cdecl;
    function combiner: JBinaryOperator; cdecl;
    function finisher: JFunction; cdecl;
    function supplier: JSupplier; cdecl;
  end;
  TJCollector = class(TJavaGenericImport<JCollectorClass, JCollector>) end;

  JCollector_CharacteristicsClass = interface(JEnumClass)
    ['{E54E7D02-FDD5-4B45-A7F8-579BC1AEB1DF}']
    {class} function _GetCONCURRENT: JCollector_Characteristics; cdecl;
    {class} function _GetIDENTITY_FINISH: JCollector_Characteristics; cdecl;
    {class} function _GetUNORDERED: JCollector_Characteristics; cdecl;
    {class} function valueOf(name: JString): JCollector_Characteristics; cdecl;
    {class} function values: TJavaObjectArray<JCollector_Characteristics>; cdecl;
    {class} property CONCURRENT: JCollector_Characteristics read _GetCONCURRENT;
    {class} property IDENTITY_FINISH: JCollector_Characteristics read _GetIDENTITY_FINISH;
    {class} property UNORDERED: JCollector_Characteristics read _GetUNORDERED;
  end;

  [JavaSignature('java/util/stream/Collector$Characteristics')]
  JCollector_Characteristics = interface(JEnum)
    ['{BBD8E04D-F41F-4DE5-812D-5A1DA3ECB2A8}']
  end;
  TJCollector_Characteristics = class(TJavaGenericImport<JCollector_CharacteristicsClass, JCollector_Characteristics>) end;

  JDoubleStreamClass = interface(JBaseStreamClass)
    ['{54B73264-0D15-4A16-A520-D3C0A20FB11F}']
    {class} function builder: JDoubleStream_Builder; cdecl;
    {class} function concat(a: JDoubleStream; b: JDoubleStream): JDoubleStream; cdecl;
    {class} function empty: JDoubleStream; cdecl;
    {class} function generate(s: JDoubleSupplier): JDoubleStream; cdecl;
    {class} function iterate(seed: Double; f: JDoubleUnaryOperator): JDoubleStream; cdecl;
    {class} function &of(t: Double): JDoubleStream; cdecl;
  end;

  [JavaSignature('java/util/stream/DoubleStream')]
  JDoubleStream = interface(JBaseStream)
    ['{E7877181-FE91-4130-8E0E-FF650F326B7E}']
    function allMatch(predicate: JDoublePredicate): Boolean; cdecl;
    function anyMatch(predicate: JDoublePredicate): Boolean; cdecl;
    function average: JOptionalDouble; cdecl;
    function boxed: JStream; cdecl;
    function collect(supplier: JSupplier; accumulator: JObjDoubleConsumer; combiner: JBiConsumer): JObject; cdecl;
    function count: Int64; cdecl;
    function distinct: JDoubleStream; cdecl;
    function filter(predicate: JDoublePredicate): JDoubleStream; cdecl;
    function findAny: JOptionalDouble; cdecl;
    function findFirst: JOptionalDouble; cdecl;
    function flatMap(mapper: JDoubleFunction): JDoubleStream; cdecl;
    procedure forEach(action: JDoubleConsumer); cdecl;
    procedure forEachOrdered(action: JDoubleConsumer); cdecl;
    function iterator: JPrimitiveIterator_OfDouble; cdecl;
    function limit(maxSize: Int64): JDoubleStream; cdecl;
    function map(mapper: JDoubleUnaryOperator): JDoubleStream; cdecl;
    function mapToInt(mapper: JDoubleToIntFunction): JIntStream; cdecl;
    function mapToLong(mapper: JDoubleToLongFunction): JLongStream; cdecl;
    function mapToObj(mapper: JDoubleFunction): JStream; cdecl;
    function max: JOptionalDouble; cdecl;
    function min: JOptionalDouble; cdecl;
    function noneMatch(predicate: JDoublePredicate): Boolean; cdecl;
    function parallel: JDoubleStream; cdecl;
    function peek(action: JDoubleConsumer): JDoubleStream; cdecl;
    function reduce(identity: Double; op: JDoubleBinaryOperator): Double; cdecl; overload;
    function reduce(op: JDoubleBinaryOperator): JOptionalDouble; cdecl; overload;
    function sequential: JDoubleStream; cdecl;
    function skip(n: Int64): JDoubleStream; cdecl;
    function sorted: JDoubleStream; cdecl;
    function spliterator: JSpliterator_OfDouble; cdecl;
    function sum: Double; cdecl;
    function summaryStatistics: JDoubleSummaryStatistics; cdecl;
    function toArray: TJavaArray<Double>; cdecl;
  end;
  TJDoubleStream = class(TJavaGenericImport<JDoubleStreamClass, JDoubleStream>) end;

  JDoubleStream_BuilderClass = interface(JDoubleConsumerClass)
    ['{E739E1BA-B586-40D0-9543-C66C44240530}']
  end;

  [JavaSignature('java/util/stream/DoubleStream$Builder')]
  JDoubleStream_Builder = interface(JDoubleConsumer)
    ['{A28F5ABA-FEC8-464E-900A-8961BCEC88FF}']
    procedure accept(t: Double); cdecl;
    function add(t: Double): JDoubleStream_Builder; cdecl;
    function build: JDoubleStream; cdecl;
  end;
  TJDoubleStream_Builder = class(TJavaGenericImport<JDoubleStream_BuilderClass, JDoubleStream_Builder>) end;

  JIntStreamClass = interface(JBaseStreamClass)
    ['{CD655857-02FE-49E8-B588-78727AACA18C}']
    {class} function builder: JIntStream_Builder; cdecl;
    {class} function concat(a: JIntStream; b: JIntStream): JIntStream; cdecl;
    {class} function empty: JIntStream; cdecl;
    {class} function generate(s: JIntSupplier): JIntStream; cdecl;
    {class} function iterate(seed: Integer; f: JIntUnaryOperator): JIntStream; cdecl;
    {class} function &of(t: Integer): JIntStream; cdecl;
    {class} function range(startInclusive: Integer; endExclusive: Integer): JIntStream; cdecl;
    {class} function rangeClosed(startInclusive: Integer; endInclusive: Integer): JIntStream; cdecl;
  end;

  [JavaSignature('java/util/stream/IntStream')]
  JIntStream = interface(JBaseStream)
    ['{65798DE6-8E1C-4B04-A08E-7AEC37CB5191}']
    function allMatch(predicate: JIntPredicate): Boolean; cdecl;
    function anyMatch(predicate: JIntPredicate): Boolean; cdecl;
    function asDoubleStream: JDoubleStream; cdecl;
    function asLongStream: JLongStream; cdecl;
    function average: JOptionalDouble; cdecl;
    function boxed: JStream; cdecl;
    function collect(supplier: JSupplier; accumulator: JObjIntConsumer; combiner: JBiConsumer): JObject; cdecl;
    function count: Int64; cdecl;
    function distinct: JIntStream; cdecl;
    function filter(predicate: JIntPredicate): JIntStream; cdecl;
    function findAny: JOptionalInt; cdecl;
    function findFirst: JOptionalInt; cdecl;
    function flatMap(mapper: JIntFunction): JIntStream; cdecl;
    procedure forEach(action: JIntConsumer); cdecl;
    procedure forEachOrdered(action: JIntConsumer); cdecl;
    function iterator: JPrimitiveIterator_OfInt; cdecl;
    function limit(maxSize: Int64): JIntStream; cdecl;
    function map(mapper: JIntUnaryOperator): JIntStream; cdecl;
    function mapToDouble(mapper: JIntToDoubleFunction): JDoubleStream; cdecl;
    function mapToLong(mapper: JIntToLongFunction): JLongStream; cdecl;
    function mapToObj(mapper: JIntFunction): JStream; cdecl;
    function max: JOptionalInt; cdecl;
    function min: JOptionalInt; cdecl;
    function noneMatch(predicate: JIntPredicate): Boolean; cdecl;
    function parallel: JIntStream; cdecl;
    function peek(action: JIntConsumer): JIntStream; cdecl;
    function reduce(identity: Integer; op: JIntBinaryOperator): Integer; cdecl; overload;
    function reduce(op: JIntBinaryOperator): JOptionalInt; cdecl; overload;
    function sequential: JIntStream; cdecl;
    function skip(n: Int64): JIntStream; cdecl;
    function sorted: JIntStream; cdecl;
    function spliterator: JSpliterator_OfInt; cdecl;
    function sum: Integer; cdecl;
    function summaryStatistics: JIntSummaryStatistics; cdecl;
    function toArray: TJavaArray<Integer>; cdecl;
  end;
  TJIntStream = class(TJavaGenericImport<JIntStreamClass, JIntStream>) end;

  JIntStream_BuilderClass = interface(JIntConsumerClass)
    ['{6FD46E4F-B49D-47D9-A113-1B809956B985}']
  end;

  [JavaSignature('java/util/stream/IntStream$Builder')]
  JIntStream_Builder = interface(JIntConsumer)
    ['{CAF43F79-BE72-4EDF-B95B-88CEE7CC481F}']
    procedure accept(t: Integer); cdecl;
    function add(t: Integer): JIntStream_Builder; cdecl;
    function build: JIntStream; cdecl;
  end;
  TJIntStream_Builder = class(TJavaGenericImport<JIntStream_BuilderClass, JIntStream_Builder>) end;

  JLongStreamClass = interface(JBaseStreamClass)
    ['{6E183054-70C7-474E-86FB-87148FBCF269}']
    {class} function builder: JLongStream_Builder; cdecl;
    {class} function concat(a: JLongStream; b: JLongStream): JLongStream; cdecl;
    {class} function empty: JLongStream; cdecl;
    {class} function generate(s: JLongSupplier): JLongStream; cdecl;
    {class} function iterate(seed: Int64; f: JLongUnaryOperator): JLongStream; cdecl;
    {class} function &of(t: Int64): JLongStream; cdecl;
    {class} function range(startInclusive: Int64; endExclusive: Int64): JLongStream; cdecl;
    {class} function rangeClosed(startInclusive: Int64; endInclusive: Int64): JLongStream; cdecl;
  end;

  [JavaSignature('java/util/stream/LongStream')]
  JLongStream = interface(JBaseStream)
    ['{BABCDCF8-897E-4660-B04B-F45B5B4E4A21}']
    function allMatch(predicate: JLongPredicate): Boolean; cdecl;
    function anyMatch(predicate: JLongPredicate): Boolean; cdecl;
    function asDoubleStream: JDoubleStream; cdecl;
    function average: JOptionalDouble; cdecl;
    function boxed: JStream; cdecl;
    function collect(supplier: JSupplier; accumulator: JObjLongConsumer; combiner: JBiConsumer): JObject; cdecl;
    function count: Int64; cdecl;
    function distinct: JLongStream; cdecl;
    function filter(predicate: JLongPredicate): JLongStream; cdecl;
    function findAny: JOptionalLong; cdecl;
    function findFirst: JOptionalLong; cdecl;
    function flatMap(mapper: JLongFunction): JLongStream; cdecl;
    procedure forEach(action: JLongConsumer); cdecl;
    procedure forEachOrdered(action: JLongConsumer); cdecl;
    function iterator: JPrimitiveIterator_OfLong; cdecl;
    function limit(maxSize: Int64): JLongStream; cdecl;
    function map(mapper: JLongUnaryOperator): JLongStream; cdecl;
    function mapToDouble(mapper: JLongToDoubleFunction): JDoubleStream; cdecl;
    function mapToInt(mapper: JLongToIntFunction): JIntStream; cdecl;
    function mapToObj(mapper: JLongFunction): JStream; cdecl;
    function max: JOptionalLong; cdecl;
    function min: JOptionalLong; cdecl;
    function noneMatch(predicate: JLongPredicate): Boolean; cdecl;
    function parallel: JLongStream; cdecl;
    function peek(action: JLongConsumer): JLongStream; cdecl;
    function reduce(identity: Int64; op: JLongBinaryOperator): Int64; cdecl; overload;
    function reduce(op: JLongBinaryOperator): JOptionalLong; cdecl; overload;
    function sequential: JLongStream; cdecl;
    function skip(n: Int64): JLongStream; cdecl;
    function sorted: JLongStream; cdecl;
    function spliterator: JSpliterator_OfLong; cdecl;
    function sum: Int64; cdecl;
    function summaryStatistics: JLongSummaryStatistics; cdecl;
    function toArray: TJavaArray<Int64>; cdecl;
  end;
  TJLongStream = class(TJavaGenericImport<JLongStreamClass, JLongStream>) end;

  JLongStream_BuilderClass = interface(JLongConsumerClass)
    ['{D47F1A08-EB28-4A70-81C0-328CEEABBF6D}']
  end;

  [JavaSignature('java/util/stream/LongStream$Builder')]
  JLongStream_Builder = interface(JLongConsumer)
    ['{6E420622-1F87-4BAC-8942-1125F58F9363}']
    procedure accept(t: Int64); cdecl;
    function add(t: Int64): JLongStream_Builder; cdecl;
    function build: JLongStream; cdecl;
  end;
  TJLongStream_Builder = class(TJavaGenericImport<JLongStream_BuilderClass, JLongStream_Builder>) end;

  JStreamClass = interface(JBaseStreamClass)
    ['{C6C02319-044E-41E7-A2E6-5E8987B0B603}']
    {class} function builder: JStream_Builder; cdecl;
    {class} function concat(a: JStream; b: JStream): JStream; cdecl;
    {class} function empty: JStream; cdecl;
    {class} function generate(s: JSupplier): JStream; cdecl;
    {class} function iterate(seed: JObject; f: JUnaryOperator): JStream; cdecl;
    {class} function &of(t: JObject): JStream; cdecl;
  end;

  [JavaSignature('java/util/stream/Stream')]
  JStream = interface(JBaseStream)
    ['{7E174099-DA5F-4688-988D-0EA1C64A2DCC}']
    function allMatch(predicate: Jfunction_Predicate): Boolean; cdecl;
    function anyMatch(predicate: Jfunction_Predicate): Boolean; cdecl;
    function collect(supplier: JSupplier; accumulator: JBiConsumer; combiner: JBiConsumer): JObject; cdecl; overload;
    function collect(collector: JCollector): JObject; cdecl; overload;
    function count: Int64; cdecl;
    function distinct: JStream; cdecl;
    function filter(predicate: Jfunction_Predicate): JStream; cdecl;
    function findAny: JOptional; cdecl;
    function findFirst: JOptional; cdecl;
    function flatMap(mapper: JFunction): JStream; cdecl;
    function flatMapToDouble(mapper: JFunction): JDoubleStream; cdecl;
    function flatMapToInt(mapper: JFunction): JIntStream; cdecl;
    function flatMapToLong(mapper: JFunction): JLongStream; cdecl;
    procedure forEach(action: JConsumer); cdecl;
    procedure forEachOrdered(action: JConsumer); cdecl;
    function limit(maxSize: Int64): JStream; cdecl;
    function map(mapper: JFunction): JStream; cdecl;
    function mapToDouble(mapper: JToDoubleFunction): JDoubleStream; cdecl;
    function mapToInt(mapper: JToIntFunction): JIntStream; cdecl;
    function mapToLong(mapper: JToLongFunction): JLongStream; cdecl;
    function max(comparator: JComparator): JOptional; cdecl;
    function min(comparator: JComparator): JOptional; cdecl;
    function noneMatch(predicate: Jfunction_Predicate): Boolean; cdecl;
    function peek(action: JConsumer): JStream; cdecl;
    function reduce(identity: JObject; accumulator: JBinaryOperator): JObject; cdecl; overload;
    function reduce(accumulator: JBinaryOperator): JOptional; cdecl; overload;
    function reduce(identity: JObject; accumulator: JBiFunction; combiner: JBinaryOperator): JObject; cdecl; overload;
    function skip(n: Int64): JStream; cdecl;
    function sorted: JStream; cdecl; overload;
    function sorted(comparator: JComparator): JStream; cdecl; overload;
    function toArray: TJavaObjectArray<JObject>; cdecl; overload;
    function toArray(generator: TJavaObjectArray<JIntFunction>): TJavaObjectArray<JObject>; cdecl; overload;
  end;
  TJStream = class(TJavaGenericImport<JStreamClass, JStream>) end;

  JStream_BuilderClass = interface(JConsumerClass)
    ['{77DB3AD9-08BF-43EA-B626-4135D84B9B25}']
  end;

  [JavaSignature('java/util/stream/Stream$Builder')]
  JStream_Builder = interface(JConsumer)
    ['{D40E2B21-0D4B-4D1A-BA45-73BDFEA685A4}']
    procedure accept(t: JObject); cdecl;
    function add(t: JObject): JStream_Builder; cdecl;
    function build: JStream; cdecl;
  end;
  TJStream_Builder = class(TJavaGenericImport<JStream_BuilderClass, JStream_Builder>) end;

  // javax.crypto.SecretKey
  JEGLClass = interface(IJavaClass)
    ['{79C069DA-2C75-4159-BE9D-A05ACE86FDCE}']
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGL')]
  JEGL = interface(IJavaInstance)
    ['{90E8D73C-9FF7-4CA4-B661-6A58F6A3C6C8}']
  end;
  TJEGL = class(TJavaGenericImport<JEGLClass, JEGL>) end;

  JEGL10Class = interface(JEGLClass)
    ['{D1DB03A9-8FA6-44E2-BB75-AE16D5A11CA2}']
    {class} function _GetEGL_ALPHA_FORMAT: Integer; cdecl;
    {class} function _GetEGL_ALPHA_MASK_SIZE: Integer; cdecl;
    {class} function _GetEGL_ALPHA_SIZE: Integer; cdecl;
    {class} function _GetEGL_BAD_ACCESS: Integer; cdecl;
    {class} function _GetEGL_BAD_ALLOC: Integer; cdecl;
    {class} function _GetEGL_BAD_ATTRIBUTE: Integer; cdecl;
    {class} function _GetEGL_BAD_CONFIG: Integer; cdecl;
    {class} function _GetEGL_BAD_CONTEXT: Integer; cdecl;
    {class} function _GetEGL_BAD_CURRENT_SURFACE: Integer; cdecl;
    {class} function _GetEGL_BAD_DISPLAY: Integer; cdecl;
    {class} function _GetEGL_BAD_MATCH: Integer; cdecl;
    {class} function _GetEGL_BAD_NATIVE_PIXMAP: Integer; cdecl;
    {class} function _GetEGL_BAD_NATIVE_WINDOW: Integer; cdecl;
    {class} function _GetEGL_BAD_PARAMETER: Integer; cdecl;
    {class} function _GetEGL_BAD_SURFACE: Integer; cdecl;
    {class} function _GetEGL_BLUE_SIZE: Integer; cdecl;
    {class} function _GetEGL_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetEGL_COLORSPACE: Integer; cdecl;
    {class} function _GetEGL_COLOR_BUFFER_TYPE: Integer; cdecl;
    {class} function _GetEGL_CONFIG_CAVEAT: Integer; cdecl;
    {class} function _GetEGL_CONFIG_ID: Integer; cdecl;
    {class} function _GetEGL_CORE_NATIVE_ENGINE: Integer; cdecl;
    {class} function _GetEGL_DEFAULT_DISPLAY: JObject; cdecl;
    {class} function _GetEGL_DEPTH_SIZE: Integer; cdecl;
    {class} function _GetEGL_DONT_CARE: Integer; cdecl;
    {class} function _GetEGL_DRAW: Integer; cdecl;
    {class} function _GetEGL_EXTENSIONS: Integer; cdecl;
    {class} function _GetEGL_GREEN_SIZE: Integer; cdecl;
    {class} function _GetEGL_HEIGHT: Integer; cdecl;
    {class} function _GetEGL_HORIZONTAL_RESOLUTION: Integer; cdecl;
    {class} function _GetEGL_LARGEST_PBUFFER: Integer; cdecl;
    {class} function _GetEGL_LEVEL: Integer; cdecl;
    {class} function _GetEGL_LUMINANCE_BUFFER: Integer; cdecl;
    {class} function _GetEGL_LUMINANCE_SIZE: Integer; cdecl;
    {class} function _GetEGL_MAX_PBUFFER_HEIGHT: Integer; cdecl;
    {class} function _GetEGL_MAX_PBUFFER_PIXELS: Integer; cdecl;
    {class} function _GetEGL_MAX_PBUFFER_WIDTH: Integer; cdecl;
    {class} function _GetEGL_NATIVE_RENDERABLE: Integer; cdecl;
    {class} function _GetEGL_NATIVE_VISUAL_ID: Integer; cdecl;
    {class} function _GetEGL_NATIVE_VISUAL_TYPE: Integer; cdecl;
    {class} function _GetEGL_NONE: Integer; cdecl;
    {class} function _GetEGL_NON_CONFORMANT_CONFIG: Integer; cdecl;
    {class} function _GetEGL_NOT_INITIALIZED: Integer; cdecl;
    {class} function _GetEGL_NO_CONTEXT: JEGLContext; cdecl;
    {class} function _GetEGL_NO_DISPLAY: JEGLDisplay; cdecl;
    {class} function _GetEGL_NO_SURFACE: JEGLSurface; cdecl;
    {class} function _GetEGL_PBUFFER_BIT: Integer; cdecl;
    {class} function _GetEGL_PIXEL_ASPECT_RATIO: Integer; cdecl;
    {class} function _GetEGL_PIXMAP_BIT: Integer; cdecl;
    {class} function _GetEGL_READ: Integer; cdecl;
    {class} function _GetEGL_RED_SIZE: Integer; cdecl;
    {class} function _GetEGL_RENDERABLE_TYPE: Integer; cdecl;
    {class} function _GetEGL_RENDER_BUFFER: Integer; cdecl;
    {class} function _GetEGL_RGB_BUFFER: Integer; cdecl;
    {class} function _GetEGL_SAMPLES: Integer; cdecl;
    {class} function _GetEGL_SAMPLE_BUFFERS: Integer; cdecl;
    {class} function _GetEGL_SINGLE_BUFFER: Integer; cdecl;
    {class} function _GetEGL_SLOW_CONFIG: Integer; cdecl;
    {class} function _GetEGL_STENCIL_SIZE: Integer; cdecl;
    {class} function _GetEGL_SUCCESS: Integer; cdecl;
    {class} function _GetEGL_SURFACE_TYPE: Integer; cdecl;
    {class} function _GetEGL_TRANSPARENT_BLUE_VALUE: Integer; cdecl;
    {class} function _GetEGL_TRANSPARENT_GREEN_VALUE: Integer; cdecl;
    {class} function _GetEGL_TRANSPARENT_RED_VALUE: Integer; cdecl;
    {class} function _GetEGL_TRANSPARENT_RGB: Integer; cdecl;
    {class} function _GetEGL_TRANSPARENT_TYPE: Integer; cdecl;
    {class} function _GetEGL_VENDOR: Integer; cdecl;
    {class} function _GetEGL_VERSION: Integer; cdecl;
    {class} function _GetEGL_VERTICAL_RESOLUTION: Integer; cdecl;
    {class} function _GetEGL_WIDTH: Integer; cdecl;
    {class} function _GetEGL_WINDOW_BIT: Integer; cdecl;
    {class} property EGL_ALPHA_FORMAT: Integer read _GetEGL_ALPHA_FORMAT;
    {class} property EGL_ALPHA_MASK_SIZE: Integer read _GetEGL_ALPHA_MASK_SIZE;
    {class} property EGL_ALPHA_SIZE: Integer read _GetEGL_ALPHA_SIZE;
    {class} property EGL_BAD_ACCESS: Integer read _GetEGL_BAD_ACCESS;
    {class} property EGL_BAD_ALLOC: Integer read _GetEGL_BAD_ALLOC;
    {class} property EGL_BAD_ATTRIBUTE: Integer read _GetEGL_BAD_ATTRIBUTE;
    {class} property EGL_BAD_CONFIG: Integer read _GetEGL_BAD_CONFIG;
    {class} property EGL_BAD_CONTEXT: Integer read _GetEGL_BAD_CONTEXT;
    {class} property EGL_BAD_CURRENT_SURFACE: Integer read _GetEGL_BAD_CURRENT_SURFACE;
    {class} property EGL_BAD_DISPLAY: Integer read _GetEGL_BAD_DISPLAY;
    {class} property EGL_BAD_MATCH: Integer read _GetEGL_BAD_MATCH;
    {class} property EGL_BAD_NATIVE_PIXMAP: Integer read _GetEGL_BAD_NATIVE_PIXMAP;
    {class} property EGL_BAD_NATIVE_WINDOW: Integer read _GetEGL_BAD_NATIVE_WINDOW;
    {class} property EGL_BAD_PARAMETER: Integer read _GetEGL_BAD_PARAMETER;
    {class} property EGL_BAD_SURFACE: Integer read _GetEGL_BAD_SURFACE;
    {class} property EGL_BLUE_SIZE: Integer read _GetEGL_BLUE_SIZE;
    {class} property EGL_BUFFER_SIZE: Integer read _GetEGL_BUFFER_SIZE;
    {class} property EGL_COLORSPACE: Integer read _GetEGL_COLORSPACE;
    {class} property EGL_COLOR_BUFFER_TYPE: Integer read _GetEGL_COLOR_BUFFER_TYPE;
    {class} property EGL_CONFIG_CAVEAT: Integer read _GetEGL_CONFIG_CAVEAT;
    {class} property EGL_CONFIG_ID: Integer read _GetEGL_CONFIG_ID;
    {class} property EGL_CORE_NATIVE_ENGINE: Integer read _GetEGL_CORE_NATIVE_ENGINE;
    {class} property EGL_DEFAULT_DISPLAY: JObject read _GetEGL_DEFAULT_DISPLAY;
    {class} property EGL_DEPTH_SIZE: Integer read _GetEGL_DEPTH_SIZE;
    {class} property EGL_DONT_CARE: Integer read _GetEGL_DONT_CARE;
    {class} property EGL_DRAW: Integer read _GetEGL_DRAW;
    {class} property EGL_EXTENSIONS: Integer read _GetEGL_EXTENSIONS;
    {class} property EGL_GREEN_SIZE: Integer read _GetEGL_GREEN_SIZE;
    {class} property EGL_HEIGHT: Integer read _GetEGL_HEIGHT;
    {class} property EGL_HORIZONTAL_RESOLUTION: Integer read _GetEGL_HORIZONTAL_RESOLUTION;
    {class} property EGL_LARGEST_PBUFFER: Integer read _GetEGL_LARGEST_PBUFFER;
    {class} property EGL_LEVEL: Integer read _GetEGL_LEVEL;
    {class} property EGL_LUMINANCE_BUFFER: Integer read _GetEGL_LUMINANCE_BUFFER;
    {class} property EGL_LUMINANCE_SIZE: Integer read _GetEGL_LUMINANCE_SIZE;
    {class} property EGL_MAX_PBUFFER_HEIGHT: Integer read _GetEGL_MAX_PBUFFER_HEIGHT;
    {class} property EGL_MAX_PBUFFER_PIXELS: Integer read _GetEGL_MAX_PBUFFER_PIXELS;
    {class} property EGL_MAX_PBUFFER_WIDTH: Integer read _GetEGL_MAX_PBUFFER_WIDTH;
    {class} property EGL_NATIVE_RENDERABLE: Integer read _GetEGL_NATIVE_RENDERABLE;
    {class} property EGL_NATIVE_VISUAL_ID: Integer read _GetEGL_NATIVE_VISUAL_ID;
    {class} property EGL_NATIVE_VISUAL_TYPE: Integer read _GetEGL_NATIVE_VISUAL_TYPE;
    {class} property EGL_NONE: Integer read _GetEGL_NONE;
    {class} property EGL_NON_CONFORMANT_CONFIG: Integer read _GetEGL_NON_CONFORMANT_CONFIG;
    {class} property EGL_NOT_INITIALIZED: Integer read _GetEGL_NOT_INITIALIZED;
    {class} property EGL_NO_CONTEXT: JEGLContext read _GetEGL_NO_CONTEXT;
    {class} property EGL_NO_DISPLAY: JEGLDisplay read _GetEGL_NO_DISPLAY;
    {class} property EGL_NO_SURFACE: JEGLSurface read _GetEGL_NO_SURFACE;
    {class} property EGL_PBUFFER_BIT: Integer read _GetEGL_PBUFFER_BIT;
    {class} property EGL_PIXEL_ASPECT_RATIO: Integer read _GetEGL_PIXEL_ASPECT_RATIO;
    {class} property EGL_PIXMAP_BIT: Integer read _GetEGL_PIXMAP_BIT;
    {class} property EGL_READ: Integer read _GetEGL_READ;
    {class} property EGL_RED_SIZE: Integer read _GetEGL_RED_SIZE;
    {class} property EGL_RENDERABLE_TYPE: Integer read _GetEGL_RENDERABLE_TYPE;
    {class} property EGL_RENDER_BUFFER: Integer read _GetEGL_RENDER_BUFFER;
    {class} property EGL_RGB_BUFFER: Integer read _GetEGL_RGB_BUFFER;
    {class} property EGL_SAMPLES: Integer read _GetEGL_SAMPLES;
    {class} property EGL_SAMPLE_BUFFERS: Integer read _GetEGL_SAMPLE_BUFFERS;
    {class} property EGL_SINGLE_BUFFER: Integer read _GetEGL_SINGLE_BUFFER;
    {class} property EGL_SLOW_CONFIG: Integer read _GetEGL_SLOW_CONFIG;
    {class} property EGL_STENCIL_SIZE: Integer read _GetEGL_STENCIL_SIZE;
    {class} property EGL_SUCCESS: Integer read _GetEGL_SUCCESS;
    {class} property EGL_SURFACE_TYPE: Integer read _GetEGL_SURFACE_TYPE;
    {class} property EGL_TRANSPARENT_BLUE_VALUE: Integer read _GetEGL_TRANSPARENT_BLUE_VALUE;
    {class} property EGL_TRANSPARENT_GREEN_VALUE: Integer read _GetEGL_TRANSPARENT_GREEN_VALUE;
    {class} property EGL_TRANSPARENT_RED_VALUE: Integer read _GetEGL_TRANSPARENT_RED_VALUE;
    {class} property EGL_TRANSPARENT_RGB: Integer read _GetEGL_TRANSPARENT_RGB;
    {class} property EGL_TRANSPARENT_TYPE: Integer read _GetEGL_TRANSPARENT_TYPE;
    {class} property EGL_VENDOR: Integer read _GetEGL_VENDOR;
    {class} property EGL_VERSION: Integer read _GetEGL_VERSION;
    {class} property EGL_VERTICAL_RESOLUTION: Integer read _GetEGL_VERTICAL_RESOLUTION;
    {class} property EGL_WIDTH: Integer read _GetEGL_WIDTH;
    {class} property EGL_WINDOW_BIT: Integer read _GetEGL_WINDOW_BIT;
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGL10')]
  JEGL10 = interface(JEGL)
    ['{5178914E-D8BE-44D4-AD82-ADE844D55BEE}']
    function eglChooseConfig(display: JEGLDisplay; attrib_list: TJavaArray<Integer>; configs: TJavaObjectArray<JEGLConfig>; config_size: Integer; num_config: TJavaArray<Integer>): Boolean; cdecl;
    function eglCopyBuffers(display: JEGLDisplay; surface: JEGLSurface; native_pixmap: JObject): Boolean; cdecl;
    function eglCreateContext(display: JEGLDisplay; config: JEGLConfig; share_context: JEGLContext; attrib_list: TJavaArray<Integer>): JEGLContext; cdecl;
    function eglCreatePbufferSurface(display: JEGLDisplay; config: JEGLConfig; attrib_list: TJavaArray<Integer>): JEGLSurface; cdecl;
    function eglCreatePixmapSurface(display: JEGLDisplay; config: JEGLConfig; native_pixmap: JObject; attrib_list: TJavaArray<Integer>): JEGLSurface; cdecl;//Deprecated
    function eglCreateWindowSurface(display: JEGLDisplay; config: JEGLConfig; native_window: JObject; attrib_list: TJavaArray<Integer>): JEGLSurface; cdecl;
    function eglDestroyContext(display: JEGLDisplay; context: JEGLContext): Boolean; cdecl;
    function eglDestroySurface(display: JEGLDisplay; surface: JEGLSurface): Boolean; cdecl;
    function eglGetConfigAttrib(display: JEGLDisplay; config: JEGLConfig; attribute: Integer; value: TJavaArray<Integer>): Boolean; cdecl;
    function eglGetConfigs(display: JEGLDisplay; configs: TJavaObjectArray<JEGLConfig>; config_size: Integer; num_config: TJavaArray<Integer>): Boolean; cdecl;
    function eglGetCurrentContext: JEGLContext; cdecl;
    function eglGetCurrentDisplay: JEGLDisplay; cdecl;
    function eglGetCurrentSurface(readdraw: Integer): JEGLSurface; cdecl;
    function eglGetDisplay(native_display: JObject): JEGLDisplay; cdecl;
    function eglGetError: Integer; cdecl;
    function eglInitialize(display: JEGLDisplay; major_minor: TJavaArray<Integer>): Boolean; cdecl;
    function eglMakeCurrent(display: JEGLDisplay; draw: JEGLSurface; read: JEGLSurface; context: JEGLContext): Boolean; cdecl;
    function eglQueryContext(display: JEGLDisplay; context: JEGLContext; attribute: Integer; value: TJavaArray<Integer>): Boolean; cdecl;
    function eglQueryString(display: JEGLDisplay; name: Integer): JString; cdecl;
    function eglQuerySurface(display: JEGLDisplay; surface: JEGLSurface; attribute: Integer; value: TJavaArray<Integer>): Boolean; cdecl;
    function eglSwapBuffers(display: JEGLDisplay; surface: JEGLSurface): Boolean; cdecl;
    function eglTerminate(display: JEGLDisplay): Boolean; cdecl;
    function eglWaitGL: Boolean; cdecl;
    function eglWaitNative(engine: Integer; bindTarget: JObject): Boolean; cdecl;
  end;
  TJEGL10 = class(TJavaGenericImport<JEGL10Class, JEGL10>) end;

  JEGLConfigClass = interface(JObjectClass)
    ['{96A2CBA0-853E-45DC-95EA-AA707DA29569}']
    {class} function init: JEGLConfig; cdecl;
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGLConfig')]
  JEGLConfig = interface(JObject)
    ['{2647F2E5-3A3D-4D51-AB8D-5819899D7B8E}']
  end;
  TJEGLConfig = class(TJavaGenericImport<JEGLConfigClass, JEGLConfig>) end;

  JEGLContextClass = interface(JObjectClass)
    ['{75CB0600-343C-4078-A743-40B5C9E79FFF}']
    {class} function init: JEGLContext; cdecl;
    {class} function getEGL: JEGL; cdecl;
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGLContext')]
  JEGLContext = interface(JObject)
    ['{768D920B-DB0B-4278-B16D-226D7BF1A971}']
    function getGL: JGL; cdecl;
  end;
  TJEGLContext = class(TJavaGenericImport<JEGLContextClass, JEGLContext>) end;

  JEGLDisplayClass = interface(JObjectClass)
    ['{1BCD3FCD-D59F-4D36-A5D2-F7492B04669F}']
    {class} function init: JEGLDisplay; cdecl;
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGLDisplay')]
  JEGLDisplay = interface(JObject)
    ['{CB130B2B-7534-4FFF-9679-BD9B21F8FEC6}']
  end;
  TJEGLDisplay = class(TJavaGenericImport<JEGLDisplayClass, JEGLDisplay>) end;

  JEGLSurfaceClass = interface(JObjectClass)
    ['{E0F463FF-63B5-4F4D-BF36-6CDEDFE151EB}']
    {class} function init: JEGLSurface; cdecl;
  end;

  [JavaSignature('javax/microedition/khronos/egl/EGLSurface')]
  JEGLSurface = interface(JObject)
    ['{6BD5B09A-C1F7-4E46-A4E3-56F96C388D26}']
  end;
  TJEGLSurface = class(TJavaGenericImport<JEGLSurfaceClass, JEGLSurface>) end;

  JGLClass = interface(IJavaClass)
    ['{9E0B1F51-CA90-4AEB-8D45-C34729067041}']
  end;

  [JavaSignature('javax/microedition/khronos/opengles/GL')]
  JGL = interface(IJavaInstance)
    ['{210EA9DA-F5F9-4849-9FF2-28297F3CD7ED}']
  end;
  TJGL = class(TJavaGenericImport<JGLClass, JGL>) end;

  JGL10Class = interface(JGLClass)
    ['{11B00106-3641-4149-833C-F2A15DD0A1FB}']
    {class} function _GetGL_ADD: Integer; cdecl;
    {class} function _GetGL_ALIASED_LINE_WIDTH_RANGE: Integer; cdecl;
    {class} function _GetGL_ALIASED_POINT_SIZE_RANGE: Integer; cdecl;
    {class} function _GetGL_ALPHA: Integer; cdecl;
    {class} function _GetGL_ALPHA_BITS: Integer; cdecl;
    {class} function _GetGL_ALPHA_TEST: Integer; cdecl;
    {class} function _GetGL_ALWAYS: Integer; cdecl;
    {class} function _GetGL_AMBIENT: Integer; cdecl;
    {class} function _GetGL_AMBIENT_AND_DIFFUSE: Integer; cdecl;
    {class} function _GetGL_AND: Integer; cdecl;
    {class} function _GetGL_AND_INVERTED: Integer; cdecl;
    {class} function _GetGL_AND_REVERSE: Integer; cdecl;
    {class} function _GetGL_BACK: Integer; cdecl;
    {class} function _GetGL_BLEND: Integer; cdecl;
    {class} function _GetGL_BLUE_BITS: Integer; cdecl;
    {class} function _GetGL_BYTE: Integer; cdecl;
    {class} function _GetGL_CCW: Integer; cdecl;
    {class} function _GetGL_CLAMP_TO_EDGE: Integer; cdecl;
    {class} function _GetGL_CLEAR: Integer; cdecl;
    {class} function _GetGL_COLOR_ARRAY: Integer; cdecl;
    {class} function _GetGL_COLOR_BUFFER_BIT: Integer; cdecl;
    {class} function _GetGL_COLOR_LOGIC_OP: Integer; cdecl;
    {class} function _GetGL_COLOR_MATERIAL: Integer; cdecl;
    {class} function _GetGL_COMPRESSED_TEXTURE_FORMATS: Integer; cdecl;
    {class} function _GetGL_CONSTANT_ATTENUATION: Integer; cdecl;
    {class} function _GetGL_COPY: Integer; cdecl;
    {class} function _GetGL_COPY_INVERTED: Integer; cdecl;
    {class} function _GetGL_CULL_FACE: Integer; cdecl;
    {class} function _GetGL_CW: Integer; cdecl;
    {class} function _GetGL_DECAL: Integer; cdecl;
    {class} function _GetGL_DECR: Integer; cdecl;
    {class} function _GetGL_DEPTH_BITS: Integer; cdecl;
    {class} function _GetGL_DEPTH_BUFFER_BIT: Integer; cdecl;
    {class} function _GetGL_DEPTH_TEST: Integer; cdecl;
    {class} function _GetGL_DIFFUSE: Integer; cdecl;
    {class} function _GetGL_DITHER: Integer; cdecl;
    {class} function _GetGL_DONT_CARE: Integer; cdecl;
    {class} function _GetGL_DST_ALPHA: Integer; cdecl;
    {class} function _GetGL_DST_COLOR: Integer; cdecl;
    {class} function _GetGL_EMISSION: Integer; cdecl;
    {class} function _GetGL_EQUAL: Integer; cdecl;
    {class} function _GetGL_EQUIV: Integer; cdecl;
    {class} function _GetGL_EXP: Integer; cdecl;
    {class} function _GetGL_EXP2: Integer; cdecl;
    {class} function _GetGL_EXTENSIONS: Integer; cdecl;
    {class} function _GetGL_FALSE: Integer; cdecl;
    {class} function _GetGL_FASTEST: Integer; cdecl;
    {class} function _GetGL_FIXED: Integer; cdecl;
    {class} function _GetGL_FLAT: Integer; cdecl;
    {class} function _GetGL_FLOAT: Integer; cdecl;
    {class} function _GetGL_FOG: Integer; cdecl;
    {class} function _GetGL_FOG_COLOR: Integer; cdecl;
    {class} function _GetGL_FOG_DENSITY: Integer; cdecl;
    {class} function _GetGL_FOG_END: Integer; cdecl;
    {class} function _GetGL_FOG_HINT: Integer; cdecl;
    {class} function _GetGL_FOG_MODE: Integer; cdecl;
    {class} function _GetGL_FOG_START: Integer; cdecl;
    {class} function _GetGL_FRONT: Integer; cdecl;
    {class} function _GetGL_FRONT_AND_BACK: Integer; cdecl;
    {class} function _GetGL_GEQUAL: Integer; cdecl;
    {class} function _GetGL_GREATER: Integer; cdecl;
    {class} function _GetGL_GREEN_BITS: Integer; cdecl;
    {class} function _GetGL_IMPLEMENTATION_COLOR_READ_FORMAT_OES: Integer; cdecl;
    {class} function _GetGL_IMPLEMENTATION_COLOR_READ_TYPE_OES: Integer; cdecl;
    {class} function _GetGL_INCR: Integer; cdecl;
    {class} function _GetGL_INVALID_ENUM: Integer; cdecl;
    {class} function _GetGL_INVALID_OPERATION: Integer; cdecl;
    {class} function _GetGL_INVALID_VALUE: Integer; cdecl;
    {class} function _GetGL_INVERT: Integer; cdecl;
    {class} function _GetGL_KEEP: Integer; cdecl;
    {class} function _GetGL_LEQUAL: Integer; cdecl;
    {class} function _GetGL_LESS: Integer; cdecl;
    {class} function _GetGL_LIGHT0: Integer; cdecl;
    {class} function _GetGL_LIGHT1: Integer; cdecl;
    {class} function _GetGL_LIGHT2: Integer; cdecl;
    {class} function _GetGL_LIGHT3: Integer; cdecl;
    {class} function _GetGL_LIGHT4: Integer; cdecl;
    {class} function _GetGL_LIGHT5: Integer; cdecl;
    {class} function _GetGL_LIGHT6: Integer; cdecl;
    {class} function _GetGL_LIGHT7: Integer; cdecl;
    {class} function _GetGL_LIGHTING: Integer; cdecl;
    {class} function _GetGL_LIGHT_MODEL_AMBIENT: Integer; cdecl;
    {class} function _GetGL_LIGHT_MODEL_TWO_SIDE: Integer; cdecl;
    {class} function _GetGL_LINEAR: Integer; cdecl;
    {class} function _GetGL_LINEAR_ATTENUATION: Integer; cdecl;
    {class} function _GetGL_LINEAR_MIPMAP_LINEAR: Integer; cdecl;
    {class} function _GetGL_LINEAR_MIPMAP_NEAREST: Integer; cdecl;
    {class} function _GetGL_LINES: Integer; cdecl;
    {class} function _GetGL_LINE_LOOP: Integer; cdecl;
    {class} function _GetGL_LINE_SMOOTH: Integer; cdecl;
    {class} function _GetGL_LINE_SMOOTH_HINT: Integer; cdecl;
    {class} function _GetGL_LINE_STRIP: Integer; cdecl;
    {class} function _GetGL_LUMINANCE: Integer; cdecl;
    {class} function _GetGL_LUMINANCE_ALPHA: Integer; cdecl;
    {class} function _GetGL_MAX_ELEMENTS_INDICES: Integer; cdecl;
    {class} function _GetGL_MAX_ELEMENTS_VERTICES: Integer; cdecl;
    {class} function _GetGL_MAX_LIGHTS: Integer; cdecl;
    {class} function _GetGL_MAX_MODELVIEW_STACK_DEPTH: Integer; cdecl;
    {class} function _GetGL_MAX_PROJECTION_STACK_DEPTH: Integer; cdecl;
    {class} function _GetGL_MAX_TEXTURE_SIZE: Integer; cdecl;
    {class} function _GetGL_MAX_TEXTURE_STACK_DEPTH: Integer; cdecl;
    {class} function _GetGL_MAX_TEXTURE_UNITS: Integer; cdecl;
    {class} function _GetGL_MAX_VIEWPORT_DIMS: Integer; cdecl;
    {class} function _GetGL_MODELVIEW: Integer; cdecl;
    {class} function _GetGL_MODULATE: Integer; cdecl;
    {class} function _GetGL_MULTISAMPLE: Integer; cdecl;
    {class} function _GetGL_NAND: Integer; cdecl;
    {class} function _GetGL_NEAREST: Integer; cdecl;
    {class} function _GetGL_NEAREST_MIPMAP_LINEAR: Integer; cdecl;
    {class} function _GetGL_NEAREST_MIPMAP_NEAREST: Integer; cdecl;
    {class} function _GetGL_NEVER: Integer; cdecl;
    {class} function _GetGL_NICEST: Integer; cdecl;
    {class} function _GetGL_NOOP: Integer; cdecl;
    {class} function _GetGL_NOR: Integer; cdecl;
    {class} function _GetGL_NORMALIZE: Integer; cdecl;
    {class} function _GetGL_NORMAL_ARRAY: Integer; cdecl;
    {class} function _GetGL_NOTEQUAL: Integer; cdecl;
    {class} function _GetGL_NO_ERROR: Integer; cdecl;
    {class} function _GetGL_NUM_COMPRESSED_TEXTURE_FORMATS: Integer; cdecl;
    {class} function _GetGL_ONE: Integer; cdecl;
    {class} function _GetGL_ONE_MINUS_DST_ALPHA: Integer; cdecl;
    {class} function _GetGL_ONE_MINUS_DST_COLOR: Integer; cdecl;
    {class} function _GetGL_ONE_MINUS_SRC_ALPHA: Integer; cdecl;
    {class} function _GetGL_ONE_MINUS_SRC_COLOR: Integer; cdecl;
    {class} function _GetGL_OR: Integer; cdecl;
    {class} function _GetGL_OR_INVERTED: Integer; cdecl;
    {class} function _GetGL_OR_REVERSE: Integer; cdecl;
    {class} function _GetGL_OUT_OF_MEMORY: Integer; cdecl;
    {class} function _GetGL_PACK_ALIGNMENT: Integer; cdecl;
    {class} function _GetGL_PALETTE4_R5_G6_B5_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE4_RGB5_A1_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE4_RGB8_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE4_RGBA4_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE4_RGBA8_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE8_R5_G6_B5_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE8_RGB5_A1_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE8_RGB8_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE8_RGBA4_OES: Integer; cdecl;
    {class} function _GetGL_PALETTE8_RGBA8_OES: Integer; cdecl;
    {class} function _GetGL_PERSPECTIVE_CORRECTION_HINT: Integer; cdecl;
    {class} function _GetGL_POINTS: Integer; cdecl;
    {class} function _GetGL_POINT_FADE_THRESHOLD_SIZE: Integer; cdecl;
    {class} function _GetGL_POINT_SIZE: Integer; cdecl;
    {class} function _GetGL_POINT_SMOOTH: Integer; cdecl;
    {class} function _GetGL_POINT_SMOOTH_HINT: Integer; cdecl;
    {class} function _GetGL_POLYGON_OFFSET_FILL: Integer; cdecl;
    {class} function _GetGL_POLYGON_SMOOTH_HINT: Integer; cdecl;
    {class} function _GetGL_POSITION: Integer; cdecl;
    {class} function _GetGL_PROJECTION: Integer; cdecl;
    {class} function _GetGL_QUADRATIC_ATTENUATION: Integer; cdecl;
    {class} function _GetGL_RED_BITS: Integer; cdecl;
    {class} function _GetGL_RENDERER: Integer; cdecl;
    {class} function _GetGL_REPEAT: Integer; cdecl;
    {class} function _GetGL_REPLACE: Integer; cdecl;
    {class} function _GetGL_RESCALE_NORMAL: Integer; cdecl;
    {class} function _GetGL_RGB: Integer; cdecl;
    {class} function _GetGL_RGBA: Integer; cdecl;
    {class} function _GetGL_SAMPLE_ALPHA_TO_COVERAGE: Integer; cdecl;
    {class} function _GetGL_SAMPLE_ALPHA_TO_ONE: Integer; cdecl;
    {class} function _GetGL_SAMPLE_COVERAGE: Integer; cdecl;
    {class} function _GetGL_SCISSOR_TEST: Integer; cdecl;
    {class} function _GetGL_SET: Integer; cdecl;
    {class} function _GetGL_SHININESS: Integer; cdecl;
    {class} function _GetGL_SHORT: Integer; cdecl;
    {class} function _GetGL_SMOOTH: Integer; cdecl;
    {class} function _GetGL_SMOOTH_LINE_WIDTH_RANGE: Integer; cdecl;
    {class} function _GetGL_SMOOTH_POINT_SIZE_RANGE: Integer; cdecl;
    {class} function _GetGL_SPECULAR: Integer; cdecl;
    {class} function _GetGL_SPOT_CUTOFF: Integer; cdecl;
    {class} function _GetGL_SPOT_DIRECTION: Integer; cdecl;
    {class} function _GetGL_SPOT_EXPONENT: Integer; cdecl;
    {class} function _GetGL_SRC_ALPHA: Integer; cdecl;
    {class} function _GetGL_SRC_ALPHA_SATURATE: Integer; cdecl;
    {class} function _GetGL_SRC_COLOR: Integer; cdecl;
    {class} function _GetGL_STACK_OVERFLOW: Integer; cdecl;
    {class} function _GetGL_STACK_UNDERFLOW: Integer; cdecl;
    {class} function _GetGL_STENCIL_BITS: Integer; cdecl;
    {class} function _GetGL_STENCIL_BUFFER_BIT: Integer; cdecl;
    {class} function _GetGL_STENCIL_TEST: Integer; cdecl;
    {class} function _GetGL_SUBPIXEL_BITS: Integer; cdecl;
    {class} function _GetGL_TEXTURE: Integer; cdecl;
    {class} function _GetGL_TEXTURE0: Integer; cdecl;
    {class} function _GetGL_TEXTURE1: Integer; cdecl;
    {class} function _GetGL_TEXTURE10: Integer; cdecl;
    {class} function _GetGL_TEXTURE11: Integer; cdecl;
    {class} function _GetGL_TEXTURE12: Integer; cdecl;
    {class} function _GetGL_TEXTURE13: Integer; cdecl;
    {class} function _GetGL_TEXTURE14: Integer; cdecl;
    {class} function _GetGL_TEXTURE15: Integer; cdecl;
    {class} function _GetGL_TEXTURE16: Integer; cdecl;
    {class} function _GetGL_TEXTURE17: Integer; cdecl;
    {class} function _GetGL_TEXTURE18: Integer; cdecl;
    {class} function _GetGL_TEXTURE19: Integer; cdecl;
    {class} function _GetGL_TEXTURE2: Integer; cdecl;
    {class} function _GetGL_TEXTURE20: Integer; cdecl;
    {class} function _GetGL_TEXTURE21: Integer; cdecl;
    {class} function _GetGL_TEXTURE22: Integer; cdecl;
    {class} function _GetGL_TEXTURE23: Integer; cdecl;
    {class} function _GetGL_TEXTURE24: Integer; cdecl;
    {class} function _GetGL_TEXTURE25: Integer; cdecl;
    {class} function _GetGL_TEXTURE26: Integer; cdecl;
    {class} function _GetGL_TEXTURE27: Integer; cdecl;
    {class} function _GetGL_TEXTURE28: Integer; cdecl;
    {class} function _GetGL_TEXTURE29: Integer; cdecl;
    {class} function _GetGL_TEXTURE3: Integer; cdecl;
    {class} function _GetGL_TEXTURE30: Integer; cdecl;
    {class} function _GetGL_TEXTURE31: Integer; cdecl;
    {class} function _GetGL_TEXTURE4: Integer; cdecl;
    {class} function _GetGL_TEXTURE5: Integer; cdecl;
    {class} function _GetGL_TEXTURE6: Integer; cdecl;
    {class} function _GetGL_TEXTURE7: Integer; cdecl;
    {class} function _GetGL_TEXTURE8: Integer; cdecl;
    {class} function _GetGL_TEXTURE9: Integer; cdecl;
    {class} function _GetGL_TEXTURE_2D: Integer; cdecl;
    {class} function _GetGL_TEXTURE_COORD_ARRAY: Integer; cdecl;
    {class} function _GetGL_TEXTURE_ENV: Integer; cdecl;
    {class} function _GetGL_TEXTURE_ENV_COLOR: Integer; cdecl;
    {class} function _GetGL_TEXTURE_ENV_MODE: Integer; cdecl;
    {class} function _GetGL_TEXTURE_MAG_FILTER: Integer; cdecl;
    {class} function _GetGL_TEXTURE_MIN_FILTER: Integer; cdecl;
    {class} function _GetGL_TEXTURE_WRAP_S: Integer; cdecl;
    {class} function _GetGL_TEXTURE_WRAP_T: Integer; cdecl;
    {class} function _GetGL_TRIANGLES: Integer; cdecl;
    {class} function _GetGL_TRIANGLE_FAN: Integer; cdecl;
    {class} function _GetGL_TRIANGLE_STRIP: Integer; cdecl;
    {class} function _GetGL_TRUE: Integer; cdecl;
    {class} function _GetGL_UNPACK_ALIGNMENT: Integer; cdecl;
    {class} function _GetGL_UNSIGNED_BYTE: Integer; cdecl;
    {class} function _GetGL_UNSIGNED_SHORT: Integer; cdecl;
    {class} function _GetGL_UNSIGNED_SHORT_4_4_4_4: Integer; cdecl;
    {class} function _GetGL_UNSIGNED_SHORT_5_5_5_1: Integer; cdecl;
    {class} function _GetGL_UNSIGNED_SHORT_5_6_5: Integer; cdecl;
    {class} function _GetGL_VENDOR: Integer; cdecl;
    {class} function _GetGL_VERSION: Integer; cdecl;
    {class} function _GetGL_VERTEX_ARRAY: Integer; cdecl;
    {class} function _GetGL_XOR: Integer; cdecl;
    {class} function _GetGL_ZERO: Integer; cdecl;
    {class} property GL_ADD: Integer read _GetGL_ADD;
    {class} property GL_ALIASED_LINE_WIDTH_RANGE: Integer read _GetGL_ALIASED_LINE_WIDTH_RANGE;
    {class} property GL_ALIASED_POINT_SIZE_RANGE: Integer read _GetGL_ALIASED_POINT_SIZE_RANGE;
    {class} property GL_ALPHA: Integer read _GetGL_ALPHA;
    {class} property GL_ALPHA_BITS: Integer read _GetGL_ALPHA_BITS;
    {class} property GL_ALPHA_TEST: Integer read _GetGL_ALPHA_TEST;
    {class} property GL_ALWAYS: Integer read _GetGL_ALWAYS;
    {class} property GL_AMBIENT: Integer read _GetGL_AMBIENT;
    {class} property GL_AMBIENT_AND_DIFFUSE: Integer read _GetGL_AMBIENT_AND_DIFFUSE;
    {class} property GL_AND: Integer read _GetGL_AND;
    {class} property GL_AND_INVERTED: Integer read _GetGL_AND_INVERTED;
    {class} property GL_AND_REVERSE: Integer read _GetGL_AND_REVERSE;
    {class} property GL_BACK: Integer read _GetGL_BACK;
    {class} property GL_BLEND: Integer read _GetGL_BLEND;
    {class} property GL_BLUE_BITS: Integer read _GetGL_BLUE_BITS;
    {class} property GL_BYTE: Integer read _GetGL_BYTE;
    {class} property GL_CCW: Integer read _GetGL_CCW;
    {class} property GL_CLAMP_TO_EDGE: Integer read _GetGL_CLAMP_TO_EDGE;
    {class} property GL_CLEAR: Integer read _GetGL_CLEAR;
    {class} property GL_COLOR_ARRAY: Integer read _GetGL_COLOR_ARRAY;
    {class} property GL_COLOR_BUFFER_BIT: Integer read _GetGL_COLOR_BUFFER_BIT;
    {class} property GL_COLOR_LOGIC_OP: Integer read _GetGL_COLOR_LOGIC_OP;
    {class} property GL_COLOR_MATERIAL: Integer read _GetGL_COLOR_MATERIAL;
    {class} property GL_COMPRESSED_TEXTURE_FORMATS: Integer read _GetGL_COMPRESSED_TEXTURE_FORMATS;
    {class} property GL_CONSTANT_ATTENUATION: Integer read _GetGL_CONSTANT_ATTENUATION;
    {class} property GL_COPY: Integer read _GetGL_COPY;
    {class} property GL_COPY_INVERTED: Integer read _GetGL_COPY_INVERTED;
    {class} property GL_CULL_FACE: Integer read _GetGL_CULL_FACE;
    {class} property GL_CW: Integer read _GetGL_CW;
    {class} property GL_DECAL: Integer read _GetGL_DECAL;
    {class} property GL_DECR: Integer read _GetGL_DECR;
    {class} property GL_DEPTH_BITS: Integer read _GetGL_DEPTH_BITS;
    {class} property GL_DEPTH_BUFFER_BIT: Integer read _GetGL_DEPTH_BUFFER_BIT;
    {class} property GL_DEPTH_TEST: Integer read _GetGL_DEPTH_TEST;
    {class} property GL_DIFFUSE: Integer read _GetGL_DIFFUSE;
    {class} property GL_DITHER: Integer read _GetGL_DITHER;
    {class} property GL_DONT_CARE: Integer read _GetGL_DONT_CARE;
    {class} property GL_DST_ALPHA: Integer read _GetGL_DST_ALPHA;
    {class} property GL_DST_COLOR: Integer read _GetGL_DST_COLOR;
    {class} property GL_EMISSION: Integer read _GetGL_EMISSION;
    {class} property GL_EQUAL: Integer read _GetGL_EQUAL;
    {class} property GL_EQUIV: Integer read _GetGL_EQUIV;
    {class} property GL_EXP: Integer read _GetGL_EXP;
    {class} property GL_EXP2: Integer read _GetGL_EXP2;
    {class} property GL_EXTENSIONS: Integer read _GetGL_EXTENSIONS;
    {class} property GL_FALSE: Integer read _GetGL_FALSE;
    {class} property GL_FASTEST: Integer read _GetGL_FASTEST;
    {class} property GL_FIXED: Integer read _GetGL_FIXED;
    {class} property GL_FLAT: Integer read _GetGL_FLAT;
    {class} property GL_FLOAT: Integer read _GetGL_FLOAT;
    {class} property GL_FOG: Integer read _GetGL_FOG;
    {class} property GL_FOG_COLOR: Integer read _GetGL_FOG_COLOR;
    {class} property GL_FOG_DENSITY: Integer read _GetGL_FOG_DENSITY;
    {class} property GL_FOG_END: Integer read _GetGL_FOG_END;
    {class} property GL_FOG_HINT: Integer read _GetGL_FOG_HINT;
    {class} property GL_FOG_MODE: Integer read _GetGL_FOG_MODE;
    {class} property GL_FOG_START: Integer read _GetGL_FOG_START;
    {class} property GL_FRONT: Integer read _GetGL_FRONT;
    {class} property GL_FRONT_AND_BACK: Integer read _GetGL_FRONT_AND_BACK;
    {class} property GL_GEQUAL: Integer read _GetGL_GEQUAL;
    {class} property GL_GREATER: Integer read _GetGL_GREATER;
    {class} property GL_GREEN_BITS: Integer read _GetGL_GREEN_BITS;
    {class} property GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES: Integer read _GetGL_IMPLEMENTATION_COLOR_READ_FORMAT_OES;
    {class} property GL_IMPLEMENTATION_COLOR_READ_TYPE_OES: Integer read _GetGL_IMPLEMENTATION_COLOR_READ_TYPE_OES;
    {class} property GL_INCR: Integer read _GetGL_INCR;
    {class} property GL_INVALID_ENUM: Integer read _GetGL_INVALID_ENUM;
    {class} property GL_INVALID_OPERATION: Integer read _GetGL_INVALID_OPERATION;
    {class} property GL_INVALID_VALUE: Integer read _GetGL_INVALID_VALUE;
    {class} property GL_INVERT: Integer read _GetGL_INVERT;
    {class} property GL_KEEP: Integer read _GetGL_KEEP;
    {class} property GL_LEQUAL: Integer read _GetGL_LEQUAL;
    {class} property GL_LESS: Integer read _GetGL_LESS;
    {class} property GL_LIGHT0: Integer read _GetGL_LIGHT0;
    {class} property GL_LIGHT1: Integer read _GetGL_LIGHT1;
    {class} property GL_LIGHT2: Integer read _GetGL_LIGHT2;
    {class} property GL_LIGHT3: Integer read _GetGL_LIGHT3;
    {class} property GL_LIGHT4: Integer read _GetGL_LIGHT4;
    {class} property GL_LIGHT5: Integer read _GetGL_LIGHT5;
    {class} property GL_LIGHT6: Integer read _GetGL_LIGHT6;
    {class} property GL_LIGHT7: Integer read _GetGL_LIGHT7;
    {class} property GL_LIGHTING: Integer read _GetGL_LIGHTING;
    {class} property GL_LIGHT_MODEL_AMBIENT: Integer read _GetGL_LIGHT_MODEL_AMBIENT;
    {class} property GL_LIGHT_MODEL_TWO_SIDE: Integer read _GetGL_LIGHT_MODEL_TWO_SIDE;
    {class} property GL_LINEAR: Integer read _GetGL_LINEAR;
    {class} property GL_LINEAR_ATTENUATION: Integer read _GetGL_LINEAR_ATTENUATION;
    {class} property GL_LINEAR_MIPMAP_LINEAR: Integer read _GetGL_LINEAR_MIPMAP_LINEAR;
    {class} property GL_LINEAR_MIPMAP_NEAREST: Integer read _GetGL_LINEAR_MIPMAP_NEAREST;
    {class} property GL_LINES: Integer read _GetGL_LINES;
    {class} property GL_LINE_LOOP: Integer read _GetGL_LINE_LOOP;
    {class} property GL_LINE_SMOOTH: Integer read _GetGL_LINE_SMOOTH;
    {class} property GL_LINE_SMOOTH_HINT: Integer read _GetGL_LINE_SMOOTH_HINT;
    {class} property GL_LINE_STRIP: Integer read _GetGL_LINE_STRIP;
    {class} property GL_LUMINANCE: Integer read _GetGL_LUMINANCE;
    {class} property GL_LUMINANCE_ALPHA: Integer read _GetGL_LUMINANCE_ALPHA;
    {class} property GL_MAX_ELEMENTS_INDICES: Integer read _GetGL_MAX_ELEMENTS_INDICES;
    {class} property GL_MAX_ELEMENTS_VERTICES: Integer read _GetGL_MAX_ELEMENTS_VERTICES;
    {class} property GL_MAX_LIGHTS: Integer read _GetGL_MAX_LIGHTS;
    {class} property GL_MAX_MODELVIEW_STACK_DEPTH: Integer read _GetGL_MAX_MODELVIEW_STACK_DEPTH;
    {class} property GL_MAX_PROJECTION_STACK_DEPTH: Integer read _GetGL_MAX_PROJECTION_STACK_DEPTH;
    {class} property GL_MAX_TEXTURE_SIZE: Integer read _GetGL_MAX_TEXTURE_SIZE;
    {class} property GL_MAX_TEXTURE_STACK_DEPTH: Integer read _GetGL_MAX_TEXTURE_STACK_DEPTH;
    {class} property GL_MAX_TEXTURE_UNITS: Integer read _GetGL_MAX_TEXTURE_UNITS;
    {class} property GL_MAX_VIEWPORT_DIMS: Integer read _GetGL_MAX_VIEWPORT_DIMS;
    {class} property GL_MODELVIEW: Integer read _GetGL_MODELVIEW;
    {class} property GL_MODULATE: Integer read _GetGL_MODULATE;
    {class} property GL_MULTISAMPLE: Integer read _GetGL_MULTISAMPLE;
    {class} property GL_NAND: Integer read _GetGL_NAND;
    {class} property GL_NEAREST: Integer read _GetGL_NEAREST;
    {class} property GL_NEAREST_MIPMAP_LINEAR: Integer read _GetGL_NEAREST_MIPMAP_LINEAR;
    {class} property GL_NEAREST_MIPMAP_NEAREST: Integer read _GetGL_NEAREST_MIPMAP_NEAREST;
    {class} property GL_NEVER: Integer read _GetGL_NEVER;
    {class} property GL_NICEST: Integer read _GetGL_NICEST;
    {class} property GL_NOOP: Integer read _GetGL_NOOP;
    {class} property GL_NOR: Integer read _GetGL_NOR;
    {class} property GL_NORMALIZE: Integer read _GetGL_NORMALIZE;
    {class} property GL_NORMAL_ARRAY: Integer read _GetGL_NORMAL_ARRAY;
    {class} property GL_NOTEQUAL: Integer read _GetGL_NOTEQUAL;
    {class} property GL_NO_ERROR: Integer read _GetGL_NO_ERROR;
    {class} property GL_NUM_COMPRESSED_TEXTURE_FORMATS: Integer read _GetGL_NUM_COMPRESSED_TEXTURE_FORMATS;
    {class} property GL_ONE: Integer read _GetGL_ONE;
    {class} property GL_ONE_MINUS_DST_ALPHA: Integer read _GetGL_ONE_MINUS_DST_ALPHA;
    {class} property GL_ONE_MINUS_DST_COLOR: Integer read _GetGL_ONE_MINUS_DST_COLOR;
    {class} property GL_ONE_MINUS_SRC_ALPHA: Integer read _GetGL_ONE_MINUS_SRC_ALPHA;
    {class} property GL_ONE_MINUS_SRC_COLOR: Integer read _GetGL_ONE_MINUS_SRC_COLOR;
    {class} property GL_OR: Integer read _GetGL_OR;
    {class} property GL_OR_INVERTED: Integer read _GetGL_OR_INVERTED;
    {class} property GL_OR_REVERSE: Integer read _GetGL_OR_REVERSE;
    {class} property GL_OUT_OF_MEMORY: Integer read _GetGL_OUT_OF_MEMORY;
    {class} property GL_PACK_ALIGNMENT: Integer read _GetGL_PACK_ALIGNMENT;
    {class} property GL_PALETTE4_R5_G6_B5_OES: Integer read _GetGL_PALETTE4_R5_G6_B5_OES;
    {class} property GL_PALETTE4_RGB5_A1_OES: Integer read _GetGL_PALETTE4_RGB5_A1_OES;
    {class} property GL_PALETTE4_RGB8_OES: Integer read _GetGL_PALETTE4_RGB8_OES;
    {class} property GL_PALETTE4_RGBA4_OES: Integer read _GetGL_PALETTE4_RGBA4_OES;
    {class} property GL_PALETTE4_RGBA8_OES: Integer read _GetGL_PALETTE4_RGBA8_OES;
    {class} property GL_PALETTE8_R5_G6_B5_OES: Integer read _GetGL_PALETTE8_R5_G6_B5_OES;
    {class} property GL_PALETTE8_RGB5_A1_OES: Integer read _GetGL_PALETTE8_RGB5_A1_OES;
    {class} property GL_PALETTE8_RGB8_OES: Integer read _GetGL_PALETTE8_RGB8_OES;
    {class} property GL_PALETTE8_RGBA4_OES: Integer read _GetGL_PALETTE8_RGBA4_OES;
    {class} property GL_PALETTE8_RGBA8_OES: Integer read _GetGL_PALETTE8_RGBA8_OES;
    {class} property GL_PERSPECTIVE_CORRECTION_HINT: Integer read _GetGL_PERSPECTIVE_CORRECTION_HINT;
    {class} property GL_POINTS: Integer read _GetGL_POINTS;
    {class} property GL_POINT_FADE_THRESHOLD_SIZE: Integer read _GetGL_POINT_FADE_THRESHOLD_SIZE;
    {class} property GL_POINT_SIZE: Integer read _GetGL_POINT_SIZE;
    {class} property GL_POINT_SMOOTH: Integer read _GetGL_POINT_SMOOTH;
    {class} property GL_POINT_SMOOTH_HINT: Integer read _GetGL_POINT_SMOOTH_HINT;
    {class} property GL_POLYGON_OFFSET_FILL: Integer read _GetGL_POLYGON_OFFSET_FILL;
    {class} property GL_POLYGON_SMOOTH_HINT: Integer read _GetGL_POLYGON_SMOOTH_HINT;
    {class} property GL_POSITION: Integer read _GetGL_POSITION;
    {class} property GL_PROJECTION: Integer read _GetGL_PROJECTION;
    {class} property GL_QUADRATIC_ATTENUATION: Integer read _GetGL_QUADRATIC_ATTENUATION;
    {class} property GL_RED_BITS: Integer read _GetGL_RED_BITS;
    {class} property GL_RENDERER: Integer read _GetGL_RENDERER;
    {class} property GL_REPEAT: Integer read _GetGL_REPEAT;
    {class} property GL_REPLACE: Integer read _GetGL_REPLACE;
    {class} property GL_RESCALE_NORMAL: Integer read _GetGL_RESCALE_NORMAL;
    {class} property GL_RGB: Integer read _GetGL_RGB;
    {class} property GL_RGBA: Integer read _GetGL_RGBA;
    {class} property GL_SAMPLE_ALPHA_TO_COVERAGE: Integer read _GetGL_SAMPLE_ALPHA_TO_COVERAGE;
    {class} property GL_SAMPLE_ALPHA_TO_ONE: Integer read _GetGL_SAMPLE_ALPHA_TO_ONE;
    {class} property GL_SAMPLE_COVERAGE: Integer read _GetGL_SAMPLE_COVERAGE;
    {class} property GL_SCISSOR_TEST: Integer read _GetGL_SCISSOR_TEST;
    {class} property GL_SET: Integer read _GetGL_SET;
    {class} property GL_SHININESS: Integer read _GetGL_SHININESS;
    {class} property GL_SHORT: Integer read _GetGL_SHORT;
    {class} property GL_SMOOTH: Integer read _GetGL_SMOOTH;
    {class} property GL_SMOOTH_LINE_WIDTH_RANGE: Integer read _GetGL_SMOOTH_LINE_WIDTH_RANGE;
    {class} property GL_SMOOTH_POINT_SIZE_RANGE: Integer read _GetGL_SMOOTH_POINT_SIZE_RANGE;
    {class} property GL_SPECULAR: Integer read _GetGL_SPECULAR;
    {class} property GL_SPOT_CUTOFF: Integer read _GetGL_SPOT_CUTOFF;
    {class} property GL_SPOT_DIRECTION: Integer read _GetGL_SPOT_DIRECTION;
    {class} property GL_SPOT_EXPONENT: Integer read _GetGL_SPOT_EXPONENT;
    {class} property GL_SRC_ALPHA: Integer read _GetGL_SRC_ALPHA;
    {class} property GL_SRC_ALPHA_SATURATE: Integer read _GetGL_SRC_ALPHA_SATURATE;
    {class} property GL_SRC_COLOR: Integer read _GetGL_SRC_COLOR;
    {class} property GL_STACK_OVERFLOW: Integer read _GetGL_STACK_OVERFLOW;
    {class} property GL_STACK_UNDERFLOW: Integer read _GetGL_STACK_UNDERFLOW;
    {class} property GL_STENCIL_BITS: Integer read _GetGL_STENCIL_BITS;
    {class} property GL_STENCIL_BUFFER_BIT: Integer read _GetGL_STENCIL_BUFFER_BIT;
    {class} property GL_STENCIL_TEST: Integer read _GetGL_STENCIL_TEST;
    {class} property GL_SUBPIXEL_BITS: Integer read _GetGL_SUBPIXEL_BITS;
    {class} property GL_TEXTURE: Integer read _GetGL_TEXTURE;
    {class} property GL_TEXTURE0: Integer read _GetGL_TEXTURE0;
    {class} property GL_TEXTURE1: Integer read _GetGL_TEXTURE1;
    {class} property GL_TEXTURE10: Integer read _GetGL_TEXTURE10;
    {class} property GL_TEXTURE11: Integer read _GetGL_TEXTURE11;
    {class} property GL_TEXTURE12: Integer read _GetGL_TEXTURE12;
    {class} property GL_TEXTURE13: Integer read _GetGL_TEXTURE13;
    {class} property GL_TEXTURE14: Integer read _GetGL_TEXTURE14;
    {class} property GL_TEXTURE15: Integer read _GetGL_TEXTURE15;
    {class} property GL_TEXTURE16: Integer read _GetGL_TEXTURE16;
    {class} property GL_TEXTURE17: Integer read _GetGL_TEXTURE17;
    {class} property GL_TEXTURE18: Integer read _GetGL_TEXTURE18;
    {class} property GL_TEXTURE19: Integer read _GetGL_TEXTURE19;
    {class} property GL_TEXTURE2: Integer read _GetGL_TEXTURE2;
    {class} property GL_TEXTURE20: Integer read _GetGL_TEXTURE20;
    {class} property GL_TEXTURE21: Integer read _GetGL_TEXTURE21;
    {class} property GL_TEXTURE22: Integer read _GetGL_TEXTURE22;
    {class} property GL_TEXTURE23: Integer read _GetGL_TEXTURE23;
    {class} property GL_TEXTURE24: Integer read _GetGL_TEXTURE24;
    {class} property GL_TEXTURE25: Integer read _GetGL_TEXTURE25;
    {class} property GL_TEXTURE26: Integer read _GetGL_TEXTURE26;
    {class} property GL_TEXTURE27: Integer read _GetGL_TEXTURE27;
    {class} property GL_TEXTURE28: Integer read _GetGL_TEXTURE28;
    {class} property GL_TEXTURE29: Integer read _GetGL_TEXTURE29;
    {class} property GL_TEXTURE3: Integer read _GetGL_TEXTURE3;
    {class} property GL_TEXTURE30: Integer read _GetGL_TEXTURE30;
    {class} property GL_TEXTURE31: Integer read _GetGL_TEXTURE31;
    {class} property GL_TEXTURE4: Integer read _GetGL_TEXTURE4;
    {class} property GL_TEXTURE5: Integer read _GetGL_TEXTURE5;
    {class} property GL_TEXTURE6: Integer read _GetGL_TEXTURE6;
    {class} property GL_TEXTURE7: Integer read _GetGL_TEXTURE7;
    {class} property GL_TEXTURE8: Integer read _GetGL_TEXTURE8;
    {class} property GL_TEXTURE9: Integer read _GetGL_TEXTURE9;
    {class} property GL_TEXTURE_2D: Integer read _GetGL_TEXTURE_2D;
    {class} property GL_TEXTURE_COORD_ARRAY: Integer read _GetGL_TEXTURE_COORD_ARRAY;
    {class} property GL_TEXTURE_ENV: Integer read _GetGL_TEXTURE_ENV;
    {class} property GL_TEXTURE_ENV_COLOR: Integer read _GetGL_TEXTURE_ENV_COLOR;
    {class} property GL_TEXTURE_ENV_MODE: Integer read _GetGL_TEXTURE_ENV_MODE;
    {class} property GL_TEXTURE_MAG_FILTER: Integer read _GetGL_TEXTURE_MAG_FILTER;
    {class} property GL_TEXTURE_MIN_FILTER: Integer read _GetGL_TEXTURE_MIN_FILTER;
    {class} property GL_TEXTURE_WRAP_S: Integer read _GetGL_TEXTURE_WRAP_S;
    {class} property GL_TEXTURE_WRAP_T: Integer read _GetGL_TEXTURE_WRAP_T;
    {class} property GL_TRIANGLES: Integer read _GetGL_TRIANGLES;
    {class} property GL_TRIANGLE_FAN: Integer read _GetGL_TRIANGLE_FAN;
    {class} property GL_TRIANGLE_STRIP: Integer read _GetGL_TRIANGLE_STRIP;
    {class} property GL_TRUE: Integer read _GetGL_TRUE;
    {class} property GL_UNPACK_ALIGNMENT: Integer read _GetGL_UNPACK_ALIGNMENT;
    {class} property GL_UNSIGNED_BYTE: Integer read _GetGL_UNSIGNED_BYTE;
    {class} property GL_UNSIGNED_SHORT: Integer read _GetGL_UNSIGNED_SHORT;
    {class} property GL_UNSIGNED_SHORT_4_4_4_4: Integer read _GetGL_UNSIGNED_SHORT_4_4_4_4;
    {class} property GL_UNSIGNED_SHORT_5_5_5_1: Integer read _GetGL_UNSIGNED_SHORT_5_5_5_1;
    {class} property GL_UNSIGNED_SHORT_5_6_5: Integer read _GetGL_UNSIGNED_SHORT_5_6_5;
    {class} property GL_VENDOR: Integer read _GetGL_VENDOR;
    {class} property GL_VERSION: Integer read _GetGL_VERSION;
    {class} property GL_VERTEX_ARRAY: Integer read _GetGL_VERTEX_ARRAY;
    {class} property GL_XOR: Integer read _GetGL_XOR;
    {class} property GL_ZERO: Integer read _GetGL_ZERO;
  end;

  [JavaSignature('javax/microedition/khronos/opengles/GL10')]
  JGL10 = interface(JGL)
    ['{4F032613-C505-4409-A116-09343E69472F}']
    procedure glActiveTexture(texture: Integer); cdecl;
    procedure glAlphaFunc(func: Integer; ref: Single); cdecl;
    procedure glAlphaFuncx(func: Integer; ref: Integer); cdecl;
    procedure glBindTexture(target: Integer; texture: Integer); cdecl;
    procedure glBlendFunc(sfactor: Integer; dfactor: Integer); cdecl;
    procedure glClear(mask: Integer); cdecl;
    procedure glClearColor(red: Single; green: Single; blue: Single; alpha: Single); cdecl;
    procedure glClearColorx(red: Integer; green: Integer; blue: Integer; alpha: Integer); cdecl;
    procedure glClearDepthf(depth: Single); cdecl;
    procedure glClearDepthx(depth: Integer); cdecl;
    procedure glClearStencil(s: Integer); cdecl;
    procedure glClientActiveTexture(texture: Integer); cdecl;
    procedure glColor4f(red: Single; green: Single; blue: Single; alpha: Single); cdecl;
    procedure glColor4x(red: Integer; green: Integer; blue: Integer; alpha: Integer); cdecl;
    procedure glColorMask(red: Boolean; green: Boolean; blue: Boolean; alpha: Boolean); cdecl;
    procedure glColorPointer(size: Integer; type_: Integer; stride: Integer; pointer: JBuffer); cdecl;
    procedure glCompressedTexImage2D(target: Integer; level: Integer; internalformat: Integer; width: Integer; height: Integer; border: Integer; imageSize: Integer; data: JBuffer); cdecl;
    procedure glCompressedTexSubImage2D(target: Integer; level: Integer; xoffset: Integer; yoffset: Integer; width: Integer; height: Integer; format: Integer; imageSize: Integer; data: JBuffer); cdecl;
    procedure glCopyTexImage2D(target: Integer; level: Integer; internalformat: Integer; x: Integer; y: Integer; width: Integer; height: Integer; border: Integer); cdecl;
    procedure glCopyTexSubImage2D(target: Integer; level: Integer; xoffset: Integer; yoffset: Integer; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
    procedure glCullFace(mode: Integer); cdecl;
    procedure glDeleteTextures(n: Integer; textures: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glDeleteTextures(n: Integer; textures: JIntBuffer); cdecl; overload;
    procedure glDepthFunc(func: Integer); cdecl;
    procedure glDepthMask(flag: Boolean); cdecl;
    procedure glDepthRangef(zNear: Single; zFar: Single); cdecl;
    procedure glDepthRangex(zNear: Integer; zFar: Integer); cdecl;
    procedure glDisable(cap: Integer); cdecl;
    procedure glDisableClientState(array_: Integer); cdecl;
    procedure glDrawArrays(mode: Integer; first: Integer; count: Integer); cdecl;
    procedure glDrawElements(mode: Integer; count: Integer; type_: Integer; indices: JBuffer); cdecl;
    procedure glEnable(cap: Integer); cdecl;
    procedure glEnableClientState(array_: Integer); cdecl;
    procedure glFinish; cdecl;
    procedure glFlush; cdecl;
    procedure glFogf(pname: Integer; param: Single); cdecl;
    procedure glFogfv(pname: Integer; params: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glFogfv(pname: Integer; params: JFloatBuffer); cdecl; overload;
    procedure glFogx(pname: Integer; param: Integer); cdecl;
    procedure glFogxv(pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glFogxv(pname: Integer; params: JIntBuffer); cdecl; overload;
    procedure glFrontFace(mode: Integer); cdecl;
    procedure glFrustumf(left: Single; right: Single; bottom: Single; top: Single; zNear: Single; zFar: Single); cdecl;
    procedure glFrustumx(left: Integer; right: Integer; bottom: Integer; top: Integer; zNear: Integer; zFar: Integer); cdecl;
    procedure glGenTextures(n: Integer; textures: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glGenTextures(n: Integer; textures: JIntBuffer); cdecl; overload;
    function glGetError: Integer; cdecl;
    procedure glGetIntegerv(pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glGetIntegerv(pname: Integer; params: JIntBuffer); cdecl; overload;
    function glGetString(name: Integer): JString; cdecl;
    procedure glHint(target: Integer; mode: Integer); cdecl;
    procedure glLightModelf(pname: Integer; param: Single); cdecl;
    procedure glLightModelfv(pname: Integer; params: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glLightModelfv(pname: Integer; params: JFloatBuffer); cdecl; overload;
    procedure glLightModelx(pname: Integer; param: Integer); cdecl;
    procedure glLightModelxv(pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glLightModelxv(pname: Integer; params: JIntBuffer); cdecl; overload;
    procedure glLightf(light: Integer; pname: Integer; param: Single); cdecl;
    procedure glLightfv(light: Integer; pname: Integer; params: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glLightfv(light: Integer; pname: Integer; params: JFloatBuffer); cdecl; overload;
    procedure glLightx(light: Integer; pname: Integer; param: Integer); cdecl;
    procedure glLightxv(light: Integer; pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glLightxv(light: Integer; pname: Integer; params: JIntBuffer); cdecl; overload;
    procedure glLineWidth(width: Single); cdecl;
    procedure glLineWidthx(width: Integer); cdecl;
    procedure glLoadIdentity; cdecl;
    procedure glLoadMatrixf(m: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glLoadMatrixf(m: JFloatBuffer); cdecl; overload;
    procedure glLoadMatrixx(m: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glLoadMatrixx(m: JIntBuffer); cdecl; overload;
    procedure glLogicOp(opcode: Integer); cdecl;
    procedure glMaterialf(face: Integer; pname: Integer; param: Single); cdecl;
    procedure glMaterialfv(face: Integer; pname: Integer; params: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glMaterialfv(face: Integer; pname: Integer; params: JFloatBuffer); cdecl; overload;
    procedure glMaterialx(face: Integer; pname: Integer; param: Integer); cdecl;
    procedure glMaterialxv(face: Integer; pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glMaterialxv(face: Integer; pname: Integer; params: JIntBuffer); cdecl; overload;
    procedure glMatrixMode(mode: Integer); cdecl;
    procedure glMultMatrixf(m: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glMultMatrixf(m: JFloatBuffer); cdecl; overload;
    procedure glMultMatrixx(m: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glMultMatrixx(m: JIntBuffer); cdecl; overload;
    procedure glMultiTexCoord4f(target: Integer; s: Single; t: Single; r: Single; q: Single); cdecl;
    procedure glMultiTexCoord4x(target: Integer; s: Integer; t: Integer; r: Integer; q: Integer); cdecl;
    procedure glNormal3f(nx: Single; ny: Single; nz: Single); cdecl;
    procedure glNormal3x(nx: Integer; ny: Integer; nz: Integer); cdecl;
    procedure glNormalPointer(type_: Integer; stride: Integer; pointer: JBuffer); cdecl;
    procedure glOrthof(left: Single; right: Single; bottom: Single; top: Single; zNear: Single; zFar: Single); cdecl;
    procedure glOrthox(left: Integer; right: Integer; bottom: Integer; top: Integer; zNear: Integer; zFar: Integer); cdecl;
    procedure glPixelStorei(pname: Integer; param: Integer); cdecl;
    procedure glPointSize(size: Single); cdecl;
    procedure glPointSizex(size: Integer); cdecl;
    procedure glPolygonOffset(factor: Single; units: Single); cdecl;
    procedure glPolygonOffsetx(factor: Integer; units: Integer); cdecl;
    procedure glPopMatrix; cdecl;
    procedure glPushMatrix; cdecl;
    procedure glReadPixels(x: Integer; y: Integer; width: Integer; height: Integer; format: Integer; type_: Integer; pixels: JBuffer); cdecl;
    procedure glRotatef(angle: Single; x: Single; y: Single; z: Single); cdecl;
    procedure glRotatex(angle: Integer; x: Integer; y: Integer; z: Integer); cdecl;
    procedure glSampleCoverage(value: Single; invert: Boolean); cdecl;
    procedure glSampleCoveragex(value: Integer; invert: Boolean); cdecl;
    procedure glScalef(x: Single; y: Single; z: Single); cdecl;
    procedure glScalex(x: Integer; y: Integer; z: Integer); cdecl;
    procedure glScissor(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
    procedure glShadeModel(mode: Integer); cdecl;
    procedure glStencilFunc(func: Integer; ref: Integer; mask: Integer); cdecl;
    procedure glStencilMask(mask: Integer); cdecl;
    procedure glStencilOp(fail: Integer; zfail: Integer; zpass: Integer); cdecl;
    procedure glTexCoordPointer(size: Integer; type_: Integer; stride: Integer; pointer: JBuffer); cdecl;
    procedure glTexEnvf(target: Integer; pname: Integer; param: Single); cdecl;
    procedure glTexEnvfv(target: Integer; pname: Integer; params: TJavaArray<Single>; offset: Integer); cdecl; overload;
    procedure glTexEnvfv(target: Integer; pname: Integer; params: JFloatBuffer); cdecl; overload;
    procedure glTexEnvx(target: Integer; pname: Integer; param: Integer); cdecl;
    procedure glTexEnvxv(target: Integer; pname: Integer; params: TJavaArray<Integer>; offset: Integer); cdecl; overload;
    procedure glTexEnvxv(target: Integer; pname: Integer; params: JIntBuffer); cdecl; overload;
    procedure glTexImage2D(target: Integer; level: Integer; internalformat: Integer; width: Integer; height: Integer; border: Integer; format: Integer; type_: Integer; pixels: JBuffer); cdecl;
    procedure glTexParameterf(target: Integer; pname: Integer; param: Single); cdecl;
    procedure glTexParameterx(target: Integer; pname: Integer; param: Integer); cdecl;
    procedure glTexSubImage2D(target: Integer; level: Integer; xoffset: Integer; yoffset: Integer; width: Integer; height: Integer; format: Integer; type_: Integer; pixels: JBuffer); cdecl;
    procedure glTranslatef(x: Single; y: Single; z: Single); cdecl;
    procedure glTranslatex(x: Integer; y: Integer; z: Integer); cdecl;
    procedure glVertexPointer(size: Integer; type_: Integer; stride: Integer; pointer: JBuffer); cdecl;
    procedure glViewport(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  end;
  TJGL10 = class(TJavaGenericImport<JGL10Class, JGL10>) end;

  JJSONArrayClass = interface(JObjectClass)
    ['{34FBA399-2B13-49B4-BD53-5BDFE4653285}']
    {class} function init: JJSONArray; cdecl; overload;
    {class} function init(copyFrom: JCollection): JJSONArray; cdecl; overload;
    {class} function init(readFrom: JJSONTokener): JJSONArray; cdecl; overload;
    {class} function init(json: JString): JJSONArray; cdecl; overload;
    {class} function init(array_: JObject): JJSONArray; cdecl; overload;
  end;

  [JavaSignature('org/json/JSONArray')]
  JJSONArray = interface(JObject)
    ['{34738D80-ED10-413D-9467-36A3785DBFF4}']
    function equals(o: JObject): Boolean; cdecl;
    function &get(index: Integer): JObject; cdecl;
    function getBoolean(index: Integer): Boolean; cdecl;
    function getDouble(index: Integer): Double; cdecl;
    function getInt(index: Integer): Integer; cdecl;
    function getJSONArray(index: Integer): JJSONArray; cdecl;
    function getJSONObject(index: Integer): JJSONObject; cdecl;
    function getLong(index: Integer): Int64; cdecl;
    function getString(index: Integer): JString; cdecl;
    function hashCode: Integer; cdecl;
    function isNull(index: Integer): Boolean; cdecl;
    function join(separator: JString): JString; cdecl;
    function length: Integer; cdecl;
    function opt(index: Integer): JObject; cdecl;
    function optBoolean(index: Integer): Boolean; cdecl; overload;
    function optBoolean(index: Integer; fallback: Boolean): Boolean; cdecl; overload;
    function optDouble(index: Integer): Double; cdecl; overload;
    function optDouble(index: Integer; fallback: Double): Double; cdecl; overload;
    function optInt(index: Integer): Integer; cdecl; overload;
    function optInt(index: Integer; fallback: Integer): Integer; cdecl; overload;
    function optJSONArray(index: Integer): JJSONArray; cdecl;
    function optJSONObject(index: Integer): JJSONObject; cdecl;
    function optLong(index: Integer): Int64; cdecl; overload;
    function optLong(index: Integer; fallback: Int64): Int64; cdecl; overload;
    function optString(index: Integer): JString; cdecl; overload;
    function optString(index: Integer; fallback: JString): JString; cdecl; overload;
    function put(value: Boolean): JJSONArray; cdecl; overload;
    function put(value: Double): JJSONArray; cdecl; overload;
    function put(value: Integer): JJSONArray; cdecl; overload;
    function put(value: Int64): JJSONArray; cdecl; overload;
    function put(value: JObject): JJSONArray; cdecl; overload;
    function put(index: Integer; value: Boolean): JJSONArray; cdecl; overload;
    function put(index: Integer; value: Double): JJSONArray; cdecl; overload;
    function put(index: Integer; value: Integer): JJSONArray; cdecl; overload;
    function put(index: Integer; value: Int64): JJSONArray; cdecl; overload;
    function put(index: Integer; value: JObject): JJSONArray; cdecl; overload;
    function remove(index: Integer): JObject; cdecl;
    function toJSONObject(names: JJSONArray): JJSONObject; cdecl;
    function toString: JString; cdecl; overload;
    function toString(indentSpaces: Integer): JString; cdecl; overload;
  end;
  TJJSONArray = class(TJavaGenericImport<JJSONArrayClass, JJSONArray>) end;

  JJSONExceptionClass = interface(JExceptionClass)
    ['{D92F06D5-D459-4309-AE86-21A7EF971C64}']
    {class} function init(s: JString): JJSONException; cdecl;
  end;

  [JavaSignature('org/json/JSONException')]
  JJSONException = interface(JException)
    ['{236AB196-CC66-40D5-91E5-C3D202A9293C}']
  end;
  TJJSONException = class(TJavaGenericImport<JJSONExceptionClass, JJSONException>) end;

  JJSONObjectClass = interface(JObjectClass)
    ['{32FBF926-19C3-45AF-A29E-C312D95B34CC}']
    {class} function _GetNULL: JObject; cdecl;
    {class} function init: JJSONObject; cdecl; overload;
    {class} function init(copyFrom: JMap): JJSONObject; cdecl; overload;
    {class} function init(readFrom: JJSONTokener): JJSONObject; cdecl; overload;
    {class} function init(json: JString): JJSONObject; cdecl; overload;
    {class} function init(copyFrom: JJSONObject; names: TJavaObjectArray<JString>): JJSONObject; cdecl; overload;
    {class} function numberToString(number: JNumber): JString; cdecl;
    {class} function quote(data: JString): JString; cdecl;
    {class} function wrap(o: JObject): JObject; cdecl;
    {class} 
  end;

  [JavaSignature('org/json/JSONObject')]
  JJSONObject = interface(JObject)
    ['{7B4F68E8-ADFC-40EC-A119-37FA9778A11C}']
    function accumulate(name: JString; value: JObject): JJSONObject; cdecl;
    function &get(name: JString): JObject; cdecl;
    function getBoolean(name: JString): Boolean; cdecl;
    function getDouble(name: JString): Double; cdecl;
    function getInt(name: JString): Integer; cdecl;
    function getJSONArray(name: JString): JJSONArray; cdecl;
    function getJSONObject(name: JString): JJSONObject; cdecl;
    function getLong(name: JString): Int64; cdecl;
    function getString(name: JString): JString; cdecl;
    function has(name: JString): Boolean; cdecl;
    function isNull(name: JString): Boolean; cdecl;
    function keys: JIterator; cdecl;
    function length: Integer; cdecl;
    function names: JJSONArray; cdecl;
    function opt(name: JString): JObject; cdecl;
    function optBoolean(name: JString): Boolean; cdecl; overload;
    function optBoolean(name: JString; fallback: Boolean): Boolean; cdecl; overload;
    function optDouble(name: JString): Double; cdecl; overload;
    function optDouble(name: JString; fallback: Double): Double; cdecl; overload;
    function optInt(name: JString): Integer; cdecl; overload;
    function optInt(name: JString; fallback: Integer): Integer; cdecl; overload;
    function optJSONArray(name: JString): JJSONArray; cdecl;
    function optJSONObject(name: JString): JJSONObject; cdecl;
    function optLong(name: JString): Int64; cdecl; overload;
    function optLong(name: JString; fallback: Int64): Int64; cdecl; overload;
    function optString(name: JString): JString; cdecl; overload;
    function optString(name: JString; fallback: JString): JString; cdecl; overload;
    function put(name: JString; value: Boolean): JJSONObject; cdecl; overload;
    function put(name: JString; value: Double): JJSONObject; cdecl; overload;
    function put(name: JString; value: Integer): JJSONObject; cdecl; overload;
    function put(name: JString; value: Int64): JJSONObject; cdecl; overload;
    function put(name: JString; value: JObject): JJSONObject; cdecl; overload;
    function putOpt(name: JString; value: JObject): JJSONObject; cdecl;
    function remove(name: JString): JObject; cdecl;
    function toJSONArray(names: JJSONArray): JJSONArray; cdecl;
    function toString: JString; cdecl; overload;
    function toString(indentSpaces: Integer): JString; cdecl; overload;
  end;
  TJJSONObject = class(TJavaGenericImport<JJSONObjectClass, JJSONObject>) end;

  JJSONTokenerClass = interface(JObjectClass)
    ['{CFDB19D3-6222-4DBF-9012-1EF6EA1D518D}']
    {class} function init(in_: JString): JJSONTokener; cdecl;
    {class} function dehexchar(hex: Char): Integer; cdecl;
  end;

  [JavaSignature('org/json/JSONTokener')]
  JJSONTokener = interface(JObject)
    ['{A7330D36-4304-4864-BACD-547E8AF8AAAD}']
    procedure back; cdecl;
    function more: Boolean; cdecl;
    function next: Char; cdecl; overload;
    function next(c: Char): Char; cdecl; overload;
    function next(length: Integer): JString; cdecl; overload;
    function nextClean: Char; cdecl;
    function nextString(quote: Char): JString; cdecl;
    function nextTo(excluded: JString): JString; cdecl; overload;
    function nextTo(excluded: Char): JString; cdecl; overload;
    function nextValue: JObject; cdecl;
    procedure skipPast(thru: JString); cdecl;
    function skipTo(to_: Char): Char; cdecl;
    function syntaxError(message: JString): JJSONException; cdecl;
    function toString: JString; cdecl;
  end;
  TJJSONTokener = class(TJavaGenericImport<JJSONTokenerClass, JJSONTokener>) end;

  JXmlPullParserClass = interface(IJavaClass)
    ['{932020CD-42E1-42D5-A33D-5190366B7EE1}']
    {class} function _GetCDSECT: Integer; cdecl;
    {class} function _GetCOMMENT: Integer; cdecl;
    {class} function _GetDOCDECL: Integer; cdecl;
    {class} function _GetEND_DOCUMENT: Integer; cdecl;
    {class} function _GetEND_TAG: Integer; cdecl;
    {class} function _GetENTITY_REF: Integer; cdecl;
    {class} function _GetFEATURE_PROCESS_DOCDECL: JString; cdecl;
    {class} function _GetFEATURE_PROCESS_NAMESPACES: JString; cdecl;
    {class} function _GetFEATURE_REPORT_NAMESPACE_ATTRIBUTES: JString; cdecl;
    {class} function _GetFEATURE_VALIDATION: JString; cdecl;
    {class} function _GetIGNORABLE_WHITESPACE: Integer; cdecl;
    {class} function _GetNO_NAMESPACE: JString; cdecl;
    {class} function _GetPROCESSING_INSTRUCTION: Integer; cdecl;
    {class} function _GetSTART_DOCUMENT: Integer; cdecl;
    {class} function _GetSTART_TAG: Integer; cdecl;
    {class} function _GetTEXT: Integer; cdecl;
    {class} function _GetTYPES: TJavaObjectArray<JString>; cdecl;
    {class} property CDSECT: Integer read _GetCDSECT;
    {class} property COMMENT: Integer read _GetCOMMENT;
    {class} property DOCDECL: Integer read _GetDOCDECL;
    {class} property END_DOCUMENT: Integer read _GetEND_DOCUMENT;
    {class} property END_TAG: Integer read _GetEND_TAG;
    {class} property ENTITY_REF: Integer read _GetENTITY_REF;
    {class} property FEATURE_PROCESS_DOCDECL: JString read _GetFEATURE_PROCESS_DOCDECL;
    {class} property FEATURE_PROCESS_NAMESPACES: JString read _GetFEATURE_PROCESS_NAMESPACES;
    {class} property FEATURE_REPORT_NAMESPACE_ATTRIBUTES: JString read _GetFEATURE_REPORT_NAMESPACE_ATTRIBUTES;
    {class} property FEATURE_VALIDATION: JString read _GetFEATURE_VALIDATION;
    {class} property IGNORABLE_WHITESPACE: Integer read _GetIGNORABLE_WHITESPACE;
    {class} property NO_NAMESPACE: JString read _GetNO_NAMESPACE;
    {class} property PROCESSING_INSTRUCTION: Integer read _GetPROCESSING_INSTRUCTION;
    {class} property START_DOCUMENT: Integer read _GetSTART_DOCUMENT;
    {class} property START_TAG: Integer read _GetSTART_TAG;
    {class} property TEXT: Integer read _GetTEXT;
    {class} property TYPES: TJavaObjectArray<JString> read _GetTYPES;
  end;

  [JavaSignature('org/xmlpull/v1/XmlPullParser')]
  JXmlPullParser = interface(IJavaInstance)
    ['{047BC31A-D436-4663-A1F8-E304CC9B5CFE}']
    procedure defineEntityReplacementText(entityName: JString; replacementText: JString); cdecl;
    function getAttributeCount: Integer; cdecl;
    function getAttributeName(index: Integer): JString; cdecl;
    function getAttributeNamespace(index: Integer): JString; cdecl;
    function getAttributePrefix(index: Integer): JString; cdecl;
    function getAttributeType(index: Integer): JString; cdecl;
    function getAttributeValue(index: Integer): JString; cdecl; overload;
    function getAttributeValue(namespace: JString; name: JString): JString; cdecl; overload;
    function getColumnNumber: Integer; cdecl;
    function getDepth: Integer; cdecl;
    function getEventType: Integer; cdecl;
    function getFeature(name: JString): Boolean; cdecl;
    function getInputEncoding: JString; cdecl;
    function getLineNumber: Integer; cdecl;
    function getName: JString; cdecl;
    function getNamespace(prefix: JString): JString; cdecl; overload;
    function getNamespace: JString; cdecl; overload;
    function getNamespaceCount(depth: Integer): Integer; cdecl;
    function getNamespacePrefix(pos: Integer): JString; cdecl;
    function getNamespaceUri(pos: Integer): JString; cdecl;
    function getPositionDescription: JString; cdecl;
    function getPrefix: JString; cdecl;
    function getProperty(name: JString): JObject; cdecl;
    function getText: JString; cdecl;
    function getTextCharacters(holderForStartAndLength: TJavaArray<Integer>): TJavaArray<Char>; cdecl;
    function isAttributeDefault(index: Integer): Boolean; cdecl;
    function isEmptyElementTag: Boolean; cdecl;
    function isWhitespace: Boolean; cdecl;
    function next: Integer; cdecl;
    function nextTag: Integer; cdecl;
    function nextText: JString; cdecl;
    function nextToken: Integer; cdecl;
    procedure require(type_: Integer; namespace: JString; name: JString); cdecl;
    procedure setFeature(name: JString; state: Boolean); cdecl;
    procedure setInput(in_: JReader); cdecl; overload;
    procedure setInput(inputStream: JInputStream; inputEncoding: JString); cdecl; overload;
    procedure setProperty(name: JString; value: JObject); cdecl;
  end;
  TJXmlPullParser = class(TJavaGenericImport<JXmlPullParserClass, JXmlPullParser>) end;

  JXmlSerializerClass = interface(IJavaClass)
    ['{358A6AC9-1AF2-497F-BFBE-CF975CCAAF07}']
  end;

  [JavaSignature('org/xmlpull/v1/XmlSerializer')]
  JXmlSerializer = interface(IJavaInstance)
    ['{A16E0414-9A1D-499F-839F-E89BDA70DFB5}']
    function attribute(namespace: JString; name: JString; value: JString): JXmlSerializer; cdecl;
    procedure cdsect(text: JString); cdecl;
    procedure comment(text: JString); cdecl;
    procedure docdecl(text: JString); cdecl;
    procedure endDocument; cdecl;
    function endTag(namespace: JString; name: JString): JXmlSerializer; cdecl;
    procedure entityRef(text: JString); cdecl;
    procedure flush; cdecl;
    function getDepth: Integer; cdecl;
    function getFeature(name: JString): Boolean; cdecl;
    function getName: JString; cdecl;
    function getNamespace: JString; cdecl;
    function getPrefix(namespace: JString; generatePrefix: Boolean): JString; cdecl;
    function getProperty(name: JString): JObject; cdecl;
    procedure ignorableWhitespace(text: JString); cdecl;
    procedure processingInstruction(text: JString); cdecl;
    procedure setFeature(name: JString; state: Boolean); cdecl;
    procedure setOutput(os: JOutputStream; encoding: JString); cdecl; overload;
    procedure setOutput(writer: JWriter); cdecl; overload;
    procedure setPrefix(prefix: JString; namespace: JString); cdecl;
    procedure setProperty(name: JString; value: JObject); cdecl;
    procedure startDocument(encoding: JString; standalone: JBoolean); cdecl;
    function startTag(namespace: JString; name: JString): JXmlSerializer; cdecl;
    function text(text: JString): JXmlSerializer; cdecl; overload;
    function text(buf: TJavaArray<Char>; start: Integer; len: Integer): JXmlSerializer; cdecl; overload;
  end;
  TJXmlSerializer = class(TJavaGenericImport<JXmlSerializerClass, JXmlSerializer>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JObject', TypeInfo(Androidapi.JNI.JavaTypes.JObject));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JInputStream', TypeInfo(Androidapi.JNI.JavaTypes.JInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByteArrayInputStream', TypeInfo(Androidapi.JNI.JavaTypes.JByteArrayInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOutputStream', TypeInfo(Androidapi.JNI.JavaTypes.JOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByteArrayOutputStream', TypeInfo(Androidapi.JNI.JavaTypes.JByteArrayOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAutoCloseable', TypeInfo(Androidapi.JNI.JavaTypes.JAutoCloseable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCloseable', TypeInfo(Androidapi.JNI.JavaTypes.JCloseable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFile', TypeInfo(Androidapi.JNI.JavaTypes.JFile));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileDescriptor', TypeInfo(Androidapi.JNI.JavaTypes.JFileDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileFilter', TypeInfo(Androidapi.JNI.JavaTypes.JFileFilter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileInputStream', TypeInfo(Androidapi.JNI.JavaTypes.JFileInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileOutputStream', TypeInfo(Androidapi.JNI.JavaTypes.JFileOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFilenameFilter', TypeInfo(Androidapi.JNI.JavaTypes.JFilenameFilter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFilterOutputStream', TypeInfo(Androidapi.JNI.JavaTypes.JFilterOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThrowable', TypeInfo(Androidapi.JNI.JavaTypes.JThrowable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JException', TypeInfo(Androidapi.JNI.JavaTypes.JException));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIOException', TypeInfo(Androidapi.JNI.JavaTypes.JIOException));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrintStream', TypeInfo(Androidapi.JNI.JavaTypes.JPrintStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWriter', TypeInfo(Androidapi.JNI.JavaTypes.JWriter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrintWriter', TypeInfo(Androidapi.JNI.JavaTypes.JPrintWriter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JRandomAccessFile', TypeInfo(Androidapi.JNI.JavaTypes.JRandomAccessFile));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JReader', TypeInfo(Androidapi.JNI.JavaTypes.JReader));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSerializable', TypeInfo(Androidapi.JNI.JavaTypes.JSerializable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractStringBuilder', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractStringBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAppendable', TypeInfo(Androidapi.JNI.JavaTypes.JAppendable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBoolean', TypeInfo(Androidapi.JNI.JavaTypes.JBoolean));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JNumber', TypeInfo(Androidapi.JNI.JavaTypes.JNumber));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByte', TypeInfo(Androidapi.JNI.JavaTypes.JByte));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharSequence', TypeInfo(Androidapi.JNI.JavaTypes.JCharSequence));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jlang_Class', TypeInfo(Androidapi.JNI.JavaTypes.Jlang_Class));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JClassLoader', TypeInfo(Androidapi.JNI.JavaTypes.JClassLoader));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCloneable', TypeInfo(Androidapi.JNI.JavaTypes.JCloneable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JComparable', TypeInfo(Androidapi.JNI.JavaTypes.JComparable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDouble', TypeInfo(Androidapi.JNI.JavaTypes.JDouble));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEnum', TypeInfo(Androidapi.JNI.JavaTypes.JEnum));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFloat', TypeInfo(Androidapi.JNI.JavaTypes.JFloat));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JRuntimeException', TypeInfo(Androidapi.JNI.JavaTypes.JRuntimeException));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIllegalStateException', TypeInfo(Androidapi.JNI.JavaTypes.JIllegalStateException));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JInteger', TypeInfo(Androidapi.JNI.JavaTypes.JInteger));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIterable', TypeInfo(Androidapi.JNI.JavaTypes.JIterable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLong', TypeInfo(Androidapi.JNI.JavaTypes.JLong));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPackage', TypeInfo(Androidapi.JNI.JavaTypes.JPackage));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JRunnable', TypeInfo(Androidapi.JNI.JavaTypes.JRunnable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JShort', TypeInfo(Androidapi.JNI.JavaTypes.JShort));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JStackTraceElement', TypeInfo(Androidapi.JNI.JavaTypes.JStackTraceElement));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JString', TypeInfo(Androidapi.JNI.JavaTypes.JString));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JStringBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JStringBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JStringBuilder', TypeInfo(Androidapi.JNI.JavaTypes.JStringBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThread', TypeInfo(Androidapi.JNI.JavaTypes.JThread));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThread_State', TypeInfo(Androidapi.JNI.JavaTypes.JThread_State));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThread_UncaughtExceptionHandler', TypeInfo(Androidapi.JNI.JavaTypes.JThread_UncaughtExceptionHandler));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThreadGroup', TypeInfo(Androidapi.JNI.JavaTypes.JThreadGroup));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAnnotation', TypeInfo(Androidapi.JNI.JavaTypes.JAnnotation));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAccessibleObject', TypeInfo(Androidapi.JNI.JavaTypes.JAccessibleObject));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAnnotatedElement', TypeInfo(Androidapi.JNI.JavaTypes.JAnnotatedElement));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JExecutable', TypeInfo(Androidapi.JNI.JavaTypes.JExecutable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JConstructor', TypeInfo(Androidapi.JNI.JavaTypes.JConstructor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JField', TypeInfo(Androidapi.JNI.JavaTypes.JField));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JGenericDeclaration', TypeInfo(Androidapi.JNI.JavaTypes.JGenericDeclaration));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JMethod', TypeInfo(Androidapi.JNI.JavaTypes.JMethod));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JParameter', TypeInfo(Androidapi.JNI.JavaTypes.JParameter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jreflect_Type', TypeInfo(Androidapi.JNI.JavaTypes.Jreflect_Type));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTypeVariable', TypeInfo(Androidapi.JNI.JavaTypes.JTypeVariable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBigInteger', TypeInfo(Androidapi.JNI.JavaTypes.JBigInteger));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByteBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JByteBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByteOrder', TypeInfo(Androidapi.JNI.JavaTypes.JByteOrder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JCharBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFloatBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JFloatBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JIntBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JLongBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JMappedByteBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JMappedByteBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JShortBuffer', TypeInfo(Androidapi.JNI.JavaTypes.JShortBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAsynchronousFileChannel', TypeInfo(Androidapi.JNI.JavaTypes.JAsynchronousFileChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChannel', TypeInfo(Androidapi.JNI.JavaTypes.JChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JReadableByteChannel', TypeInfo(Androidapi.JNI.JavaTypes.JReadableByteChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JByteChannel', TypeInfo(Androidapi.JNI.JavaTypes.JByteChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCompletionHandler', TypeInfo(Androidapi.JNI.JavaTypes.JCompletionHandler));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractInterruptibleChannel', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractInterruptibleChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSelectableChannel', TypeInfo(Androidapi.JNI.JavaTypes.JSelectableChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractSelectableChannel', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractSelectableChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDatagramChannel', TypeInfo(Androidapi.JNI.JavaTypes.JDatagramChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileChannel', TypeInfo(Androidapi.JNI.JavaTypes.JFileChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileChannel_MapMode', TypeInfo(Androidapi.JNI.JavaTypes.JFileChannel_MapMode));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileLock', TypeInfo(Androidapi.JNI.JavaTypes.JFileLock));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPipe', TypeInfo(Androidapi.JNI.JavaTypes.JPipe));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPipe_SinkChannel', TypeInfo(Androidapi.JNI.JavaTypes.JPipe_SinkChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPipe_SourceChannel', TypeInfo(Androidapi.JNI.JavaTypes.JPipe_SourceChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSeekableByteChannel', TypeInfo(Androidapi.JNI.JavaTypes.JSeekableByteChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSelectionKey', TypeInfo(Androidapi.JNI.JavaTypes.JSelectionKey));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSelector', TypeInfo(Androidapi.JNI.JavaTypes.JSelector));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JServerSocketChannel', TypeInfo(Androidapi.JNI.JavaTypes.JServerSocketChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSocketChannel', TypeInfo(Androidapi.JNI.JavaTypes.JSocketChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWritableByteChannel', TypeInfo(Androidapi.JNI.JavaTypes.JWritableByteChannel));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractSelector', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractSelector));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSelectorProvider', TypeInfo(Androidapi.JNI.JavaTypes.JSelectorProvider));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharset', TypeInfo(Androidapi.JNI.JavaTypes.JCharset));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharsetDecoder', TypeInfo(Androidapi.JNI.JavaTypes.JCharsetDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharsetEncoder', TypeInfo(Androidapi.JNI.JavaTypes.JCharsetEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCoderResult', TypeInfo(Androidapi.JNI.JavaTypes.JCoderResult));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCodingErrorAction', TypeInfo(Androidapi.JNI.JavaTypes.JCodingErrorAction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAccessMode', TypeInfo(Androidapi.JNI.JavaTypes.JAccessMode));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCopyOption', TypeInfo(Androidapi.JNI.JavaTypes.JCopyOption));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDirectoryStream', TypeInfo(Androidapi.JNI.JavaTypes.JDirectoryStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDirectoryStream_Filter', TypeInfo(Androidapi.JNI.JavaTypes.JDirectoryStream_Filter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileStore', TypeInfo(Androidapi.JNI.JavaTypes.JFileStore));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileSystem', TypeInfo(Androidapi.JNI.JavaTypes.JFileSystem));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLinkOption', TypeInfo(Androidapi.JNI.JavaTypes.JLinkOption));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOpenOption', TypeInfo(Androidapi.JNI.JavaTypes.JOpenOption));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jfile_Path', TypeInfo(Androidapi.JNI.JavaTypes.Jfile_Path));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPathMatcher', TypeInfo(Androidapi.JNI.JavaTypes.JPathMatcher));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWatchEvent_Kind', TypeInfo(Androidapi.JNI.JavaTypes.JWatchEvent_Kind));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWatchEvent_Modifier', TypeInfo(Androidapi.JNI.JavaTypes.JWatchEvent_Modifier));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWatchKey', TypeInfo(Androidapi.JNI.JavaTypes.JWatchKey));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWatchService', TypeInfo(Androidapi.JNI.JavaTypes.JWatchService));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JWatchable', TypeInfo(Androidapi.JNI.JavaTypes.JWatchable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAttributeView', TypeInfo(Androidapi.JNI.JavaTypes.JAttributeView));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBasicFileAttributes', TypeInfo(Androidapi.JNI.JavaTypes.JBasicFileAttributes));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileAttribute', TypeInfo(Androidapi.JNI.JavaTypes.JFileAttribute));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileAttributeView', TypeInfo(Androidapi.JNI.JavaTypes.JFileAttributeView));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileStoreAttributeView', TypeInfo(Androidapi.JNI.JavaTypes.JFileStoreAttributeView));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileTime', TypeInfo(Androidapi.JNI.JavaTypes.JFileTime));
  //TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JUserPrincipal', TypeInfo(Androidapi.JNI.JavaTypes.JUserPrincipal));
  //TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JGroupPrincipal', TypeInfo(Androidapi.JNI.JavaTypes.JGroupPrincipal));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JUserPrincipalLookupService', TypeInfo(Androidapi.JNI.JavaTypes.JUserPrincipalLookupService));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFileSystemProvider', TypeInfo(Androidapi.JNI.JavaTypes.JFileSystemProvider));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCharacterIterator', TypeInfo(Androidapi.JNI.JavaTypes.JCharacterIterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAttributedCharacterIterator', TypeInfo(Androidapi.JNI.JavaTypes.JAttributedCharacterIterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAttributedCharacterIterator_Attribute', TypeInfo(Androidapi.JNI.JavaTypes.JAttributedCharacterIterator_Attribute));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFieldPosition', TypeInfo(Androidapi.JNI.JavaTypes.JFieldPosition));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFormat', TypeInfo(Androidapi.JNI.JavaTypes.JFormat));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFormat_Field', TypeInfo(Androidapi.JNI.JavaTypes.JFormat_Field));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JParsePosition', TypeInfo(Androidapi.JNI.JavaTypes.JParsePosition));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JClock', TypeInfo(Androidapi.JNI.JavaTypes.JClock));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDayOfWeek', TypeInfo(Androidapi.JNI.JavaTypes.JDayOfWeek));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jtime_Duration', TypeInfo(Androidapi.JNI.JavaTypes.Jtime_Duration));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JInstant', TypeInfo(Androidapi.JNI.JavaTypes.JInstant));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocalDate', TypeInfo(Androidapi.JNI.JavaTypes.JLocalDate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocalDateTime', TypeInfo(Androidapi.JNI.JavaTypes.JLocalDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocalTime', TypeInfo(Androidapi.JNI.JavaTypes.JLocalTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JMonth', TypeInfo(Androidapi.JNI.JavaTypes.JMonth));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOffsetDateTime', TypeInfo(Androidapi.JNI.JavaTypes.JOffsetDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOffsetTime', TypeInfo(Androidapi.JNI.JavaTypes.JOffsetTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPeriod', TypeInfo(Androidapi.JNI.JavaTypes.JPeriod));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JZoneId', TypeInfo(Androidapi.JNI.JavaTypes.JZoneId));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JZoneOffset', TypeInfo(Androidapi.JNI.JavaTypes.JZoneOffset));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JZonedDateTime', TypeInfo(Androidapi.JNI.JavaTypes.JZonedDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractChronology', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractChronology));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronoLocalDate', TypeInfo(Androidapi.JNI.JavaTypes.JChronoLocalDate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronoLocalDateTime', TypeInfo(Androidapi.JNI.JavaTypes.JChronoLocalDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalAmount', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalAmount));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronoPeriod', TypeInfo(Androidapi.JNI.JavaTypes.JChronoPeriod));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronoZonedDateTime', TypeInfo(Androidapi.JNI.JavaTypes.JChronoZonedDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronology', TypeInfo(Androidapi.JNI.JavaTypes.JChronology));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalAccessor', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalAccessor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEra', TypeInfo(Androidapi.JNI.JavaTypes.JEra));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIsoChronology', TypeInfo(Androidapi.JNI.JavaTypes.JIsoChronology));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIsoEra', TypeInfo(Androidapi.JNI.JavaTypes.JIsoEra));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDateTimeFormatter', TypeInfo(Androidapi.JNI.JavaTypes.JDateTimeFormatter));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDecimalStyle', TypeInfo(Androidapi.JNI.JavaTypes.JDecimalStyle));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFormatStyle', TypeInfo(Androidapi.JNI.JavaTypes.JFormatStyle));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JResolverStyle', TypeInfo(Androidapi.JNI.JavaTypes.JResolverStyle));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTextStyle', TypeInfo(Androidapi.JNI.JavaTypes.JTextStyle));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JChronoField', TypeInfo(Androidapi.JNI.JavaTypes.JChronoField));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporal', TypeInfo(Androidapi.JNI.JavaTypes.JTemporal));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalAdjuster', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalAdjuster));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalField', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalField));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalQuery', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalQuery));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTemporalUnit', TypeInfo(Androidapi.JNI.JavaTypes.JTemporalUnit));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JValueRange', TypeInfo(Androidapi.JNI.JavaTypes.JValueRange));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JZoneOffsetTransition', TypeInfo(Androidapi.JNI.JavaTypes.JZoneOffsetTransition));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JZoneRules', TypeInfo(Androidapi.JNI.JavaTypes.JZoneRules));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractCollection', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractCollection));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractList', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractList));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractMap', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractMap));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractSet', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractSet));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JArrayList', TypeInfo(Androidapi.JNI.JavaTypes.JArrayList));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBitSet', TypeInfo(Androidapi.JNI.JavaTypes.JBitSet));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCalendar', TypeInfo(Androidapi.JNI.JavaTypes.JCalendar));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCollection', TypeInfo(Androidapi.JNI.JavaTypes.JCollection));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JComparator', TypeInfo(Androidapi.JNI.JavaTypes.JComparator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDate', TypeInfo(Androidapi.JNI.JavaTypes.JDate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDictionary', TypeInfo(Androidapi.JNI.JavaTypes.JDictionary));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleSummaryStatistics', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleSummaryStatistics));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEnumSet', TypeInfo(Androidapi.JNI.JavaTypes.JEnumSet));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEnumeration', TypeInfo(Androidapi.JNI.JavaTypes.JEnumeration));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JGregorianCalendar', TypeInfo(Androidapi.JNI.JavaTypes.JGregorianCalendar));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JHashMap', TypeInfo(Androidapi.JNI.JavaTypes.JHashMap));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JHashSet', TypeInfo(Androidapi.JNI.JavaTypes.JHashSet));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JHashtable', TypeInfo(Androidapi.JNI.JavaTypes.JHashtable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntSummaryStatistics', TypeInfo(Androidapi.JNI.JavaTypes.JIntSummaryStatistics));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIterator', TypeInfo(Androidapi.JNI.JavaTypes.JIterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JList', TypeInfo(Androidapi.JNI.JavaTypes.JList));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JListIterator', TypeInfo(Androidapi.JNI.JavaTypes.JListIterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocale', TypeInfo(Androidapi.JNI.JavaTypes.JLocale));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocale_Category', TypeInfo(Androidapi.JNI.JavaTypes.JLocale_Category));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLocale_FilteringMode', TypeInfo(Androidapi.JNI.JavaTypes.JLocale_FilteringMode));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongSummaryStatistics', TypeInfo(Androidapi.JNI.JavaTypes.JLongSummaryStatistics));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JMap', TypeInfo(Androidapi.JNI.JavaTypes.JMap));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jutil_Observable', TypeInfo(Androidapi.JNI.JavaTypes.Jutil_Observable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JObserver', TypeInfo(Androidapi.JNI.JavaTypes.JObserver));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOptional', TypeInfo(Androidapi.JNI.JavaTypes.JOptional));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOptionalDouble', TypeInfo(Androidapi.JNI.JavaTypes.JOptionalDouble));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOptionalInt', TypeInfo(Androidapi.JNI.JavaTypes.JOptionalInt));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JOptionalLong', TypeInfo(Androidapi.JNI.JavaTypes.JOptionalLong));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrimitiveIterator', TypeInfo(Androidapi.JNI.JavaTypes.JPrimitiveIterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfDouble', TypeInfo(Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfDouble));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfInt', TypeInfo(Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfInt));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfLong', TypeInfo(Androidapi.JNI.JavaTypes.JPrimitiveIterator_OfLong));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JProperties', TypeInfo(Androidapi.JNI.JavaTypes.JProperties));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JQueue', TypeInfo(Androidapi.JNI.JavaTypes.JQueue));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JRandom', TypeInfo(Androidapi.JNI.JavaTypes.JRandom));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSet', TypeInfo(Androidapi.JNI.JavaTypes.JSet));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSortedMap', TypeInfo(Androidapi.JNI.JavaTypes.JSortedMap));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSpliterator', TypeInfo(Androidapi.JNI.JavaTypes.JSpliterator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSpliterator_OfPrimitive', TypeInfo(Androidapi.JNI.JavaTypes.JSpliterator_OfPrimitive));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSpliterator_OfDouble', TypeInfo(Androidapi.JNI.JavaTypes.JSpliterator_OfDouble));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSpliterator_OfInt', TypeInfo(Androidapi.JNI.JavaTypes.JSpliterator_OfInt));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSpliterator_OfLong', TypeInfo(Androidapi.JNI.JavaTypes.JSpliterator_OfLong));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTimeZone', TypeInfo(Androidapi.JNI.JavaTypes.JTimeZone));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTimer', TypeInfo(Androidapi.JNI.JavaTypes.JTimer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTimerTask', TypeInfo(Androidapi.JNI.JavaTypes.JTimerTask));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JUUID', TypeInfo(Androidapi.JNI.JavaTypes.JUUID));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JAbstractExecutorService', TypeInfo(Androidapi.JNI.JavaTypes.JAbstractExecutorService));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBlockingQueue', TypeInfo(Androidapi.JNI.JavaTypes.JBlockingQueue));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCallable', TypeInfo(Androidapi.JNI.JavaTypes.JCallable));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCountDownLatch', TypeInfo(Androidapi.JNI.JavaTypes.JCountDownLatch));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDelayed', TypeInfo(Androidapi.JNI.JavaTypes.JDelayed));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JExecutor', TypeInfo(Androidapi.JNI.JavaTypes.JExecutor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JExecutorService', TypeInfo(Androidapi.JNI.JavaTypes.JExecutorService));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFuture', TypeInfo(Androidapi.JNI.JavaTypes.JFuture));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JRejectedExecutionHandler', TypeInfo(Androidapi.JNI.JavaTypes.JRejectedExecutionHandler));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JScheduledFuture', TypeInfo(Androidapi.JNI.JavaTypes.JScheduledFuture));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThreadPoolExecutor', TypeInfo(Androidapi.JNI.JavaTypes.JThreadPoolExecutor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JScheduledThreadPoolExecutor', TypeInfo(Androidapi.JNI.JavaTypes.JScheduledThreadPoolExecutor));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JThreadFactory', TypeInfo(Androidapi.JNI.JavaTypes.JThreadFactory));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JTimeUnit', TypeInfo(Androidapi.JNI.JavaTypes.JTimeUnit));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBiConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JBiConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBiFunction', TypeInfo(Androidapi.JNI.JavaTypes.JBiFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBinaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JBinaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleBinaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleBinaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleFunction', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoublePredicate', TypeInfo(Androidapi.JNI.JavaTypes.JDoublePredicate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleSupplier', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleSupplier));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleToIntFunction', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleToIntFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleToLongFunction', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleToLongFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleUnaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleUnaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JFunction', TypeInfo(Androidapi.JNI.JavaTypes.JFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntBinaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JIntBinaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JIntConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntFunction', TypeInfo(Androidapi.JNI.JavaTypes.JIntFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntPredicate', TypeInfo(Androidapi.JNI.JavaTypes.JIntPredicate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntSupplier', TypeInfo(Androidapi.JNI.JavaTypes.JIntSupplier));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntToDoubleFunction', TypeInfo(Androidapi.JNI.JavaTypes.JIntToDoubleFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntToLongFunction', TypeInfo(Androidapi.JNI.JavaTypes.JIntToLongFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntUnaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JIntUnaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongBinaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JLongBinaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JLongConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongFunction', TypeInfo(Androidapi.JNI.JavaTypes.JLongFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongPredicate', TypeInfo(Androidapi.JNI.JavaTypes.JLongPredicate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongSupplier', TypeInfo(Androidapi.JNI.JavaTypes.JLongSupplier));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongToDoubleFunction', TypeInfo(Androidapi.JNI.JavaTypes.JLongToDoubleFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongToIntFunction', TypeInfo(Androidapi.JNI.JavaTypes.JLongToIntFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongUnaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JLongUnaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JObjDoubleConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JObjDoubleConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JObjIntConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JObjIntConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JObjLongConsumer', TypeInfo(Androidapi.JNI.JavaTypes.JObjLongConsumer));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.Jfunction_Predicate', TypeInfo(Androidapi.JNI.JavaTypes.Jfunction_Predicate));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSupplier', TypeInfo(Androidapi.JNI.JavaTypes.JSupplier));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JToDoubleFunction', TypeInfo(Androidapi.JNI.JavaTypes.JToDoubleFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JToIntFunction', TypeInfo(Androidapi.JNI.JavaTypes.JToIntFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JToLongFunction', TypeInfo(Androidapi.JNI.JavaTypes.JToLongFunction));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JUnaryOperator', TypeInfo(Androidapi.JNI.JavaTypes.JUnaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JBaseStream', TypeInfo(Androidapi.JNI.JavaTypes.JBaseStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCollector', TypeInfo(Androidapi.JNI.JavaTypes.JCollector));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JCollector_Characteristics', TypeInfo(Androidapi.JNI.JavaTypes.JCollector_Characteristics));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleStream', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JDoubleStream_Builder', TypeInfo(Androidapi.JNI.JavaTypes.JDoubleStream_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntStream', TypeInfo(Androidapi.JNI.JavaTypes.JIntStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JIntStream_Builder', TypeInfo(Androidapi.JNI.JavaTypes.JIntStream_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongStream', TypeInfo(Androidapi.JNI.JavaTypes.JLongStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JLongStream_Builder', TypeInfo(Androidapi.JNI.JavaTypes.JLongStream_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JStream', TypeInfo(Androidapi.JNI.JavaTypes.JStream));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JStream_Builder', TypeInfo(Androidapi.JNI.JavaTypes.JStream_Builder));
  //TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JSecretKey', TypeInfo(Androidapi.JNI.JavaTypes.JSecretKey));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGL', TypeInfo(Androidapi.JNI.JavaTypes.JEGL));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGL10', TypeInfo(Androidapi.JNI.JavaTypes.JEGL10));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGLConfig', TypeInfo(Androidapi.JNI.JavaTypes.JEGLConfig));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGLContext', TypeInfo(Androidapi.JNI.JavaTypes.JEGLContext));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGLDisplay', TypeInfo(Androidapi.JNI.JavaTypes.JEGLDisplay));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JEGLSurface', TypeInfo(Androidapi.JNI.JavaTypes.JEGLSurface));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JGL', TypeInfo(Androidapi.JNI.JavaTypes.JGL));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JGL10', TypeInfo(Androidapi.JNI.JavaTypes.JGL10));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JJSONArray', TypeInfo(Androidapi.JNI.JavaTypes.JJSONArray));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JJSONException', TypeInfo(Androidapi.JNI.JavaTypes.JJSONException));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JJSONObject', TypeInfo(Androidapi.JNI.JavaTypes.JJSONObject));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JJSONTokener', TypeInfo(Androidapi.JNI.JavaTypes.JJSONTokener));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JXmlPullParser', TypeInfo(Androidapi.JNI.JavaTypes.JXmlPullParser));
  TRegTypes.RegisterType('Androidapi.JNI.JavaTypes.JXmlSerializer', TypeInfo(Androidapi.JNI.JavaTypes.JXmlSerializer));
end;

initialization
  RegisterTypes;
end.


