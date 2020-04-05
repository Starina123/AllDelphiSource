{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.WebRT;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Security.Cryptography, 
  Winapi.Foundation, 
  Winapi.Storage.Streams, 
  Winapi.Security.Credentials, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  Http_Headers_IHttpNameValueHeaderValue = interface;
  PHttp_Headers_IHttpNameValueHeaderValue = ^Http_Headers_IHttpNameValueHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterator_1__Http_Headers_IHttpNameValueHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpNameValueHeaderValue = ^IIterator_1__Http_Headers_IHttpNameValueHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterable_1__Http_Headers_IHttpNameValueHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpNameValueHeaderValue = ^IIterable_1__Http_Headers_IHttpNameValueHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IVectorView_1__Http_Headers_IHttpNameValueHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpNameValueHeaderValue = ^IVectorView_1__Http_Headers_IHttpNameValueHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IVector_1__Http_Headers_IHttpNameValueHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpNameValueHeaderValue = ^IVector_1__Http_Headers_IHttpNameValueHeaderValue;

  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  Http_Headers_IHttpContentDispositionHeaderValue = interface;
  PHttp_Headers_IHttpContentDispositionHeaderValue = ^Http_Headers_IHttpContentDispositionHeaderValue;

  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  Http_Headers_IHttpContentCodingHeaderValue = interface;
  PHttp_Headers_IHttpContentCodingHeaderValue = ^Http_Headers_IHttpContentCodingHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpContentCodingHeaderValue = ^IIterator_1__Http_Headers_IHttpContentCodingHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpContentCodingHeaderValue = ^IIterable_1__Http_Headers_IHttpContentCodingHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IVectorView_1__Http_Headers_IHttpContentCodingHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpContentCodingHeaderValue = ^IVectorView_1__Http_Headers_IHttpContentCodingHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IVector_1__Http_Headers_IHttpContentCodingHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpContentCodingHeaderValue = ^IVector_1__Http_Headers_IHttpContentCodingHeaderValue;

  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection
  Http_Headers_IHttpContentCodingHeaderValueCollection = interface;
  PHttp_Headers_IHttpContentCodingHeaderValueCollection = ^Http_Headers_IHttpContentCodingHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection
  Http_Headers_IHttpLanguageHeaderValueCollection = interface;
  PHttp_Headers_IHttpLanguageHeaderValueCollection = ^Http_Headers_IHttpLanguageHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  Http_Headers_IHttpContentRangeHeaderValue = interface;
  PHttp_Headers_IHttpContentRangeHeaderValue = ^Http_Headers_IHttpContentRangeHeaderValue;

  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  Http_Headers_IHttpMediaTypeHeaderValue = interface;
  PHttp_Headers_IHttpMediaTypeHeaderValue = ^Http_Headers_IHttpMediaTypeHeaderValue;

  // Windows.Web.Http.Headers.IHttpContentHeaderCollection
  Http_Headers_IHttpContentHeaderCollection = interface;
  PHttp_Headers_IHttpContentHeaderCollection = ^Http_Headers_IHttpContentHeaderCollection;

  // Windows.Web.Http.IHttpContent
  Http_IHttpContent = interface;
  PHttp_IHttpContent = ^Http_IHttpContent;

  // Windows.Web.Http.IHttpMethod
  Http_IHttpMethod = interface;
  PHttp_IHttpMethod = ^Http_IHttpMethod;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpMethod>
  IIterator_1__Http_IHttpMethod = interface;
  PIIterator_1__Http_IHttpMethod = ^IIterator_1__Http_IHttpMethod;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpMethod>
  IIterable_1__Http_IHttpMethod = interface;
  PIIterable_1__Http_IHttpMethod = ^IIterable_1__Http_IHttpMethod;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpMethod>
  IVectorView_1__Http_IHttpMethod = interface;
  PIVectorView_1__Http_IHttpMethod = ^IVectorView_1__Http_IHttpMethod;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.IHttpMethod>
  IVector_1__Http_IHttpMethod = interface;
  PIVector_1__Http_IHttpMethod = ^IVector_1__Http_IHttpMethod;

  // Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection
  Http_Headers_IHttpMethodHeaderValueCollection = interface;
  PHttp_Headers_IHttpMethodHeaderValueCollection = ^Http_Headers_IHttpMethodHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
  Http_Headers_IHttpCacheDirectiveHeaderValueCollection = interface;
  PHttp_Headers_IHttpCacheDirectiveHeaderValueCollection = ^Http_Headers_IHttpCacheDirectiveHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  Http_Headers_IHttpConnectionOptionHeaderValue = interface;
  PHttp_Headers_IHttpConnectionOptionHeaderValue = ^Http_Headers_IHttpConnectionOptionHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue = ^IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue = ^IIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IVectorView_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpConnectionOptionHeaderValue = ^IVectorView_1__Http_Headers_IHttpConnectionOptionHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IVector_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpConnectionOptionHeaderValue = ^IVector_1__Http_Headers_IHttpConnectionOptionHeaderValue;

  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
  Http_Headers_IHttpConnectionOptionHeaderValueCollection = interface;
  PHttp_Headers_IHttpConnectionOptionHeaderValueCollection = ^Http_Headers_IHttpConnectionOptionHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  Http_Headers_IHttpChallengeHeaderValue = interface;
  PHttp_Headers_IHttpChallengeHeaderValue = ^Http_Headers_IHttpChallengeHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterator_1__Http_Headers_IHttpChallengeHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpChallengeHeaderValue = ^IIterator_1__Http_Headers_IHttpChallengeHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterable_1__Http_Headers_IHttpChallengeHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpChallengeHeaderValue = ^IIterable_1__Http_Headers_IHttpChallengeHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IVectorView_1__Http_Headers_IHttpChallengeHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpChallengeHeaderValue = ^IVectorView_1__Http_Headers_IHttpChallengeHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IVector_1__Http_Headers_IHttpChallengeHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpChallengeHeaderValue = ^IVector_1__Http_Headers_IHttpChallengeHeaderValue;

  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
  Http_Headers_IHttpChallengeHeaderValueCollection = interface;
  PHttp_Headers_IHttpChallengeHeaderValueCollection = ^Http_Headers_IHttpChallengeHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
  Http_Headers_IHttpDateOrDeltaHeaderValue = interface;
  PHttp_Headers_IHttpDateOrDeltaHeaderValue = ^Http_Headers_IHttpDateOrDeltaHeaderValue;

  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  Http_Headers_IHttpTransferCodingHeaderValue = interface;
  PHttp_Headers_IHttpTransferCodingHeaderValue = ^Http_Headers_IHttpTransferCodingHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpTransferCodingHeaderValue = ^IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpTransferCodingHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpTransferCodingHeaderValue = ^IIterable_1__Http_Headers_IHttpTransferCodingHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IVectorView_1__Http_Headers_IHttpTransferCodingHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpTransferCodingHeaderValue = ^IVectorView_1__Http_Headers_IHttpTransferCodingHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IVector_1__Http_Headers_IHttpTransferCodingHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpTransferCodingHeaderValue = ^IVector_1__Http_Headers_IHttpTransferCodingHeaderValue;

  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
  Http_Headers_IHttpTransferCodingHeaderValueCollection = interface;
  PHttp_Headers_IHttpTransferCodingHeaderValueCollection = ^Http_Headers_IHttpTransferCodingHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpResponseHeaderCollection
  Http_Headers_IHttpResponseHeaderCollection = interface;
  PHttp_Headers_IHttpResponseHeaderCollection = ^Http_Headers_IHttpResponseHeaderCollection;

  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface;
  PHttp_Headers_IHttpMediaTypeWithQualityHeaderValue = ^Http_Headers_IHttpMediaTypeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = ^IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = ^IIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = ^IVectorView_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = ^IVector_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue;

  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueCollection = interface;
  PHttp_Headers_IHttpMediaTypeWithQualityHeaderValueCollection = ^Http_Headers_IHttpMediaTypeWithQualityHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface;
  PHttp_Headers_IHttpContentCodingWithQualityHeaderValue = ^Http_Headers_IHttpContentCodingWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = ^IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = ^IIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = ^IVectorView_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = ^IVector_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue;

  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection
  Http_Headers_IHttpContentCodingWithQualityHeaderValueCollection = interface;
  PHttp_Headers_IHttpContentCodingWithQualityHeaderValueCollection = ^Http_Headers_IHttpContentCodingWithQualityHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface;
  PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValue = ^Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = ^IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = ^IIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = ^IVectorView_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = ^IVector_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;

  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection = interface;
  PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection = ^Http_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  Http_Headers_IHttpCredentialsHeaderValue = interface;
  PHttp_Headers_IHttpCredentialsHeaderValue = ^Http_Headers_IHttpCredentialsHeaderValue;

  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  Http_Headers_IHttpCookiePairHeaderValue = interface;
  PHttp_Headers_IHttpCookiePairHeaderValue = ^Http_Headers_IHttpCookiePairHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterator_1__Http_Headers_IHttpCookiePairHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpCookiePairHeaderValue = ^IIterator_1__Http_Headers_IHttpCookiePairHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterable_1__Http_Headers_IHttpCookiePairHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpCookiePairHeaderValue = ^IIterable_1__Http_Headers_IHttpCookiePairHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IVectorView_1__Http_Headers_IHttpCookiePairHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpCookiePairHeaderValue = ^IVectorView_1__Http_Headers_IHttpCookiePairHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IVector_1__Http_Headers_IHttpCookiePairHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpCookiePairHeaderValue = ^IVector_1__Http_Headers_IHttpCookiePairHeaderValue;

  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection
  Http_Headers_IHttpCookiePairHeaderValueCollection = interface;
  PHttp_Headers_IHttpCookiePairHeaderValueCollection = ^Http_Headers_IHttpCookiePairHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  Http_Headers_IHttpExpectationHeaderValue = interface;
  PHttp_Headers_IHttpExpectationHeaderValue = ^Http_Headers_IHttpExpectationHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterator_1__Http_Headers_IHttpExpectationHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpExpectationHeaderValue = ^IIterator_1__Http_Headers_IHttpExpectationHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterable_1__Http_Headers_IHttpExpectationHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpExpectationHeaderValue = ^IIterable_1__Http_Headers_IHttpExpectationHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IVectorView_1__Http_Headers_IHttpExpectationHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpExpectationHeaderValue = ^IVectorView_1__Http_Headers_IHttpExpectationHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IVector_1__Http_Headers_IHttpExpectationHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpExpectationHeaderValue = ^IVector_1__Http_Headers_IHttpExpectationHeaderValue;

  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection
  Http_Headers_IHttpExpectationHeaderValueCollection = interface;
  PHttp_Headers_IHttpExpectationHeaderValueCollection = ^Http_Headers_IHttpExpectationHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpProductHeaderValue
  Http_Headers_IHttpProductHeaderValue = interface;
  PHttp_Headers_IHttpProductHeaderValue = ^Http_Headers_IHttpProductHeaderValue;

  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  Http_Headers_IHttpProductInfoHeaderValue = interface;
  PHttp_Headers_IHttpProductInfoHeaderValue = ^Http_Headers_IHttpProductInfoHeaderValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterator_1__Http_Headers_IHttpProductInfoHeaderValue = interface;
  PIIterator_1__Http_Headers_IHttpProductInfoHeaderValue = ^IIterator_1__Http_Headers_IHttpProductInfoHeaderValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterable_1__Http_Headers_IHttpProductInfoHeaderValue = interface;
  PIIterable_1__Http_Headers_IHttpProductInfoHeaderValue = ^IIterable_1__Http_Headers_IHttpProductInfoHeaderValue;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IVectorView_1__Http_Headers_IHttpProductInfoHeaderValue = interface;
  PIVectorView_1__Http_Headers_IHttpProductInfoHeaderValue = ^IVectorView_1__Http_Headers_IHttpProductInfoHeaderValue;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IVector_1__Http_Headers_IHttpProductInfoHeaderValue = interface;
  PIVector_1__Http_Headers_IHttpProductInfoHeaderValue = ^IVector_1__Http_Headers_IHttpProductInfoHeaderValue;

  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection
  Http_Headers_IHttpProductInfoHeaderValueCollection = interface;
  PHttp_Headers_IHttpProductInfoHeaderValueCollection = ^Http_Headers_IHttpProductInfoHeaderValueCollection;

  // Windows.Web.Http.Headers.IHttpRequestHeaderCollection
  Http_Headers_IHttpRequestHeaderCollection = interface;
  PHttp_Headers_IHttpRequestHeaderCollection = ^Http_Headers_IHttpRequestHeaderCollection;

  // Windows.Web.Http.IHttpTransportInformation
  Http_IHttpTransportInformation = interface;
  PHttp_IHttpTransportInformation = ^Http_IHttpTransportInformation;

  // Windows.Web.Http.IHttpRequestMessage
  Http_IHttpRequestMessage = interface;
  PHttp_IHttpRequestMessage = ^Http_IHttpRequestMessage;

  // Windows.Web.Http.IHttpResponseMessage
  Http_IHttpResponseMessage = interface;
  PHttp_IHttpResponseMessage = ^Http_IHttpResponseMessage;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = interface;
  PAsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = ^AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = ^AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress = interface;
  PIAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress = ^IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress = ^AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress = ^IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress = interface;
  PAsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress = ^AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress = interface;
  PIAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress = ^IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress = interface;
  PAsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress = ^AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress = interface;
  PIAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress = ^IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress;

  // Windows.Web.Http.IHttpClient
  Http_IHttpClient = interface;
  PHttp_IHttpClient = ^Http_IHttpClient;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.WebErrorStatus>
  IIterator_1__WebErrorStatus = interface;
  PIIterator_1__WebErrorStatus = ^IIterator_1__WebErrorStatus;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.WebErrorStatus>
  IIterable_1__WebErrorStatus = interface;
  PIIterable_1__WebErrorStatus = ^IIterable_1__WebErrorStatus;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.WebErrorStatus>
  IVectorView_1__WebErrorStatus = interface;
  PIVectorView_1__WebErrorStatus = ^IVectorView_1__WebErrorStatus;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.WebErrorStatus>
  IVector_1__WebErrorStatus = interface;
  PIVector_1__WebErrorStatus = ^IVector_1__WebErrorStatus;

  // Windows.Foundation.IReference`1<Windows.Web.WebErrorStatus>
  IReference_1__WebErrorStatus = interface;
  PIReference_1__WebErrorStatus = ^IReference_1__WebErrorStatus;

  // Windows.Web.Http.IHttpCookie
  Http_IHttpCookie = interface;
  PHttp_IHttpCookie = ^Http_IHttpCookie;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpCookie>
  IIterator_1__Http_IHttpCookie = interface;
  PIIterator_1__Http_IHttpCookie = ^IIterator_1__Http_IHttpCookie;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpCookie>
  IIterable_1__Http_IHttpCookie = interface;
  PIIterable_1__Http_IHttpCookie = ^IIterable_1__Http_IHttpCookie;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpCookie>
  IVectorView_1__Http_IHttpCookie = interface;
  PIVectorView_1__Http_IHttpCookie = ^IVectorView_1__Http_IHttpCookie;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.IHttpCookie>
  IVector_1__Http_IHttpCookie = interface;
  PIVector_1__Http_IHttpCookie = ^IVector_1__Http_IHttpCookie;

  // Windows.Web.IUriToStreamResolver
  IUriToStreamResolver = interface;
  PIUriToStreamResolver = ^IUriToStreamResolver;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IBuffer__UInt64 = ^AsyncOperationProgressHandler_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IBuffer__UInt64 = ^IAsyncOperationWithProgress_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IInputStream__UInt64 = ^AsyncOperationProgressHandler_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IInputStream__UInt64 = ^IAsyncOperationWithProgress_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationProgressHandler_2__HSTRING__UInt64 = ^AsyncOperationProgressHandler_2__HSTRING__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface;
  PIAsyncOperationWithProgress_2__HSTRING__UInt64 = ^IAsyncOperationWithProgress_2__HSTRING__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIKeyValuePair_2__HSTRING__IInspectable = ^IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterator_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterable_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface;
  PIMapView_2__HSTRING__IInspectable = ^IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface;
  PIMap_2__HSTRING__IInspectable = ^IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Web.Http.Filters.IHttpFilter
  Http_Filters_IHttpFilter = interface;
  PHttp_Filters_IHttpFilter = ^Http_Filters_IHttpFilter;

  // Windows.Web.Http.IHttpClientFactory
  Http_IHttpClientFactory = interface;
  PHttp_IHttpClientFactory = ^Http_IHttpClientFactory;

  // Windows.Web.Http.IHttpCookieManager
  Http_IHttpCookieManager = interface;
  PHttp_IHttpCookieManager = ^Http_IHttpCookieManager;

  // Windows.Web.Http.IHttpCookieFactory
  Http_IHttpCookieFactory = interface;
  PHttp_IHttpCookieFactory = ^Http_IHttpCookieFactory;

  // Windows.Web.Http.IHttpMethodStatics
  Http_IHttpMethodStatics = interface;
  PHttp_IHttpMethodStatics = ^Http_IHttpMethodStatics;

  // Windows.Web.Http.IHttpMethodFactory
  Http_IHttpMethodFactory = interface;
  PHttp_IHttpMethodFactory = ^Http_IHttpMethodFactory;

  // Windows.Web.Http.IHttpRequestMessageFactory
  Http_IHttpRequestMessageFactory = interface;
  PHttp_IHttpRequestMessageFactory = ^Http_IHttpRequestMessageFactory;

  // Windows.Web.Http.IHttpResponseMessageFactory
  Http_IHttpResponseMessageFactory = interface;
  PHttp_IHttpResponseMessageFactory = ^Http_IHttpResponseMessageFactory;

  // Windows.Web.Http.IHttpStringContentFactory
  Http_IHttpStringContentFactory = interface;
  PHttp_IHttpStringContentFactory = ^Http_IHttpStringContentFactory;

  // Windows.Web.Http.IHttpBufferContentFactory
  Http_IHttpBufferContentFactory = interface;
  PHttp_IHttpBufferContentFactory = ^Http_IHttpBufferContentFactory;

  // Windows.Web.Http.IHttpStreamContentFactory
  Http_IHttpStreamContentFactory = interface;
  PHttp_IHttpStreamContentFactory = ^Http_IHttpStreamContentFactory;

  // Windows.Web.Http.IHttpFormUrlEncodedContentFactory
  Http_IHttpFormUrlEncodedContentFactory = interface;
  PHttp_IHttpFormUrlEncodedContentFactory = ^Http_IHttpFormUrlEncodedContentFactory;

  // Windows.Web.Http.IHttpMultipartContentFactory
  Http_IHttpMultipartContentFactory = interface;
  PHttp_IHttpMultipartContentFactory = ^Http_IHttpMultipartContentFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpContent>
  IIterator_1__Http_IHttpContent = interface;
  PIIterator_1__Http_IHttpContent = ^IIterator_1__Http_IHttpContent;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpContent>
  IIterable_1__Http_IHttpContent = interface;
  PIIterable_1__Http_IHttpContent = ^IIterable_1__Http_IHttpContent;

  // Windows.Web.Http.IHttpMultipartContent
  Http_IHttpMultipartContent = interface;
  PHttp_IHttpMultipartContent = ^Http_IHttpMultipartContent;

  // Windows.Web.Http.IHttpMultipartFormDataContentFactory
  Http_IHttpMultipartFormDataContentFactory = interface;
  PHttp_IHttpMultipartFormDataContentFactory = ^Http_IHttpMultipartFormDataContentFactory;

  // Windows.Web.Http.IHttpMultipartFormDataContent
  Http_IHttpMultipartFormDataContent = interface;
  PHttp_IHttpMultipartFormDataContent = ^Http_IHttpMultipartFormDataContent;

  // Windows.Web.Http.Filters.IHttpCacheControl
  Http_Filters_IHttpCacheControl = interface;
  PHttp_Filters_IHttpCacheControl = ^Http_Filters_IHttpCacheControl;

  // Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs
  Http_Filters_IHttpServerCustomValidationRequestedEventArgs = interface;
  PHttp_Filters_IHttpServerCustomValidationRequestedEventArgs = ^Http_Filters_IHttpServerCustomValidationRequestedEventArgs;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter
  Http_Filters_IHttpBaseProtocolFilter = interface;
  PHttp_Filters_IHttpBaseProtocolFilter = ^Http_Filters_IHttpBaseProtocolFilter;

  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter2
  Http_Filters_IHttpBaseProtocolFilter2 = interface;
  PHttp_Filters_IHttpBaseProtocolFilter2 = ^Http_Filters_IHttpBaseProtocolFilter2;

  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter3
  Http_Filters_IHttpBaseProtocolFilter3 = interface;
  PHttp_Filters_IHttpBaseProtocolFilter3 = ^Http_Filters_IHttpBaseProtocolFilter3;

  // Windows.Foundation.TypedEventHandler`2<Windows.Web.Http.Filters.IHttpBaseProtocolFilter,Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs>
  TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs = interface;
  PTypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs = ^TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs;

  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter4
  Http_Filters_IHttpBaseProtocolFilter4 = interface;
  PHttp_Filters_IHttpBaseProtocolFilter4 = ^Http_Filters_IHttpBaseProtocolFilter4;

  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueStatics
  Http_Headers_IHttpChallengeHeaderValueStatics = interface;
  PHttp_Headers_IHttpChallengeHeaderValueStatics = ^Http_Headers_IHttpChallengeHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory
  Http_Headers_IHttpChallengeHeaderValueFactory = interface;
  PHttp_Headers_IHttpChallengeHeaderValueFactory = ^Http_Headers_IHttpChallengeHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValueStatics
  Http_Headers_IHttpCredentialsHeaderValueStatics = interface;
  PHttp_Headers_IHttpCredentialsHeaderValueStatics = ^Http_Headers_IHttpCredentialsHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory
  Http_Headers_IHttpCredentialsHeaderValueFactory = interface;
  PHttp_Headers_IHttpCredentialsHeaderValueFactory = ^Http_Headers_IHttpCredentialsHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueStatics
  Http_Headers_IHttpConnectionOptionHeaderValueStatics = interface;
  PHttp_Headers_IHttpConnectionOptionHeaderValueStatics = ^Http_Headers_IHttpConnectionOptionHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueFactory
  Http_Headers_IHttpConnectionOptionHeaderValueFactory = interface;
  PHttp_Headers_IHttpConnectionOptionHeaderValueFactory = ^Http_Headers_IHttpConnectionOptionHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueStatics
  Http_Headers_IHttpContentCodingHeaderValueStatics = interface;
  PHttp_Headers_IHttpContentCodingHeaderValueStatics = ^Http_Headers_IHttpContentCodingHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueFactory
  Http_Headers_IHttpContentCodingHeaderValueFactory = interface;
  PHttp_Headers_IHttpContentCodingHeaderValueFactory = ^Http_Headers_IHttpContentCodingHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueStatics
  Http_Headers_IHttpContentDispositionHeaderValueStatics = interface;
  PHttp_Headers_IHttpContentDispositionHeaderValueStatics = ^Http_Headers_IHttpContentDispositionHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueFactory
  Http_Headers_IHttpContentDispositionHeaderValueFactory = interface;
  PHttp_Headers_IHttpContentDispositionHeaderValueFactory = ^Http_Headers_IHttpContentDispositionHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValueStatics
  Http_Headers_IHttpContentRangeHeaderValueStatics = interface;
  PHttp_Headers_IHttpContentRangeHeaderValueStatics = ^Http_Headers_IHttpContentRangeHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory
  Http_Headers_IHttpContentRangeHeaderValueFactory = interface;
  PHttp_Headers_IHttpContentRangeHeaderValueFactory = ^Http_Headers_IHttpContentRangeHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueStatics
  Http_Headers_IHttpCookiePairHeaderValueStatics = interface;
  PHttp_Headers_IHttpCookiePairHeaderValueStatics = ^Http_Headers_IHttpCookiePairHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory
  Http_Headers_IHttpCookiePairHeaderValueFactory = interface;
  PHttp_Headers_IHttpCookiePairHeaderValueFactory = ^Http_Headers_IHttpCookiePairHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValueStatics
  Http_Headers_IHttpDateOrDeltaHeaderValueStatics = interface;
  PHttp_Headers_IHttpDateOrDeltaHeaderValueStatics = ^Http_Headers_IHttpDateOrDeltaHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueStatics
  Http_Headers_IHttpExpectationHeaderValueStatics = interface;
  PHttp_Headers_IHttpExpectationHeaderValueStatics = ^Http_Headers_IHttpExpectationHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory
  Http_Headers_IHttpExpectationHeaderValueFactory = interface;
  PHttp_Headers_IHttpExpectationHeaderValueFactory = ^Http_Headers_IHttpExpectationHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueStatics
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics = interface;
  PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics = ^Http_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory = interface;
  PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory = ^Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueStatics
  Http_Headers_IHttpMediaTypeHeaderValueStatics = interface;
  PHttp_Headers_IHttpMediaTypeHeaderValueStatics = ^Http_Headers_IHttpMediaTypeHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueFactory
  Http_Headers_IHttpMediaTypeHeaderValueFactory = interface;
  PHttp_Headers_IHttpMediaTypeHeaderValueFactory = ^Http_Headers_IHttpMediaTypeHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueStatics
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueStatics = interface;
  PHttp_Headers_IHttpMediaTypeWithQualityHeaderValueStatics = ^Http_Headers_IHttpMediaTypeWithQualityHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory = interface;
  PHttp_Headers_IHttpMediaTypeWithQualityHeaderValueFactory = ^Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpNameValueHeaderValueStatics
  Http_Headers_IHttpNameValueHeaderValueStatics = interface;
  PHttp_Headers_IHttpNameValueHeaderValueStatics = ^Http_Headers_IHttpNameValueHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory
  Http_Headers_IHttpNameValueHeaderValueFactory = interface;
  PHttp_Headers_IHttpNameValueHeaderValueFactory = ^Http_Headers_IHttpNameValueHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpProductHeaderValueStatics
  Http_Headers_IHttpProductHeaderValueStatics = interface;
  PHttp_Headers_IHttpProductHeaderValueStatics = ^Http_Headers_IHttpProductHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpProductHeaderValueFactory
  Http_Headers_IHttpProductHeaderValueFactory = interface;
  PHttp_Headers_IHttpProductHeaderValueFactory = ^Http_Headers_IHttpProductHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueStatics
  Http_Headers_IHttpProductInfoHeaderValueStatics = interface;
  PHttp_Headers_IHttpProductInfoHeaderValueStatics = ^Http_Headers_IHttpProductInfoHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory
  Http_Headers_IHttpProductInfoHeaderValueFactory = interface;
  PHttp_Headers_IHttpProductInfoHeaderValueFactory = ^Http_Headers_IHttpProductInfoHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueStatics
  Http_Headers_IHttpContentCodingWithQualityHeaderValueStatics = interface;
  PHttp_Headers_IHttpContentCodingWithQualityHeaderValueStatics = ^Http_Headers_IHttpContentCodingWithQualityHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory
  Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory = interface;
  PHttp_Headers_IHttpContentCodingWithQualityHeaderValueFactory = ^Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory;

  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueStatics
  Http_Headers_IHttpTransferCodingHeaderValueStatics = interface;
  PHttp_Headers_IHttpTransferCodingHeaderValueStatics = ^Http_Headers_IHttpTransferCodingHeaderValueStatics;

  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueFactory
  Http_Headers_IHttpTransferCodingHeaderValueFactory = interface;
  PHttp_Headers_IHttpTransferCodingHeaderValueFactory = ^Http_Headers_IHttpTransferCodingHeaderValueFactory;

  // Windows.Web.IWebErrorStatics
  IWebErrorStatics = interface;
  PIWebErrorStatics = ^IWebErrorStatics;

  // Windows.Web.Syndication.ISyndicationAttribute
  Syndication_ISyndicationAttribute = interface;
  PSyndication_ISyndicationAttribute = ^Syndication_ISyndicationAttribute;

  // Windows.Web.Syndication.ISyndicationAttributeFactory
  Syndication_ISyndicationAttributeFactory = interface;
  PSyndication_ISyndicationAttributeFactory = ^Syndication_ISyndicationAttributeFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterator_1__Syndication_ISyndicationAttribute = interface;
  PIIterator_1__Syndication_ISyndicationAttribute = ^IIterator_1__Syndication_ISyndicationAttribute;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterable_1__Syndication_ISyndicationAttribute = interface;
  PIIterable_1__Syndication_ISyndicationAttribute = ^IIterable_1__Syndication_ISyndicationAttribute;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationAttribute>
  IVectorView_1__Syndication_ISyndicationAttribute = interface;
  PIVectorView_1__Syndication_ISyndicationAttribute = ^IVectorView_1__Syndication_ISyndicationAttribute;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationAttribute>
  IVector_1__Syndication_ISyndicationAttribute = interface;
  PIVector_1__Syndication_ISyndicationAttribute = ^IVector_1__Syndication_ISyndicationAttribute;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationNode>
  IIterator_1__Syndication_ISyndicationNode = interface;
  PIIterator_1__Syndication_ISyndicationNode = ^IIterator_1__Syndication_ISyndicationNode;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationNode>
  IIterable_1__Syndication_ISyndicationNode = interface;
  PIIterable_1__Syndication_ISyndicationNode = ^IIterable_1__Syndication_ISyndicationNode;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationNode>
  IVectorView_1__Syndication_ISyndicationNode = interface;
  PIVectorView_1__Syndication_ISyndicationNode = ^IVectorView_1__Syndication_ISyndicationNode;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationNode>
  IVector_1__Syndication_ISyndicationNode = interface;
  PIVector_1__Syndication_ISyndicationNode = ^IVector_1__Syndication_ISyndicationNode;

  // Windows.Web.Syndication.ISyndicationNode
  Syndication_ISyndicationNode = interface;
  PSyndication_ISyndicationNode = ^Syndication_ISyndicationNode;

  // Windows.Web.Syndication.ISyndicationNodeFactory
  Syndication_ISyndicationNodeFactory = interface;
  PSyndication_ISyndicationNodeFactory = ^Syndication_ISyndicationNodeFactory;

  // Windows.Web.Syndication.ISyndicationGenerator
  Syndication_ISyndicationGenerator = interface;
  PSyndication_ISyndicationGenerator = ^Syndication_ISyndicationGenerator;

  // Windows.Web.Syndication.ISyndicationGeneratorFactory
  Syndication_ISyndicationGeneratorFactory = interface;
  PSyndication_ISyndicationGeneratorFactory = ^Syndication_ISyndicationGeneratorFactory;

  // Windows.Web.Syndication.ISyndicationText
  Syndication_ISyndicationText = interface;
  PSyndication_ISyndicationText = ^Syndication_ISyndicationText;

  // Windows.Web.Syndication.ISyndicationTextFactory
  Syndication_ISyndicationTextFactory = interface;
  PSyndication_ISyndicationTextFactory = ^Syndication_ISyndicationTextFactory;

  // Windows.Web.Syndication.ISyndicationContent
  Syndication_ISyndicationContent = interface;
  PSyndication_ISyndicationContent = ^Syndication_ISyndicationContent;

  // Windows.Web.Syndication.ISyndicationContentFactory
  Syndication_ISyndicationContentFactory = interface;
  PSyndication_ISyndicationContentFactory = ^Syndication_ISyndicationContentFactory;

  // Windows.Web.Syndication.ISyndicationLink
  Syndication_ISyndicationLink = interface;
  PSyndication_ISyndicationLink = ^Syndication_ISyndicationLink;

  // Windows.Web.Syndication.ISyndicationLinkFactory
  Syndication_ISyndicationLinkFactory = interface;
  PSyndication_ISyndicationLinkFactory = ^Syndication_ISyndicationLinkFactory;

  // Windows.Web.Syndication.ISyndicationPerson
  Syndication_ISyndicationPerson = interface;
  PSyndication_ISyndicationPerson = ^Syndication_ISyndicationPerson;

  // Windows.Web.Syndication.ISyndicationPersonFactory
  Syndication_ISyndicationPersonFactory = interface;
  PSyndication_ISyndicationPersonFactory = ^Syndication_ISyndicationPersonFactory;

  // Windows.Web.Syndication.ISyndicationCategory
  Syndication_ISyndicationCategory = interface;
  PSyndication_ISyndicationCategory = ^Syndication_ISyndicationCategory;

  // Windows.Web.Syndication.ISyndicationCategoryFactory
  Syndication_ISyndicationCategoryFactory = interface;
  PSyndication_ISyndicationCategoryFactory = ^Syndication_ISyndicationCategoryFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterator_1__Syndication_ISyndicationPerson = interface;
  PIIterator_1__Syndication_ISyndicationPerson = ^IIterator_1__Syndication_ISyndicationPerson;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterable_1__Syndication_ISyndicationPerson = interface;
  PIIterable_1__Syndication_ISyndicationPerson = ^IIterable_1__Syndication_ISyndicationPerson;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationPerson>
  IVectorView_1__Syndication_ISyndicationPerson = interface;
  PIVectorView_1__Syndication_ISyndicationPerson = ^IVectorView_1__Syndication_ISyndicationPerson;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationPerson>
  IVector_1__Syndication_ISyndicationPerson = interface;
  PIVector_1__Syndication_ISyndicationPerson = ^IVector_1__Syndication_ISyndicationPerson;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterator_1__Syndication_ISyndicationCategory = interface;
  PIIterator_1__Syndication_ISyndicationCategory = ^IIterator_1__Syndication_ISyndicationCategory;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterable_1__Syndication_ISyndicationCategory = interface;
  PIIterable_1__Syndication_ISyndicationCategory = ^IIterable_1__Syndication_ISyndicationCategory;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationCategory>
  IVectorView_1__Syndication_ISyndicationCategory = interface;
  PIVectorView_1__Syndication_ISyndicationCategory = ^IVectorView_1__Syndication_ISyndicationCategory;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationCategory>
  IVector_1__Syndication_ISyndicationCategory = interface;
  PIVector_1__Syndication_ISyndicationCategory = ^IVector_1__Syndication_ISyndicationCategory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationLink>
  IIterator_1__Syndication_ISyndicationLink = interface;
  PIIterator_1__Syndication_ISyndicationLink = ^IIterator_1__Syndication_ISyndicationLink;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationLink>
  IIterable_1__Syndication_ISyndicationLink = interface;
  PIIterable_1__Syndication_ISyndicationLink = ^IIterable_1__Syndication_ISyndicationLink;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationLink>
  IVectorView_1__Syndication_ISyndicationLink = interface;
  PIVectorView_1__Syndication_ISyndicationLink = ^IVectorView_1__Syndication_ISyndicationLink;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationLink>
  IVector_1__Syndication_ISyndicationLink = interface;
  PIVector_1__Syndication_ISyndicationLink = ^IVector_1__Syndication_ISyndicationLink;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationItem>
  IIterator_1__Syndication_ISyndicationItem = interface;
  PIIterator_1__Syndication_ISyndicationItem = ^IIterator_1__Syndication_ISyndicationItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationItem>
  IIterable_1__Syndication_ISyndicationItem = interface;
  PIIterable_1__Syndication_ISyndicationItem = ^IIterable_1__Syndication_ISyndicationItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationItem>
  IVectorView_1__Syndication_ISyndicationItem = interface;
  PIVectorView_1__Syndication_ISyndicationItem = ^IVectorView_1__Syndication_ISyndicationItem;

  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationItem>
  IVector_1__Syndication_ISyndicationItem = interface;
  PIVector_1__Syndication_ISyndicationItem = ^IVector_1__Syndication_ISyndicationItem;

  // Windows.Web.Syndication.ISyndicationFeed
  Syndication_ISyndicationFeed = interface;
  PSyndication_ISyndicationFeed = ^Syndication_ISyndicationFeed;

  // Windows.Web.Syndication.ISyndicationItem
  Syndication_ISyndicationItem = interface;
  PSyndication_ISyndicationItem = ^Syndication_ISyndicationItem;

  // Windows.Web.Syndication.ISyndicationItemFactory
  Syndication_ISyndicationItemFactory = interface;
  PSyndication_ISyndicationItemFactory = ^Syndication_ISyndicationItemFactory;

  // Windows.Web.Syndication.ISyndicationFeedFactory
  Syndication_ISyndicationFeedFactory = interface;
  PSyndication_ISyndicationFeedFactory = ^Syndication_ISyndicationFeedFactory;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface;
  PAsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = ^AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = ^AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface;
  PIAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = ^IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress;

  // Windows.Web.Syndication.ISyndicationClient
  Syndication_ISyndicationClient = interface;
  PSyndication_ISyndicationClient = ^Syndication_ISyndicationClient;

  // Windows.Web.Syndication.ISyndicationClientFactory
  Syndication_ISyndicationClientFactory = interface;
  PSyndication_ISyndicationClientFactory = ^Syndication_ISyndicationClientFactory;

  // Windows.Web.Syndication.ISyndicationErrorStatics
  Syndication_ISyndicationErrorStatics = interface;
  PSyndication_ISyndicationErrorStatics = ^Syndication_ISyndicationErrorStatics;

  // Windows.Web.AtomPub.IResourceCollection
  AtomPub_IResourceCollection = interface;
  PAtomPub_IResourceCollection = ^AtomPub_IResourceCollection;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IResourceCollection>
  IIterator_1__AtomPub_IResourceCollection = interface;
  PIIterator_1__AtomPub_IResourceCollection = ^IIterator_1__AtomPub_IResourceCollection;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IResourceCollection>
  IIterable_1__AtomPub_IResourceCollection = interface;
  PIIterable_1__AtomPub_IResourceCollection = ^IIterable_1__AtomPub_IResourceCollection;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IResourceCollection>
  IVectorView_1__AtomPub_IResourceCollection = interface;
  PIVectorView_1__AtomPub_IResourceCollection = ^IVectorView_1__AtomPub_IResourceCollection;

  // Windows.Web.AtomPub.IWorkspace
  AtomPub_IWorkspace = interface;
  PAtomPub_IWorkspace = ^AtomPub_IWorkspace;

  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IWorkspace>
  IIterator_1__AtomPub_IWorkspace = interface;
  PIIterator_1__AtomPub_IWorkspace = ^IIterator_1__AtomPub_IWorkspace;

  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IWorkspace>
  IIterable_1__AtomPub_IWorkspace = interface;
  PIIterable_1__AtomPub_IWorkspace = ^IIterable_1__AtomPub_IWorkspace;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IWorkspace>
  IVectorView_1__AtomPub_IWorkspace = interface;
  PIVectorView_1__AtomPub_IWorkspace = ^IVectorView_1__AtomPub_IWorkspace;

  // Windows.Web.AtomPub.IServiceDocument
  AtomPub_IServiceDocument = interface;
  PAtomPub_IServiceDocument = ^AtomPub_IServiceDocument;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface;
  PAsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = ^AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = ^AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface;
  PIAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = ^IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress = interface;
  PAsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress = ^AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress = interface;
  PIAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress = ^IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface;
  PAsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = ^AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = ^AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface;
  PIAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = ^IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface;
  PAsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = ^AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = ^AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface;
  PIAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress = ^IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress;

  // Windows.Foundation.AsyncActionProgressHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionProgressHandler_1__Syndication_TransferProgress = interface;
  PAsyncActionProgressHandler_1__Syndication_TransferProgress = ^AsyncActionProgressHandler_1__Syndication_TransferProgress;

  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress = interface;
  PAsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress = ^AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress;

  // Windows.Foundation.IAsyncActionWithProgress`1<Windows.Web.Syndication.TransferProgress>
  IAsyncActionWithProgress_1__Syndication_TransferProgress = interface;
  PIAsyncActionWithProgress_1__Syndication_TransferProgress = ^IAsyncActionWithProgress_1__Syndication_TransferProgress;

  // Windows.Web.AtomPub.IAtomPubClient
  AtomPub_IAtomPubClient = interface;
  PAtomPub_IAtomPubClient = ^AtomPub_IAtomPubClient;

  // Windows.Web.AtomPub.IAtomPubClientFactory
  AtomPub_IAtomPubClientFactory = interface;
  PAtomPub_IAtomPubClientFactory = ^AtomPub_IAtomPubClientFactory;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Web Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpNameValueHeaderValue)]
  Http_Headers_IHttpNameValueHeaderValue = interface(IInspectable)
  ['{D8BA7463-5B9A-4D1B-93F9-AA5B44ECFDDF}']
    function get_Name: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Name: HSTRING read get_Name;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterator_1__Http_Headers_IHttpNameValueHeaderValue_Base = interface(IInspectable)
  ['{3BB0C8FA-5F1F-5C70-9950-5D1D1A703DD4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterator_1__Http_Headers_IHttpNameValueHeaderValue = interface(IIterator_1__Http_Headers_IHttpNameValueHeaderValue_Base)
  ['{089E0C7D-D2D9-5084-B6C2-0500145CF699}']
    function get_Current: Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpNameValueHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpNameValueHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterable_1__Http_Headers_IHttpNameValueHeaderValue_Base = interface(IInspectable)
  ['{5838A126-B617-5417-B32E-DED2D27D40A3}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IIterable_1__Http_Headers_IHttpNameValueHeaderValue = interface(IIterable_1__Http_Headers_IHttpNameValueHeaderValue_Base)
  ['{0613B05A-BE33-5E3F-ACF2-295E614EFD91}']
    function First: IIterator_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IVectorView_1__Http_Headers_IHttpNameValueHeaderValue = interface(IInspectable)
  ['{81B59618-6405-515B-B6EE-5D3658A87EAA}']
    function GetAt(index: Cardinal): Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpNameValueHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpNameValueHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  IVector_1__Http_Headers_IHttpNameValueHeaderValue = interface(IInspectable)
  ['{F50871E8-79A5-5A74-BBAF-1904065A6ABB}']
    function GetAt(index: Cardinal): Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpNameValueHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpNameValueHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpNameValueHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpNameValueHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpNameValueHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpNameValueHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  }
  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentDispositionHeaderValue)]
  Http_Headers_IHttpContentDispositionHeaderValue = interface(IInspectable)
  ['{F2A2EEDC-2629-4B49-9908-96A168E9365E}']
    function get_DispositionType: HSTRING; safecall;
    procedure put_DispositionType(value: HSTRING); safecall;
    function get_FileName: HSTRING; safecall;
    procedure put_FileName(value: HSTRING); safecall;
    function get_FileNameStar: HSTRING; safecall;
    procedure put_FileNameStar(value: HSTRING); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Size: IReference_1__UInt64; safecall;
    procedure put_Size(value: IReference_1__UInt64); safecall;
    property DispositionType: HSTRING read get_DispositionType write put_DispositionType;
    property FileName: HSTRING read get_FileName write put_FileName;
    property FileNameStar: HSTRING read get_FileNameStar write put_FileNameStar;
    property Name: HSTRING read get_Name write put_Name;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Size: IReference_1__UInt64 read get_Size write put_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingHeaderValue)]
  Http_Headers_IHttpContentCodingHeaderValue = interface(IInspectable)
  ['{BCF7F92A-9376-4D85-BCCC-9F4F9ACAB434}']
    function get_ContentCoding: HSTRING; safecall;
    property ContentCoding: HSTRING read get_ContentCoding;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingHeaderValue_Base = interface(IInspectable)
  ['{E21AD0B2-C893-5360-A4FE-F083B308A9CD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingHeaderValue = interface(IIterator_1__Http_Headers_IHttpContentCodingHeaderValue_Base)
  ['{C54DF8A9-1BA3-5CBA-AC73-B632A6172CB3}']
    function get_Current: Http_Headers_IHttpContentCodingHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpContentCodingHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingHeaderValue_Base = interface(IInspectable)
  ['{0E8960C2-76E5-56C1-9FE6-8CD9018A6786}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingHeaderValue = interface(IIterable_1__Http_Headers_IHttpContentCodingHeaderValue_Base)
  ['{4F7B6049-F7F1-52F6-A82C-78C37ECDA2F2}']
    function First: IIterator_1__Http_Headers_IHttpContentCodingHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IVectorView_1__Http_Headers_IHttpContentCodingHeaderValue = interface(IInspectable)
  ['{5B267F60-64A7-518E-A89A-6EF6D9732B98}']
    function GetAt(index: Cardinal): Http_Headers_IHttpContentCodingHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpContentCodingHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  IVector_1__Http_Headers_IHttpContentCodingHeaderValue = interface(IInspectable)
  ['{E46D5B2F-2173-5F93-8886-DC3D62975F75}']
    function GetAt(index: Cardinal): Http_Headers_IHttpContentCodingHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpContentCodingHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpContentCodingHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpContentCodingHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpContentCodingHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpContentCodingHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingHeaderValueCollection)]
  Http_Headers_IHttpContentCodingHeaderValueCollection = interface(IInspectable)
  ['{7D221721-A6DB-436E-8E83-91596192819C}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpLanguageHeaderValueCollection)]
  Http_Headers_IHttpLanguageHeaderValueCollection = interface(IInspectable)
  ['{9EBD7CA3-8219-44F6-9902-8C56DFD3340C}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentRangeHeaderValue)]
  Http_Headers_IHttpContentRangeHeaderValue = interface(IInspectable)
  ['{04D967D3-A4F6-495C-9530-8579FCBA8AA9}']
    function get_FirstBytePosition: IReference_1__UInt64; safecall;
    function get_LastBytePosition: IReference_1__UInt64; safecall;
    function get_Length: IReference_1__UInt64; safecall;
    function get_Unit: HSTRING; safecall;
    procedure put_Unit(value: HSTRING); safecall;
    property FirstBytePosition: IReference_1__UInt64 read get_FirstBytePosition;
    property LastBytePosition: IReference_1__UInt64 read get_LastBytePosition;
    property Length: IReference_1__UInt64 read get_Length;
    property &Unit: HSTRING read get_Unit write put_Unit;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeHeaderValue)]
  Http_Headers_IHttpMediaTypeHeaderValue = interface(IInspectable)
  ['{16B28533-E728-4FCB-BDB0-08A431A14844}']
    function get_CharSet: HSTRING; safecall;
    procedure put_CharSet(value: HSTRING); safecall;
    function get_MediaType: HSTRING; safecall;
    procedure put_MediaType(value: HSTRING); safecall;
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    property CharSet: HSTRING read get_CharSet write put_CharSet;
    property MediaType: HSTRING read get_MediaType write put_MediaType;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentHeaderCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentHeaderCollection)]
  Http_Headers_IHttpContentHeaderCollection = interface(IInspectable)
  ['{40612A44-47AE-4B7E-9124-69628B64AA18}']
    function get_ContentDisposition: Http_Headers_IHttpContentDispositionHeaderValue; safecall;
    procedure put_ContentDisposition(value: Http_Headers_IHttpContentDispositionHeaderValue); safecall;
    function get_ContentEncoding: Http_Headers_IHttpContentCodingHeaderValueCollection; safecall;
    function get_ContentLanguage: Http_Headers_IHttpLanguageHeaderValueCollection; safecall;
    function get_ContentLength: IReference_1__UInt64; safecall;
    procedure put_ContentLength(value: IReference_1__UInt64); safecall;
    function get_ContentLocation: IUriRuntimeClass; safecall;
    procedure put_ContentLocation(value: IUriRuntimeClass); safecall;
    function get_ContentMD5: IBuffer; safecall;
    procedure put_ContentMD5(value: IBuffer); safecall;
    function get_ContentRange: Http_Headers_IHttpContentRangeHeaderValue; safecall;
    procedure put_ContentRange(value: Http_Headers_IHttpContentRangeHeaderValue); safecall;
    function get_ContentType: Http_Headers_IHttpMediaTypeHeaderValue; safecall;
    procedure put_ContentType(value: Http_Headers_IHttpMediaTypeHeaderValue); safecall;
    function get_Expires: IReference_1__DateTime; safecall;
    procedure put_Expires(value: IReference_1__DateTime); safecall;
    function get_LastModified: IReference_1__DateTime; safecall;
    procedure put_LastModified(value: IReference_1__DateTime); safecall;
    procedure Append(name: HSTRING; value: HSTRING); safecall;
    function TryAppendWithoutValidation(name: HSTRING; value: HSTRING): Boolean; safecall;
    property ContentDisposition: Http_Headers_IHttpContentDispositionHeaderValue read get_ContentDisposition write put_ContentDisposition;
    property ContentEncoding: Http_Headers_IHttpContentCodingHeaderValueCollection read get_ContentEncoding;
    property ContentLanguage: Http_Headers_IHttpLanguageHeaderValueCollection read get_ContentLanguage;
    property ContentLength: IReference_1__UInt64 read get_ContentLength write put_ContentLength;
    property ContentLocation: IUriRuntimeClass read get_ContentLocation write put_ContentLocation;
    property ContentMD5: IBuffer read get_ContentMD5 write put_ContentMD5;
    property ContentRange: Http_Headers_IHttpContentRangeHeaderValue read get_ContentRange write put_ContentRange;
    property ContentType: Http_Headers_IHttpMediaTypeHeaderValue read get_ContentType write put_ContentType;
    property Expires: IReference_1__DateTime read get_Expires write put_Expires;
    property LastModified: IReference_1__DateTime read get_LastModified write put_LastModified;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentHeaderCollection
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  Boolean
  // Used Types:  UInt64
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Web.Http.IHttpContent
  [WinRTClassNameAttribute(SHttp_HttpFormUrlEncodedContent)]
  Http_IHttpContent = interface(IInspectable)
  ['{6B14A441-FBA7-4BD2-AF0A-839DE7C295DA}']
    function get_Headers: Http_Headers_IHttpContentHeaderCollection; safecall;
    function BufferAllAsync: IAsyncOperationWithProgress_2__UInt64__UInt64; safecall;
    function ReadAsBufferAsync: IAsyncOperationWithProgress_2__IBuffer__UInt64; safecall;
    function ReadAsInputStreamAsync: IAsyncOperationWithProgress_2__IInputStream__UInt64; safecall;
    function ReadAsStringAsync: IAsyncOperationWithProgress_2__HSTRING__UInt64; safecall;
    function TryComputeLength(out length: UInt64): Boolean; safecall;
    function WriteToStreamAsync(outputStream: IOutputStream): IAsyncOperationWithProgress_2__UInt64__UInt64; safecall;
    property Headers: Http_Headers_IHttpContentHeaderCollection read get_Headers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpMethod
  [WinRTClassNameAttribute(SHttp_HttpMethod)]
  Http_IHttpMethod = interface(IInspectable)
  ['{728D4022-700D-4FE0-AFA5-40299C58DBFD}']
    function get_Method: HSTRING; safecall;
    property Method: HSTRING read get_Method;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpMethod>
  IIterator_1__Http_IHttpMethod_Base = interface(IInspectable)
  ['{D13A880F-D612-50CF-A6F9-DD96F916F491}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpMethod>
  IIterator_1__Http_IHttpMethod = interface(IIterator_1__Http_IHttpMethod_Base)
  ['{0F49B518-0979-559F-9CE3-37AA57E7C1B1}']
    function get_Current: Http_IHttpMethod; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_IHttpMethod): Cardinal; safecall;
    property Current: Http_IHttpMethod read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpMethod>
  IIterable_1__Http_IHttpMethod_Base = interface(IInspectable)
  ['{C088BB1A-DC61-57E1-B967-78DAB3541DA5}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpMethod>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpMethod>
  IIterable_1__Http_IHttpMethod = interface(IIterable_1__Http_IHttpMethod_Base)
  ['{E810A16D-5400-58E3-939E-B2C4BC43FB76}']
    function First: IIterator_1__Http_IHttpMethod; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpMethod>
  IVectorView_1__Http_IHttpMethod = interface(IInspectable)
  ['{E1BE0C20-608C-50E6-85EB-FC81563172FA}']
    function GetAt(index: Cardinal): Http_IHttpMethod; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_IHttpMethod; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_IHttpMethod): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpMethod>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.IHttpMethod>
  IVector_1__Http_IHttpMethod = interface(IInspectable)
  ['{70FA805C-30F9-563D-8C55-1B849EA06817}']
    function GetAt(index: Cardinal): Http_IHttpMethod; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_IHttpMethod; safecall;
    function IndexOf(value: Http_IHttpMethod; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_IHttpMethod); safecall;
    procedure InsertAt(index: Cardinal; value: Http_IHttpMethod); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_IHttpMethod); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_IHttpMethod): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_IHttpMethod); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpMethodHeaderValueCollection)]
  Http_Headers_IHttpMethodHeaderValueCollection = interface(IInspectable)
  ['{43BC3FF4-6119-4ADF-938C-34BFFFCF92ED}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpCacheDirectiveHeaderValueCollection)]
  Http_Headers_IHttpCacheDirectiveHeaderValueCollection = interface(IInspectable)
  ['{9A586B89-D5D0-4FBE-BD9D-B5B3636811B4}']
    function get_MaxAge: IReference_1__TimeSpan; safecall;
    procedure put_MaxAge(value: IReference_1__TimeSpan); safecall;
    function get_MaxStale: IReference_1__TimeSpan; safecall;
    procedure put_MaxStale(value: IReference_1__TimeSpan); safecall;
    function get_MinFresh: IReference_1__TimeSpan; safecall;
    procedure put_MinFresh(value: IReference_1__TimeSpan); safecall;
    function get_SharedMaxAge: IReference_1__TimeSpan; safecall;
    procedure put_SharedMaxAge(value: IReference_1__TimeSpan); safecall;
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
    property MaxAge: IReference_1__TimeSpan read get_MaxAge write put_MaxAge;
    property MaxStale: IReference_1__TimeSpan read get_MaxStale write put_MaxStale;
    property MinFresh: IReference_1__TimeSpan read get_MinFresh write put_MinFresh;
    property SharedMaxAge: IReference_1__TimeSpan read get_SharedMaxAge write put_SharedMaxAge;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpConnectionOptionHeaderValue)]
  Http_Headers_IHttpConnectionOptionHeaderValue = interface(IInspectable)
  ['{CB4AF27A-4E90-45EB-8DCD-FD1408F4C44F}']
    function get_Token: HSTRING; safecall;
    property Token: HSTRING read get_Token;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue_Base = interface(IInspectable)
  ['{E95057BE-E8BD-53DF-A2F6-865A66A07C6B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface(IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue_Base)
  ['{E2AECCD6-CE18-5E8C-9C4E-765C4C9C3288}']
    function get_Current: Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpConnectionOptionHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpConnectionOptionHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue_Base = interface(IInspectable)
  ['{1AFC512F-DFA2-5528-8AEF-6E6A37789B3C}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface(IIterable_1__Http_Headers_IHttpConnectionOptionHeaderValue_Base)
  ['{36C5516E-95BA-5EEE-BEA2-BC4C68E87BDA}']
    function First: IIterator_1__Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IVectorView_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface(IInspectable)
  ['{9BE048D3-5530-557E-825C-D51D16F3B851}']
    function GetAt(index: Cardinal): Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpConnectionOptionHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpConnectionOptionHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  IVector_1__Http_Headers_IHttpConnectionOptionHeaderValue = interface(IInspectable)
  ['{8277B048-148F-5802-8CA7-58915C75E348}']
    function GetAt(index: Cardinal): Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpConnectionOptionHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpConnectionOptionHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpConnectionOptionHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpConnectionOptionHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpConnectionOptionHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpConnectionOptionHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpConnectionOptionHeaderValueCollection)]
  Http_Headers_IHttpConnectionOptionHeaderValueCollection = interface(IInspectable)
  ['{E4F56C1D-5142-4E00-8E0F-019509337629}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpChallengeHeaderValue)]
  Http_Headers_IHttpChallengeHeaderValue = interface(IInspectable)
  ['{393361AF-0F7D-4820-9FDD-A2B956EEAEAB}']
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Scheme: HSTRING; safecall;
    function get_Token: HSTRING; safecall;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Scheme: HSTRING read get_Scheme;
    property Token: HSTRING read get_Token;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterator_1__Http_Headers_IHttpChallengeHeaderValue_Base = interface(IInspectable)
  ['{6BC05705-2C6F-57E8-BF96-56A761E90E8F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterator_1__Http_Headers_IHttpChallengeHeaderValue = interface(IIterator_1__Http_Headers_IHttpChallengeHeaderValue_Base)
  ['{031D3BF1-A99F-55D4-9CE4-34E9264048FE}']
    function get_Current: Http_Headers_IHttpChallengeHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpChallengeHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpChallengeHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterable_1__Http_Headers_IHttpChallengeHeaderValue_Base = interface(IInspectable)
  ['{17847E58-F0CF-52E7-81C0-9D06A081569F}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IIterable_1__Http_Headers_IHttpChallengeHeaderValue = interface(IIterable_1__Http_Headers_IHttpChallengeHeaderValue_Base)
  ['{3194ABFD-5709-5C99-AEEA-42E4C4C2B675}']
    function First: IIterator_1__Http_Headers_IHttpChallengeHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IVectorView_1__Http_Headers_IHttpChallengeHeaderValue = interface(IInspectable)
  ['{6805C8E1-2F8F-5057-AF97-59A7CB8C838B}']
    function GetAt(index: Cardinal): Http_Headers_IHttpChallengeHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpChallengeHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpChallengeHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  IVector_1__Http_Headers_IHttpChallengeHeaderValue = interface(IInspectable)
  ['{EDBB37AA-69C8-591A-8E71-A0D066A92DE2}']
    function GetAt(index: Cardinal): Http_Headers_IHttpChallengeHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpChallengeHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpChallengeHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpChallengeHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpChallengeHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpChallengeHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpChallengeHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpChallengeHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpChallengeHeaderValueCollection)]
  Http_Headers_IHttpChallengeHeaderValueCollection = interface(IInspectable)
  ['{CA9E5F81-AEE0-4353-A10B-E625BABD64C2}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpDateOrDeltaHeaderValue)]
  Http_Headers_IHttpDateOrDeltaHeaderValue = interface(IInspectable)
  ['{EAFCAA6A-C4DC-49E2-A27D-043ADF5867A3}']
    function get_Date: IReference_1__DateTime; safecall;
    function get_Delta: IReference_1__TimeSpan; safecall;
    property Date: IReference_1__DateTime read get_Date;
    property Delta: IReference_1__TimeSpan read get_Delta;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpTransferCodingHeaderValue)]
  Http_Headers_IHttpTransferCodingHeaderValue = interface(IInspectable)
  ['{436F32F9-3DED-42BD-B38A-5496A2511CE6}']
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Value: HSTRING; safecall;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Value: HSTRING read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue_Base = interface(IInspectable)
  ['{49E58DEC-B5CD-5BA4-A603-365D1588AD4C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue = interface(IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue_Base)
  ['{1B302A12-661F-5152-AD68-63C0C928B813}']
    function get_Current: Http_Headers_IHttpTransferCodingHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpTransferCodingHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpTransferCodingHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpTransferCodingHeaderValue_Base = interface(IInspectable)
  ['{57402048-38BF-5055-ACB6-5C4DA765E388}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IIterable_1__Http_Headers_IHttpTransferCodingHeaderValue = interface(IIterable_1__Http_Headers_IHttpTransferCodingHeaderValue_Base)
  ['{283FE293-E088-51C9-8EDE-3150669E7976}']
    function First: IIterator_1__Http_Headers_IHttpTransferCodingHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IVectorView_1__Http_Headers_IHttpTransferCodingHeaderValue = interface(IInspectable)
  ['{4B8E685B-B63E-5E52-BE0F-26A289243026}']
    function GetAt(index: Cardinal): Http_Headers_IHttpTransferCodingHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpTransferCodingHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpTransferCodingHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  IVector_1__Http_Headers_IHttpTransferCodingHeaderValue = interface(IInspectable)
  ['{F0FE066C-7999-53E3-9947-A0A99ADE3E0F}']
    function GetAt(index: Cardinal): Http_Headers_IHttpTransferCodingHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpTransferCodingHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpTransferCodingHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpTransferCodingHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpTransferCodingHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpTransferCodingHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpTransferCodingHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpTransferCodingHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpTransferCodingHeaderValueCollection)]
  Http_Headers_IHttpTransferCodingHeaderValueCollection = interface(IInspectable)
  ['{202C8C34-2C03-49B8-9665-73E27CB2FC79}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpResponseHeaderCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpResponseHeaderCollection)]
  Http_Headers_IHttpResponseHeaderCollection = interface(IInspectable)
  ['{7A990969-FA3F-41ED-AAC6-BF957975C16B}']
    function get_Age: IReference_1__TimeSpan; safecall;
    procedure put_Age(value: IReference_1__TimeSpan); safecall;
    function get_Allow: Http_Headers_IHttpMethodHeaderValueCollection; safecall;
    function get_CacheControl: Http_Headers_IHttpCacheDirectiveHeaderValueCollection; safecall;
    function get_Connection: Http_Headers_IHttpConnectionOptionHeaderValueCollection; safecall;
    function get_Date: IReference_1__DateTime; safecall;
    procedure put_Date(value: IReference_1__DateTime); safecall;
    function get_Location: IUriRuntimeClass; safecall;
    procedure put_Location(value: IUriRuntimeClass); safecall;
    function get_ProxyAuthenticate: Http_Headers_IHttpChallengeHeaderValueCollection; safecall;
    function get_RetryAfter: Http_Headers_IHttpDateOrDeltaHeaderValue; safecall;
    procedure put_RetryAfter(value: Http_Headers_IHttpDateOrDeltaHeaderValue); safecall;
    function get_TransferEncoding: Http_Headers_IHttpTransferCodingHeaderValueCollection; safecall;
    function get_WwwAuthenticate: Http_Headers_IHttpChallengeHeaderValueCollection; safecall;
    procedure Append(name: HSTRING; value: HSTRING); safecall;
    function TryAppendWithoutValidation(name: HSTRING; value: HSTRING): Boolean; safecall;
    property Age: IReference_1__TimeSpan read get_Age write put_Age;
    property Allow: Http_Headers_IHttpMethodHeaderValueCollection read get_Allow;
    property CacheControl: Http_Headers_IHttpCacheDirectiveHeaderValueCollection read get_CacheControl;
    property Connection: Http_Headers_IHttpConnectionOptionHeaderValueCollection read get_Connection;
    property Date: IReference_1__DateTime read get_Date write put_Date;
    property Location: IUriRuntimeClass read get_Location write put_Location;
    property ProxyAuthenticate: Http_Headers_IHttpChallengeHeaderValueCollection read get_ProxyAuthenticate;
    property RetryAfter: Http_Headers_IHttpDateOrDeltaHeaderValue read get_RetryAfter write put_RetryAfter;
    property TransferEncoding: Http_Headers_IHttpTransferCodingHeaderValueCollection read get_TransferEncoding;
    property WwwAuthenticate: Http_Headers_IHttpChallengeHeaderValueCollection read get_WwwAuthenticate;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeWithQualityHeaderValue)]
  Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface(IInspectable)
  ['{188D5E32-76BE-44A0-B1CD-2074BDED2DDE}']
    function get_CharSet: HSTRING; safecall;
    procedure put_CharSet(value: HSTRING); safecall;
    function get_MediaType: HSTRING; safecall;
    procedure put_MediaType(value: HSTRING); safecall;
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Quality: IReference_1__Double; safecall;
    procedure put_Quality(value: IReference_1__Double); safecall;
    property CharSet: HSTRING read get_CharSet write put_CharSet;
    property MediaType: HSTRING read get_MediaType write put_MediaType;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Quality: IReference_1__Double read get_Quality write put_Quality;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue_Base = interface(IInspectable)
  ['{6A2084A3-941A-5528-A2EC-28CF1FF9B1A9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface(IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue_Base)
  ['{B0138FAD-6966-5D38-92A3-16115AEABFE6}']
    function get_Current: Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpMediaTypeWithQualityHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpMediaTypeWithQualityHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue_Base = interface(IInspectable)
  ['{FFC7DFDE-58B8-51E9-B33B-65A5D6A4E24C}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface(IIterable_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue_Base)
  ['{DF8C29AF-BF50-5830-9AC1-9269CCEB9464}']
    function First: IIterator_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface(IInspectable)
  ['{A3B92D89-8944-563C-9A0A-B8E1DE83807B}']
    function GetAt(index: Cardinal): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpMediaTypeWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpMediaTypeWithQualityHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue = interface(IInspectable)
  ['{0D9C0BCA-CFDE-5D4D-89A1-444DA3C0163B}']
    function GetAt(index: Cardinal): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpMediaTypeWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpMediaTypeWithQualityHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpMediaTypeWithQualityHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpMediaTypeWithQualityHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpMediaTypeWithQualityHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpMediaTypeWithQualityHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeWithQualityHeaderValueCollection)]
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueCollection = interface(IInspectable)
  ['{3C0C6B73-1342-4587-A056-18D02FF67165}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingWithQualityHeaderValue)]
  Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface(IInspectable)
  ['{94531CD5-8B13-4D73-8651-F76B38F88495}']
    function get_ContentCoding: HSTRING; safecall;
    function get_Quality: IReference_1__Double; safecall;
    property ContentCoding: HSTRING read get_ContentCoding;
    property Quality: IReference_1__Double read get_Quality;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue_Base = interface(IInspectable)
  ['{3780C808-8B98-5327-84C7-055363FE32AD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface(IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue_Base)
  ['{C5E469B0-1564-5BF2-A93F-EE722F482D75}']
    function get_Current: Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingWithQualityHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpContentCodingWithQualityHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue_Base = interface(IInspectable)
  ['{916E6271-CEF6-53B8-B93F-DC8DCA559E50}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface(IIterable_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue_Base)
  ['{9F1DF2FD-26DC-5A38-A549-DA73A8A01FB5}']
    function First: IIterator_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface(IInspectable)
  ['{3723E538-177A-5B5E-B378-1E188DA52C63}']
    function GetAt(index: Cardinal): Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpContentCodingWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingWithQualityHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue = interface(IInspectable)
  ['{9B95280B-B45B-5831-8389-03CF248234BF}']
    function GetAt(index: Cardinal): Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpContentCodingWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpContentCodingWithQualityHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpContentCodingWithQualityHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpContentCodingWithQualityHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingWithQualityHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpContentCodingWithQualityHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingWithQualityHeaderValueCollection)]
  Http_Headers_IHttpContentCodingWithQualityHeaderValueCollection = interface(IInspectable)
  ['{7C0D753E-E899-4378-B5C8-412D820711CC}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpLanguageRangeWithQualityHeaderValue)]
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface(IInspectable)
  ['{7256E102-0080-4DB4-A083-7DE7B2E5BA4C}']
    function get_LanguageRange: HSTRING; safecall;
    function get_Quality: IReference_1__Double; safecall;
    property LanguageRange: HSTRING read get_LanguageRange;
    property Quality: IReference_1__Double read get_Quality;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue_Base = interface(IInspectable)
  ['{A25503DE-4AEF-5EF4-9F06-5DF4094051BE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface(IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue_Base)
  ['{DFD62E19-8A32-5D71-904F-F146F1AC79D9}']
    function get_Current: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue_Base = interface(IInspectable)
  ['{0C5A4A0D-DBB7-5ABF-A5FD-C3B98D9C1487}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface(IIterable_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue_Base)
  ['{88A3E8F6-15BE-5B77-BEF2-0A7BF6F3EBEE}']
    function First: IIterator_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IVectorView_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface(IInspectable)
  ['{20DEBD84-BA3B-57CE-9D88-9CCBD1C101CC}']
    function GetAt(index: Cardinal): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  IVector_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue = interface(IInspectable)
  ['{18C728DF-7599-5F7F-80F8-2D9BCC5B9DFF}']
    function GetAt(index: Cardinal): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpLanguageRangeWithQualityHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpLanguageRangeWithQualityHeaderValueCollection)]
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection = interface(IInspectable)
  ['{885D5ABD-4B4F-480A-89CE-8AEDCEE6E3A0}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpCredentialsHeaderValue)]
  Http_Headers_IHttpCredentialsHeaderValue = interface(IInspectable)
  ['{C34CC3CB-542E-4177-A6C7-B674CE193FBF}']
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    function get_Scheme: HSTRING; safecall;
    function get_Token: HSTRING; safecall;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Scheme: HSTRING read get_Scheme;
    property Token: HSTRING read get_Token;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpCookiePairHeaderValue)]
  Http_Headers_IHttpCookiePairHeaderValue = interface(IInspectable)
  ['{CBD46217-4B29-412B-BD90-B3D814AB8E1B}']
    function get_Name: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Name: HSTRING read get_Name;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterator_1__Http_Headers_IHttpCookiePairHeaderValue_Base = interface(IInspectable)
  ['{ED3B6323-B1C3-558B-9917-0826C4A9E8C0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterator_1__Http_Headers_IHttpCookiePairHeaderValue = interface(IIterator_1__Http_Headers_IHttpCookiePairHeaderValue_Base)
  ['{541D3FF2-D0AF-5AA9-B235-90C41D87E02A}']
    function get_Current: Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpCookiePairHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpCookiePairHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterable_1__Http_Headers_IHttpCookiePairHeaderValue_Base = interface(IInspectable)
  ['{16773244-5011-5244-BB00-14DB4CF71005}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IIterable_1__Http_Headers_IHttpCookiePairHeaderValue = interface(IIterable_1__Http_Headers_IHttpCookiePairHeaderValue_Base)
  ['{6B1A3194-526E-51E1-AF4F-DF59E0A75374}']
    function First: IIterator_1__Http_Headers_IHttpCookiePairHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IVectorView_1__Http_Headers_IHttpCookiePairHeaderValue = interface(IInspectable)
  ['{38944813-D07C-5292-A4F7-229A2D20FCBB}']
    function GetAt(index: Cardinal): Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpCookiePairHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpCookiePairHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  IVector_1__Http_Headers_IHttpCookiePairHeaderValue = interface(IInspectable)
  ['{9C63D057-B533-573E-BD71-DB8C99CC3F61}']
    function GetAt(index: Cardinal): Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpCookiePairHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpCookiePairHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpCookiePairHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpCookiePairHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpCookiePairHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpCookiePairHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpCookiePairHeaderValueCollection)]
  Http_Headers_IHttpCookiePairHeaderValueCollection = interface(IInspectable)
  ['{F3F44350-581E-4ECC-9F59-E507D04F06E6}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  }
  // Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpExpectationHeaderValue)]
  Http_Headers_IHttpExpectationHeaderValue = interface(IInspectable)
  ['{4CE585CD-3A99-43AF-A2E6-EC232FEA9658}']
    function get_Name: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    function get_Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue; safecall;
    property Name: HSTRING read get_Name;
    property Parameters: IVector_1__Http_Headers_IHttpNameValueHeaderValue read get_Parameters;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterator_1__Http_Headers_IHttpExpectationHeaderValue_Base = interface(IInspectable)
  ['{6B72326A-46B1-5D80-A162-C5F45BE02E2B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterator_1__Http_Headers_IHttpExpectationHeaderValue = interface(IIterator_1__Http_Headers_IHttpExpectationHeaderValue_Base)
  ['{0EA65110-21A4-51F5-86B4-FE6DF69FDED0}']
    function get_Current: Http_Headers_IHttpExpectationHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpExpectationHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpExpectationHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterable_1__Http_Headers_IHttpExpectationHeaderValue_Base = interface(IInspectable)
  ['{0A391C2B-13C3-59B8-8662-13AFFB9D1754}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IIterable_1__Http_Headers_IHttpExpectationHeaderValue = interface(IIterable_1__Http_Headers_IHttpExpectationHeaderValue_Base)
  ['{40C8EB40-8820-5A68-A1DD-3BECCCA72B38}']
    function First: IIterator_1__Http_Headers_IHttpExpectationHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IVectorView_1__Http_Headers_IHttpExpectationHeaderValue = interface(IInspectable)
  ['{7AF29070-D70E-5A50-AADD-4B3AE3D8A347}']
    function GetAt(index: Cardinal): Http_Headers_IHttpExpectationHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpExpectationHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpExpectationHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  IVector_1__Http_Headers_IHttpExpectationHeaderValue = interface(IInspectable)
  ['{76689191-B83B-56A8-A5E2-61F1A87B91E5}']
    function GetAt(index: Cardinal): Http_Headers_IHttpExpectationHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpExpectationHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpExpectationHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpExpectationHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpExpectationHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpExpectationHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpExpectationHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpExpectationHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpExpectationHeaderValueCollection)]
  Http_Headers_IHttpExpectationHeaderValueCollection = interface(IInspectable)
  ['{E78521B3-A0E2-4AC4-9E66-79706CB9FD58}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpProductHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductHeaderValue)]
  Http_Headers_IHttpProductHeaderValue = interface(IInspectable)
  ['{F4FEEE03-EBD4-4160-B9FF-807C5183B6E6}']
    function get_Name: HSTRING; safecall;
    function get_Version: HSTRING; safecall;
    property Name: HSTRING read get_Name;
    property Version: HSTRING read get_Version;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductInfoHeaderValue)]
  Http_Headers_IHttpProductInfoHeaderValue = interface(IInspectable)
  ['{1B1A8732-4C35-486A-966F-646489198E4D}']
    function get_Product: Http_Headers_IHttpProductHeaderValue; safecall;
    function get_Comment: HSTRING; safecall;
    property Comment: HSTRING read get_Comment;
    property Product: Http_Headers_IHttpProductHeaderValue read get_Product;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterator_1__Http_Headers_IHttpProductInfoHeaderValue_Base = interface(IInspectable)
  ['{4F785951-B59C-5108-B0CD-1437578AF49C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterator_1__Http_Headers_IHttpProductInfoHeaderValue = interface(IIterator_1__Http_Headers_IHttpProductInfoHeaderValue_Base)
  ['{366A33C0-7DEE-5B8D-8596-54A098F08919}']
    function get_Current: Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_Headers_IHttpProductInfoHeaderValue): Cardinal; safecall;
    property Current: Http_Headers_IHttpProductInfoHeaderValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterable_1__Http_Headers_IHttpProductInfoHeaderValue_Base = interface(IInspectable)
  ['{BF97CF99-E614-5765-BAD7-161AE3A93AE9}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IIterable_1__Http_Headers_IHttpProductInfoHeaderValue = interface(IIterable_1__Http_Headers_IHttpProductInfoHeaderValue_Base)
  ['{2EBDB2AC-5098-5BBC-A401-C4A3CF821EE0}']
    function First: IIterator_1__Http_Headers_IHttpProductInfoHeaderValue; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IVectorView_1__Http_Headers_IHttpProductInfoHeaderValue = interface(IInspectable)
  ['{2DEE3E3E-47BB-51FC-AB2E-600D27541D3F}']
    function GetAt(index: Cardinal): Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_Headers_IHttpProductInfoHeaderValue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpProductInfoHeaderValue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  IVector_1__Http_Headers_IHttpProductInfoHeaderValue = interface(IInspectable)
  ['{1981F255-51C2-5525-A765-DBAAE5C0B66D}']
    function GetAt(index: Cardinal): Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function IndexOf(value: Http_Headers_IHttpProductInfoHeaderValue; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_Headers_IHttpProductInfoHeaderValue); safecall;
    procedure InsertAt(index: Cardinal; value: Http_Headers_IHttpProductInfoHeaderValue); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_Headers_IHttpProductInfoHeaderValue); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_Headers_IHttpProductInfoHeaderValue): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_Headers_IHttpProductInfoHeaderValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductInfoHeaderValueCollection)]
  Http_Headers_IHttpProductInfoHeaderValueCollection = interface(IInspectable)
  ['{877DF74A-D69B-44F8-AD4F-453AF9C42ED0}']
    procedure ParseAdd(input: HSTRING); safecall;
    function TryParseAdd(input: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  // Used Types:  Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection
  // Used Types:  String
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpRequestHeaderCollection
  [WinRTClassNameAttribute(SHttp_Headers_HttpRequestHeaderCollection)]
  Http_Headers_IHttpRequestHeaderCollection = interface(IInspectable)
  ['{AF40329B-B544-469B-86B9-AC3D466FEA36}']
    function get_Accept: Http_Headers_IHttpMediaTypeWithQualityHeaderValueCollection; safecall;
    function get_AcceptEncoding: Http_Headers_IHttpContentCodingWithQualityHeaderValueCollection; safecall;
    function get_AcceptLanguage: Http_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection; safecall;
    function get_Authorization: Http_Headers_IHttpCredentialsHeaderValue; safecall;
    procedure put_Authorization(value: Http_Headers_IHttpCredentialsHeaderValue); safecall;
    function get_CacheControl: Http_Headers_IHttpCacheDirectiveHeaderValueCollection; safecall;
    function get_Connection: Http_Headers_IHttpConnectionOptionHeaderValueCollection; safecall;
    function get_Cookie: Http_Headers_IHttpCookiePairHeaderValueCollection; safecall;
    function get_Date: IReference_1__DateTime; safecall;
    procedure put_Date(value: IReference_1__DateTime); safecall;
    function get_Expect: Http_Headers_IHttpExpectationHeaderValueCollection; safecall;
    function get_From: HSTRING; safecall;
    procedure put_From(value: HSTRING); safecall;
    function get_Host: IHostName; safecall;
    procedure put_Host(value: IHostName); safecall;
    function get_IfModifiedSince: IReference_1__DateTime; safecall;
    procedure put_IfModifiedSince(value: IReference_1__DateTime); safecall;
    function get_IfUnmodifiedSince: IReference_1__DateTime; safecall;
    procedure put_IfUnmodifiedSince(value: IReference_1__DateTime); safecall;
    function get_MaxForwards: IReference_1__Cardinal; safecall;
    procedure put_MaxForwards(value: IReference_1__Cardinal); safecall;
    function get_ProxyAuthorization: Http_Headers_IHttpCredentialsHeaderValue; safecall;
    procedure put_ProxyAuthorization(value: Http_Headers_IHttpCredentialsHeaderValue); safecall;
    function get_Referer: IUriRuntimeClass; safecall;
    procedure put_Referer(value: IUriRuntimeClass); safecall;
    function get_TransferEncoding: Http_Headers_IHttpTransferCodingHeaderValueCollection; safecall;
    function get_UserAgent: Http_Headers_IHttpProductInfoHeaderValueCollection; safecall;
    procedure Append(name: HSTRING; value: HSTRING); safecall;
    function TryAppendWithoutValidation(name: HSTRING; value: HSTRING): Boolean; safecall;
    property Accept: Http_Headers_IHttpMediaTypeWithQualityHeaderValueCollection read get_Accept;
    property AcceptEncoding: Http_Headers_IHttpContentCodingWithQualityHeaderValueCollection read get_AcceptEncoding;
    property AcceptLanguage: Http_Headers_IHttpLanguageRangeWithQualityHeaderValueCollection read get_AcceptLanguage;
    property Authorization: Http_Headers_IHttpCredentialsHeaderValue read get_Authorization write put_Authorization;
    property CacheControl: Http_Headers_IHttpCacheDirectiveHeaderValueCollection read get_CacheControl;
    property Connection: Http_Headers_IHttpConnectionOptionHeaderValueCollection read get_Connection;
    property Cookie: Http_Headers_IHttpCookiePairHeaderValueCollection read get_Cookie;
    property Date: IReference_1__DateTime read get_Date write put_Date;
    property Expect: Http_Headers_IHttpExpectationHeaderValueCollection read get_Expect;
    property From: HSTRING read get_From write put_From;
    property Host: IHostName read get_Host write put_Host;
    property IfModifiedSince: IReference_1__DateTime read get_IfModifiedSince write put_IfModifiedSince;
    property IfUnmodifiedSince: IReference_1__DateTime read get_IfUnmodifiedSince write put_IfUnmodifiedSince;
    property MaxForwards: IReference_1__Cardinal read get_MaxForwards write put_MaxForwards;
    property ProxyAuthorization: Http_Headers_IHttpCredentialsHeaderValue read get_ProxyAuthorization write put_ProxyAuthorization;
    property Referer: IUriRuntimeClass read get_Referer write put_Referer;
    property TransferEncoding: Http_Headers_IHttpTransferCodingHeaderValueCollection read get_TransferEncoding;
    property UserAgent: Http_Headers_IHttpProductInfoHeaderValueCollection read get_UserAgent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Security.Cryptography.Certificates.ICertificate
  // Used Types:  Windows.Networking.Sockets.SocketSslErrorSeverity
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ChainValidationResult>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ICertificate>
  }
  // Windows.Web.Http.IHttpTransportInformation
  [WinRTClassNameAttribute(SHttp_HttpTransportInformation)]
  Http_IHttpTransportInformation = interface(IInspectable)
  ['{70127198-C6A7-4ED0-833A-83FD8B8F178D}']
    function get_ServerCertificate: Certificates_ICertificate; safecall;
    function get_ServerCertificateErrorSeverity: SocketSslErrorSeverity; safecall;
    function get_ServerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult; safecall;
    function get_ServerIntermediateCertificates: IVectorView_1__Certificates_ICertificate; safecall;
    property ServerCertificate: Certificates_ICertificate read get_ServerCertificate;
    property ServerCertificateErrorSeverity: SocketSslErrorSeverity read get_ServerCertificateErrorSeverity;
    property ServerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult read get_ServerCertificateErrors;
    property ServerIntermediateCertificates: IVectorView_1__Certificates_ICertificate read get_ServerIntermediateCertificates;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Web.Http.Headers.IHttpRequestHeaderCollection
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Object>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Web.Http.IHttpTransportInformation
  }
  // Windows.Web.Http.IHttpRequestMessage
  [WinRTClassNameAttribute(SHttp_HttpRequestMessage)]
  Http_IHttpRequestMessage = interface(IInspectable)
  ['{F5762B3C-74D4-4811-B5DC-9F8B4E2F9ABF}']
    function get_Content: Http_IHttpContent; safecall;
    procedure put_Content(value: Http_IHttpContent); safecall;
    function get_Headers: Http_Headers_IHttpRequestHeaderCollection; safecall;
    function get_Method: Http_IHttpMethod; safecall;
    procedure put_Method(value: Http_IHttpMethod); safecall;
    function get_Properties: IMap_2__HSTRING__IInspectable; safecall;
    function get_RequestUri: IUriRuntimeClass; safecall;
    procedure put_RequestUri(value: IUriRuntimeClass); safecall;
    function get_TransportInformation: Http_IHttpTransportInformation; safecall;
    property Content: Http_IHttpContent read get_Content write put_Content;
    property Headers: Http_Headers_IHttpRequestHeaderCollection read get_Headers;
    property Method: Http_IHttpMethod read get_Method write put_Method;
    property Properties: IMap_2__HSTRING__IInspectable read get_Properties;
    property RequestUri: IUriRuntimeClass read get_RequestUri write put_RequestUri;
    property TransportInformation: Http_IHttpTransportInformation read get_TransportInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Web.Http.Headers.IHttpResponseHeaderCollection
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  // Used Types:  Windows.Web.Http.HttpResponseMessageSource
  // Used Types:  Windows.Web.Http.HttpStatusCode
  // Used Types:  Windows.Web.Http.HttpVersion
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.Web.Http.IHttpResponseMessage
  [WinRTClassNameAttribute(SHttp_HttpResponseMessage)]
  Http_IHttpResponseMessage = interface(IInspectable)
  ['{FEE200FB-8664-44E0-95D9-42696199BFFC}']
    function get_Content: Http_IHttpContent; safecall;
    procedure put_Content(value: Http_IHttpContent); safecall;
    function get_Headers: Http_Headers_IHttpResponseHeaderCollection; safecall;
    function get_IsSuccessStatusCode: Boolean; safecall;
    function get_ReasonPhrase: HSTRING; safecall;
    procedure put_ReasonPhrase(value: HSTRING); safecall;
    function get_RequestMessage: Http_IHttpRequestMessage; safecall;
    procedure put_RequestMessage(value: Http_IHttpRequestMessage); safecall;
    function get_Source: Http_HttpResponseMessageSource; safecall;
    procedure put_Source(value: Http_HttpResponseMessageSource); safecall;
    function get_StatusCode: Http_HttpStatusCode; safecall;
    procedure put_StatusCode(value: Http_HttpStatusCode); safecall;
    function get_Version: Http_HttpVersion; safecall;
    procedure put_Version(value: Http_HttpVersion); safecall;
    function EnsureSuccessStatusCode: Http_IHttpResponseMessage; safecall;
    property Content: Http_IHttpContent read get_Content write put_Content;
    property Headers: Http_Headers_IHttpResponseHeaderCollection read get_Headers;
    property IsSuccessStatusCode: Boolean read get_IsSuccessStatusCode;
    property ReasonPhrase: HSTRING read get_ReasonPhrase write put_ReasonPhrase;
    property RequestMessage: Http_IHttpRequestMessage read get_RequestMessage write put_RequestMessage;
    property Source: Http_HttpResponseMessageSource read get_Source write put_Source;
    property StatusCode: Http_HttpStatusCode read get_StatusCode write put_StatusCode;
    property Version: Http_HttpVersion read get_Version write put_Version;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{68E4606A-76EC-5816-B2FE-A04ECDE4126A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.HttpProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = interface(AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress_Delegate_Base)
  ['{DEF890BE-0CC1-5E11-972C-16BF0C7209D2}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; progressInfo: Http_HttpProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{BEADB572-F9A3-5E93-B6CA-E311B65933FC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress_Delegate_Base)
  ['{9B66D8BF-0405-5486-AB65-02A3ECA56A7F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress_Base = interface(IInspectable)
  ['{5D144364-77D7-5ECA-8B09-936A69446652}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress = interface(IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress_Base)
  ['{E4CE076C-C257-5480-A7D6-AA2837C60980}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
    function GetResults: Http_IHttpResponseMessage; safecall;
    property Progress: AsyncOperationProgressHandler_2__Http_IHttpResponseMessage__Http_HttpProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Http_IHttpResponseMessage__Http_HttpProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{9EB2B852-E019-5440-8F88-0DD7D56FEA47}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.HttpProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress = interface(AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress_Delegate_Base)
  ['{3958C22F-F9CD-50CE-96E0-B6DDFEA4D781}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress; progressInfo: Http_HttpProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{B0CF2F85-6992-52BE-8F0B-93964B14D963}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress = interface(AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress_Delegate_Base)
  ['{40355ED8-FFD4-5D4D-A0BA-7FBAD852B3B5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress_Base = interface(IInspectable)
  ['{88D9BB75-AFB4-5F32-9D7E-D3BF3785354C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress = interface(IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress_Base)
  ['{AFC90997-CE2F-5F8F-90A4-0BBA7F958ACE}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Http_HttpProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Http_HttpProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{04682E89-6E8B-54B1-A466-432E130CF9A6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.HttpProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress = interface(AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress_Delegate_Base)
  ['{762108C6-97D2-5C35-A696-BC328A160CC6}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress; progressInfo: Http_HttpProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{504A34EC-5499-5A16-BFFC-3CCB64A3547A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress = interface(AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress_Delegate_Base)
  ['{7855EC87-CE8B-5FAD-9B25-74C6C5D0D45E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress_Base = interface(IInspectable)
  ['{0B97C784-DF17-571F-8337-447DFF068A9C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress = interface(IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress_Base)
  ['{C4231403-5E6A-57BC-B936-3B4BFD933A33}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__Http_HttpProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Http_HttpProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{CF0A03F6-A80A-5B46-9C80-F4AD9ED6E2D6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.HttpProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress = interface(AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress_Delegate_Base)
  ['{19923AE9-85FB-522F-9A5C-8ECD4C1B4069}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress; progressInfo: Http_HttpProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress_Delegate_Base = interface(IUnknown)
  ['{98AB9ACB-38DB-588F-A5F9-9F484B2200CD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,Windows.Web.Http.HttpProgress>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress = interface(AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress_Delegate_Base)
  ['{BCD39D9F-0A4D-5CF7-9550-CE5A512C5249}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress_Base = interface(IInspectable)
  ['{91ECBE45-E889-5518-BD8D-C5BDE163109B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<String,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,Windows.Web.Http.HttpProgress>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress = interface(IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress_Base)
  ['{7465C617-F19D-5406-8AD3-4857A49AE72E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__Http_HttpProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__Http_HttpProgress read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Web.Http.HttpCompletionOption
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  // Used Types:  Windows.Web.Http.Headers.IHttpRequestHeaderCollection
  }
  // Windows.Web.Http.IHttpClient
  [WinRTClassNameAttribute(SHttp_HttpClient)]
  Http_IHttpClient = interface(IInspectable)
  ['{7FDA1151-3574-4880-A8BA-E6B1E0061F3D}']
    function DeleteAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
    function GetAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; overload; safecall;
    function GetAsync(uri: IUriRuntimeClass; completionOption: Http_HttpCompletionOption): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; overload; safecall;
    function GetBufferAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__IBuffer__Http_HttpProgress; safecall;
    function GetInputStreamAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__IInputStream__Http_HttpProgress; safecall;
    function GetStringAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__HSTRING__Http_HttpProgress; safecall;
    function PostAsync(uri: IUriRuntimeClass; content: Http_IHttpContent): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
    function PutAsync(uri: IUriRuntimeClass; content: Http_IHttpContent): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
    function SendRequestAsync(request: Http_IHttpRequestMessage): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; overload; safecall;
    function SendRequestAsync(request: Http_IHttpRequestMessage; completionOption: Http_HttpCompletionOption): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; overload; safecall;
    function get_DefaultRequestHeaders: Http_Headers_IHttpRequestHeaderCollection; safecall;
    property DefaultRequestHeaders: Http_Headers_IHttpRequestHeaderCollection read get_DefaultRequestHeaders;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.WebErrorStatus>
  IIterator_1__WebErrorStatus_Base = interface(IInspectable)
  ['{FA704929-0761-5DD6-9675-052A8C61E2C2}']
  end;
  {
  // Used Types:  Windows.Web.WebErrorStatus
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.WebErrorStatus>
  IIterator_1__WebErrorStatus = interface(IIterator_1__WebErrorStatus_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: WebErrorStatus; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWebErrorStatus): Cardinal; safecall;
    property Current: WebErrorStatus read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.WebErrorStatus>
  IIterable_1__WebErrorStatus_Base = interface(IInspectable)
  ['{7B7F182E-A6CE-556B-9A2E-EF97662F2AEE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.WebErrorStatus>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.WebErrorStatus>
  IIterable_1__WebErrorStatus = interface(IIterable_1__WebErrorStatus_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__WebErrorStatus; safecall;
  end;

  {
  // Used Types:  Windows.Web.WebErrorStatus
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.WebErrorStatus>
  IVectorView_1__WebErrorStatus = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): WebErrorStatus; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WebErrorStatus; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWebErrorStatus): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Web.WebErrorStatus
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.WebErrorStatus>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.WebErrorStatus>
  IVector_1__WebErrorStatus = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): WebErrorStatus; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__WebErrorStatus; safecall;
    function IndexOf(value: WebErrorStatus; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: WebErrorStatus); safecall;
    procedure InsertAt(index: Cardinal; value: WebErrorStatus); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: WebErrorStatus); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWebErrorStatus): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PWebErrorStatus); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Web.WebErrorStatus
  }
  // Windows.Foundation.IReference`1<Windows.Web.WebErrorStatus>
  IReference_1__WebErrorStatus = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: WebErrorStatus; safecall;
    property Value: WebErrorStatus read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Boolean
  }
  // Windows.Web.Http.IHttpCookie
  [WinRTClassNameAttribute(SHttp_HttpCookie)]
  Http_IHttpCookie = interface(IInspectable)
  ['{1F5488E2-CC2D-4779-86A7-88F10687D249}']
    function get_Name: HSTRING; safecall;
    function get_Domain: HSTRING; safecall;
    function get_Path: HSTRING; safecall;
    function get_Expires: IReference_1__DateTime; safecall;
    procedure put_Expires(value: IReference_1__DateTime); safecall;
    function get_HttpOnly: Boolean; safecall;
    procedure put_HttpOnly(value: Boolean); safecall;
    function get_Secure: Boolean; safecall;
    procedure put_Secure(value: Boolean); safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Domain: HSTRING read get_Domain;
    property Expires: IReference_1__DateTime read get_Expires write put_Expires;
    property HttpOnly: Boolean read get_HttpOnly write put_HttpOnly;
    property Name: HSTRING read get_Name;
    property Path: HSTRING read get_Path;
    property Secure: Boolean read get_Secure write put_Secure;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpCookie>
  IIterator_1__Http_IHttpCookie_Base = interface(IInspectable)
  ['{626BC177-8403-5030-A88C-7485CC89D730}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpCookie
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpCookie>
  IIterator_1__Http_IHttpCookie = interface(IIterator_1__Http_IHttpCookie_Base)
  ['{A8612AD1-620E-58B0-BDE5-8FC0032E74C7}']
    function get_Current: Http_IHttpCookie; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_IHttpCookie): Cardinal; safecall;
    property Current: Http_IHttpCookie read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpCookie>
  IIterable_1__Http_IHttpCookie_Base = interface(IInspectable)
  ['{0EB9FA36-88DE-590D-8EA0-B613D0AB015F}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpCookie>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpCookie>
  IIterable_1__Http_IHttpCookie = interface(IIterable_1__Http_IHttpCookie_Base)
  ['{A8C44F66-FDE5-533F-B847-2352EFE4CAA3}']
    function First: IIterator_1__Http_IHttpCookie; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpCookie
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpCookie>
  [WinRTClassNameAttribute(SHttp_HttpCookieCollection)]
  IVectorView_1__Http_IHttpCookie = interface(IInspectable)
  ['{3C8E5170-6FD8-5AD0-AC3D-F5967B66C350}']
    function GetAt(index: Cardinal): Http_IHttpCookie; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Http_IHttpCookie; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_IHttpCookie): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpCookie
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpCookie>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Http.IHttpCookie>
  IVector_1__Http_IHttpCookie = interface(IInspectable)
  ['{4A28204F-4D08-5A93-8245-144F8EE6E7E6}']
    function GetAt(index: Cardinal): Http_IHttpCookie; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Http_IHttpCookie; safecall;
    function IndexOf(value: Http_IHttpCookie; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Http_IHttpCookie); safecall;
    procedure InsertAt(index: Cardinal; value: Http_IHttpCookie); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Http_IHttpCookie); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHttp_IHttpCookie): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHttp_IHttpCookie); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IInputStream>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.IUriToStreamResolver
  IUriToStreamResolver = interface(IInspectable)
  ['{B0ABA86A-9AEB-4D3A-9590-003E3CA7E290}']
    function UriToStreamAsync(uri: IUriRuntimeClass): IAsyncOperation_1__IInputStream; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IInspectable)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{F6D1F700-49C2-52AE-8154-826F9908773C}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__HSTRING; safecall;
    function Insert(key: HSTRING; value: HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  UInt64
  }
  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface(IInspectable)
  ['{8F1DB6E3-6556-5516-825C-1021EE27CD0C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__UInt64__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__UInt64__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64; safecall;
    function GetResults: UInt64; safecall;
    property Progress: AsyncOperationProgressHandler_2__UInt64__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{D17F5EB6-B422-5E26-A817-7E0FD08F75D5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{ABC81235-39C7-59BF-9948-2D14A93D40FD}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface(IInspectable)
  ['{AD960E7F-D73B-56E4-A58C-6EC7678CFD88}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{F9B2E7F6-762F-50DB-95DD-7F6C6EC47090}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{8DB69706-3DD1-5A28-986A-93BE0776D9C3}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface(IInspectable)
  ['{455AA601-F13E-5DEE-B9CB-16B531996327}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface(IInspectable)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  // Used Types:  Boolean
  }
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Double
  }
  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
  end;

  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface(IInspectable)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Current: HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<String>
  }
  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface(IInspectable)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
    function First: IIterator_1__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F13C006-A03A-5F69-B090-75A43E33423E}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  {
  // Used Types:  UInt8
  }
  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  {
  // Used Types:  String
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{09335560-6C6B-5A26-9348-97B781132B20}']
    function get_Key: HSTRING; safecall;
    function get_Value: IInspectable; safecall;
    property Key: HSTRING read get_Key;
    property Value: IInspectable read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
    function get_Current: IKeyValuePair_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface(IInspectable)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IInspectable; out second: IMapView_2__HSTRING__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{1B0D3570-0877-5EC2-8A2C-3B9539506ACA}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IInspectable; safecall;
    function Insert(key: HSTRING; value: IInspectable): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface(IInspectable)
  ['{98B9ACC1-4B56-532E-AC73-03D5291CCA90}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__HSTRING; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: HSTRING); safecall;
    procedure InsertAt(index: Cardinal; value: HSTRING); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: HSTRING); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Http.IHttpResponseMessage,Windows.Web.Http.HttpProgress>
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  }
  // Windows.Web.Http.Filters.IHttpFilter
  Http_Filters_IHttpFilter = interface(IInspectable)
  ['{A4CB6DD5-0902-439E-BFD7-E12552B165CE}']
    function SendRequestAsync(request: Http_IHttpRequestMessage): IAsyncOperationWithProgress_2__Http_IHttpResponseMessage__Http_HttpProgress; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpClient
  // Used Types:  Windows.Web.Http.Filters.IHttpFilter
  }
  // Windows.Web.Http.IHttpClientFactory
  [WinRTClassNameAttribute(SHttp_HttpClient)]
  Http_IHttpClientFactory = interface(IInspectable)
  ['{C30C4ECA-E3FA-4F99-AFB4-63CC65009462}']
    function Create(filter: Http_Filters_IHttpFilter): Http_IHttpClient; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Web.Http.IHttpCookie
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpCookie>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Http.IHttpCookieManager
  [WinRTClassNameAttribute(SHttp_HttpCookieManager)]
  Http_IHttpCookieManager = interface(IInspectable)
  ['{7A431780-CD4F-4E57-A84A-5B0A53D6BB96}']
    function SetCookie(cookie: Http_IHttpCookie): Boolean; overload; safecall;
    function SetCookie(cookie: Http_IHttpCookie; thirdParty: Boolean): Boolean; overload; safecall;
    procedure DeleteCookie(cookie: Http_IHttpCookie); safecall;
    function GetCookies(uri: IUriRuntimeClass): IVectorView_1__Http_IHttpCookie; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpCookie
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpCookieFactory
  [WinRTClassNameAttribute(SHttp_HttpCookie)]
  Http_IHttpCookieFactory = interface(IInspectable)
  ['{6A0585A9-931C-4CD1-A96D-C21701785C5F}']
    function Create(name: HSTRING; domain: HSTRING; path: HSTRING): Http_IHttpCookie; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpMethod
  }
  // Windows.Web.Http.IHttpMethodStatics
  [WinRTClassNameAttribute(SHttp_HttpMethod)]
  Http_IHttpMethodStatics = interface(IInspectable)
  ['{64D171F0-D99A-4153-8DC6-D68CC4CCE317}']
    function get_Delete: Http_IHttpMethod; safecall;
    function get_Get: Http_IHttpMethod; safecall;
    function get_Head: Http_IHttpMethod; safecall;
    function get_Options: Http_IHttpMethod; safecall;
    function get_Patch: Http_IHttpMethod; safecall;
    function get_Post: Http_IHttpMethod; safecall;
    function get_Put: Http_IHttpMethod; safecall;
    property Delete: Http_IHttpMethod read get_Delete;
    property Get: Http_IHttpMethod read get_Get;
    property Head: Http_IHttpMethod read get_Head;
    property Options: Http_IHttpMethod read get_Options;
    property Patch: Http_IHttpMethod read get_Patch;
    property Post: Http_IHttpMethod read get_Post;
    property Put: Http_IHttpMethod read get_Put;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpMethodFactory
  [WinRTClassNameAttribute(SHttp_HttpMethod)]
  Http_IHttpMethodFactory = interface(IInspectable)
  ['{3C51D10D-36D7-40F8-A86D-E759CAF2F83F}']
    function Create(method: HSTRING): Http_IHttpMethod; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  // Used Types:  Windows.Web.Http.IHttpMethod
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Http.IHttpRequestMessageFactory
  [WinRTClassNameAttribute(SHttp_HttpRequestMessage)]
  Http_IHttpRequestMessageFactory = interface(IInspectable)
  ['{5BAC994E-3886-412E-AEC3-52EC7F25616F}']
    function Create(method: Http_IHttpMethod; uri: IUriRuntimeClass): Http_IHttpRequestMessage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  // Used Types:  Windows.Web.Http.HttpStatusCode
  }
  // Windows.Web.Http.IHttpResponseMessageFactory
  [WinRTClassNameAttribute(SHttp_HttpResponseMessage)]
  Http_IHttpResponseMessageFactory = interface(IInspectable)
  ['{52A8AF99-F095-43DA-B60F-7CFC2BC7EA2F}']
    function Create(statusCode: Http_HttpStatusCode): Http_IHttpResponseMessage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.UnicodeEncoding
  }
  // Windows.Web.Http.IHttpStringContentFactory
  [WinRTClassNameAttribute(SHttp_HttpStringContent)]
  Http_IHttpStringContentFactory = interface(IInspectable)
  ['{46649D5B-2E93-48EB-8E61-19677878E57F}']
    function CreateFromString(content: HSTRING): Http_IHttpContent; safecall;
    function CreateFromStringWithEncoding(content: HSTRING; encoding: UnicodeEncoding): Http_IHttpContent; safecall;
    function CreateFromStringWithEncodingAndMediaType(content: HSTRING; encoding: UnicodeEncoding; mediaType: HSTRING): Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt32
  }
  // Windows.Web.Http.IHttpBufferContentFactory
  [WinRTClassNameAttribute(SHttp_HttpBufferContent)]
  Http_IHttpBufferContentFactory = interface(IInspectable)
  ['{BC20C193-C41F-4FF7-9123-6435736EADC2}']
    function CreateFromBuffer(content: IBuffer): Http_IHttpContent; safecall;
    function CreateFromBufferWithOffset(content: IBuffer; offset: Cardinal; count: Cardinal): Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Web.Http.IHttpStreamContentFactory
  [WinRTClassNameAttribute(SHttp_HttpStreamContent)]
  Http_IHttpStreamContentFactory = interface(IInspectable)
  ['{F3E64D9D-F725-407E-942F-0EDA189809F4}']
    function CreateFromInputStream(content: IInputStream): Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  }
  // Windows.Web.Http.IHttpFormUrlEncodedContentFactory
  [WinRTClassNameAttribute(SHttp_HttpFormUrlEncodedContent)]
  Http_IHttpFormUrlEncodedContentFactory = interface(IInspectable)
  ['{43F0138C-2F73-4302-B5F3-EAE9238A5E01}']
    function Create(content: IIterable_1__IKeyValuePair_2__HSTRING__HSTRING): Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpMultipartContentFactory
  [WinRTClassNameAttribute(SHttp_HttpMultipartContent)]
  Http_IHttpMultipartContentFactory = interface(IInspectable)
  ['{7EB42E62-0222-4F20-B372-47D5DB5D33B4}']
    function CreateWithSubtype(subtype: HSTRING): Http_IHttpContent; safecall;
    function CreateWithSubtypeAndBoundary(subtype: HSTRING; boundary: HSTRING): Http_IHttpContent; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpContent>
  IIterator_1__Http_IHttpContent_Base = interface(IInspectable)
  ['{59F44F31-695E-5AF7-A3C5-85C01939CEC8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpContent>
  IIterator_1__Http_IHttpContent = interface(IIterator_1__Http_IHttpContent_Base)
  ['{59F44F31-695E-5AF7-A3C5-85C01939CEC8}']
    function get_Current: Http_IHttpContent; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHttp_IHttpContent): Cardinal; safecall;
    property Current: Http_IHttpContent read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpContent>
  IIterable_1__Http_IHttpContent_Base = interface(IInspectable)
  ['{F102157F-B482-5736-9D12-C683BC494942}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Http.IHttpContent>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpContent>
  IIterable_1__Http_IHttpContent = interface(IIterable_1__Http_IHttpContent_Base)
  ['{F102157F-B482-5736-9D12-C683BC494942}']
    function First: IIterator_1__Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  }
  // Windows.Web.Http.IHttpMultipartContent
  [WinRTClassNameAttribute(SHttp_HttpMultipartContent)]
  Http_IHttpMultipartContent = interface(IInspectable)
  ['{DF916AFF-9926-4AC9-AAF1-E0D04EF09BB9}']
    procedure Add(content: Http_IHttpContent); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpMultipartFormDataContentFactory
  [WinRTClassNameAttribute(SHttp_HttpMultipartFormDataContent)]
  Http_IHttpMultipartFormDataContentFactory = interface(IInspectable)
  ['{A04D7311-5017-4622-93A8-49B24A4FCBFC}']
    function CreateWithBoundary(boundary: HSTRING): Http_IHttpContent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpContent
  // Used Types:  String
  }
  // Windows.Web.Http.IHttpMultipartFormDataContent
  [WinRTClassNameAttribute(SHttp_HttpMultipartFormDataContent)]
  Http_IHttpMultipartFormDataContent = interface(IInspectable)
  ['{64D337E2-E967-4624-B6D1-CF74604A4A42}']
    procedure Add(content: Http_IHttpContent); overload; safecall;
    procedure Add(content: Http_IHttpContent; name: HSTRING); overload; safecall;
    procedure Add(content: Http_IHttpContent; name: HSTRING; fileName: HSTRING); overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Filters.HttpCacheReadBehavior
  // Used Types:  Windows.Web.Http.Filters.HttpCacheWriteBehavior
  }
  // Windows.Web.Http.Filters.IHttpCacheControl
  [WinRTClassNameAttribute(SHttp_Filters_HttpCacheControl)]
  Http_Filters_IHttpCacheControl = interface(IInspectable)
  ['{C77E1CB4-3CEA-4EB5-AC85-04E186E63AB7}']
    function get_ReadBehavior: Http_Filters_HttpCacheReadBehavior; safecall;
    procedure put_ReadBehavior(value: Http_Filters_HttpCacheReadBehavior); safecall;
    function get_WriteBehavior: Http_Filters_HttpCacheWriteBehavior; safecall;
    procedure put_WriteBehavior(value: Http_Filters_HttpCacheWriteBehavior); safecall;
    property ReadBehavior: Http_Filters_HttpCacheReadBehavior read get_ReadBehavior write put_ReadBehavior;
    property WriteBehavior: Http_Filters_HttpCacheWriteBehavior read get_WriteBehavior write put_WriteBehavior;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  // Used Types:  Windows.Security.Cryptography.Certificates.ICertificate
  // Used Types:  Windows.Networking.Sockets.SocketSslErrorSeverity
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ChainValidationResult>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ICertificate>
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs
  [WinRTClassNameAttribute(SHttp_Filters_HttpServerCustomValidationRequestedEventArgs)]
  Http_Filters_IHttpServerCustomValidationRequestedEventArgs = interface(IInspectable)
  ['{3165FE32-E7DD-48B7-A361-939C750E63CC}']
    function get_RequestMessage: Http_IHttpRequestMessage; safecall;
    function get_ServerCertificate: Certificates_ICertificate; safecall;
    function get_ServerCertificateErrorSeverity: SocketSslErrorSeverity; safecall;
    function get_ServerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult; safecall;
    function get_ServerIntermediateCertificates: IVectorView_1__Certificates_ICertificate; safecall;
    procedure Reject; safecall;
    function GetDeferral: IDeferral; safecall;
    property RequestMessage: Http_IHttpRequestMessage read get_RequestMessage;
    property ServerCertificate: Certificates_ICertificate read get_ServerCertificate;
    property ServerCertificateErrorSeverity: SocketSslErrorSeverity read get_ServerCertificateErrorSeverity;
    property ServerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult read get_ServerCertificateErrors;
    property ServerIntermediateCertificates: IVectorView_1__Certificates_ICertificate read get_ServerIntermediateCertificates;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.CollectionChange
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface(IInspectable)
  ['{60141EFB-F2F9-5377-96FD-F8C60D9558B5}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Key: HSTRING; safecall;
    property CollectionChange: CollectionChange read get_CollectionChange;
    property Key: HSTRING read get_Key;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__IInspectable; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  }
  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{236AAC9D-FB12-5C4D-A41C-9E445FB4D7EC}']
    function add_MapChanged(vhnd: MapChangedEventHandler_2__HSTRING__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MapChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Web.Http.Filters.IHttpCacheControl
  // Used Types:  Windows.Web.Http.IHttpCookieManager
  // Used Types:  Windows.Security.Cryptography.Certificates.ICertificate
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Security.Cryptography.Certificates.ChainValidationResult>
  // Used Types:  UInt32
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  }
  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter
  [WinRTClassNameAttribute(SHttp_Filters_HttpBaseProtocolFilter)]
  Http_Filters_IHttpBaseProtocolFilter = interface(IInspectable)
  ['{71C89B09-E131-4B54-A53C-EB43FF37E9BB}']
    function get_AllowAutoRedirect: Boolean; safecall;
    procedure put_AllowAutoRedirect(value: Boolean); safecall;
    function get_AllowUI: Boolean; safecall;
    procedure put_AllowUI(value: Boolean); safecall;
    function get_AutomaticDecompression: Boolean; safecall;
    procedure put_AutomaticDecompression(value: Boolean); safecall;
    function get_CacheControl: Http_Filters_IHttpCacheControl; safecall;
    function get_CookieManager: Http_IHttpCookieManager; safecall;
    function get_ClientCertificate: Certificates_ICertificate; safecall;
    procedure put_ClientCertificate(value: Certificates_ICertificate); safecall;
    function get_IgnorableServerCertificateErrors: IVector_1__Certificates_ChainValidationResult; safecall;
    function get_MaxConnectionsPerServer: Cardinal; safecall;
    procedure put_MaxConnectionsPerServer(value: Cardinal); safecall;
    function get_ProxyCredential: IPasswordCredential; safecall;
    procedure put_ProxyCredential(value: IPasswordCredential); safecall;
    function get_ServerCredential: IPasswordCredential; safecall;
    procedure put_ServerCredential(value: IPasswordCredential); safecall;
    function get_UseProxy: Boolean; safecall;
    procedure put_UseProxy(value: Boolean); safecall;
    property AllowAutoRedirect: Boolean read get_AllowAutoRedirect write put_AllowAutoRedirect;
    property AllowUI: Boolean read get_AllowUI write put_AllowUI;
    property AutomaticDecompression: Boolean read get_AutomaticDecompression write put_AutomaticDecompression;
    property CacheControl: Http_Filters_IHttpCacheControl read get_CacheControl;
    property ClientCertificate: Certificates_ICertificate read get_ClientCertificate write put_ClientCertificate;
    property CookieManager: Http_IHttpCookieManager read get_CookieManager;
    property IgnorableServerCertificateErrors: IVector_1__Certificates_ChainValidationResult read get_IgnorableServerCertificateErrors;
    property MaxConnectionsPerServer: Cardinal read get_MaxConnectionsPerServer write put_MaxConnectionsPerServer;
    property ProxyCredential: IPasswordCredential read get_ProxyCredential write put_ProxyCredential;
    property ServerCredential: IPasswordCredential read get_ServerCredential write put_ServerCredential;
    property UseProxy: Boolean read get_UseProxy write put_UseProxy;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.HttpVersion
  }
  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter2
  Http_Filters_IHttpBaseProtocolFilter2 = interface(IInspectable)
  ['{2EC30013-9427-4900-A017-FA7DA3B5C9AE}']
    function get_MaxVersion: Http_HttpVersion; safecall;
    procedure put_MaxVersion(value: Http_HttpVersion); safecall;
    property MaxVersion: Http_HttpVersion read get_MaxVersion write put_MaxVersion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Filters.HttpCookieUsageBehavior
  }
  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter3
  Http_Filters_IHttpBaseProtocolFilter3 = interface(IInspectable)
  ['{D43F4D4C-BD42-43AE-8717-AD2C8F4B2937}']
    function get_CookieUsageBehavior: Http_Filters_HttpCookieUsageBehavior; safecall;
    procedure put_CookieUsageBehavior(value: Http_Filters_HttpCookieUsageBehavior); safecall;
    property CookieUsageBehavior: Http_Filters_HttpCookieUsageBehavior read get_CookieUsageBehavior write put_CookieUsageBehavior;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Web.Http.Filters.IHttpBaseProtocolFilter,Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs>
  TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{ED0260C6-41F2-5A04-9A8B-2930D7FF8A9E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Filters.IHttpBaseProtocolFilter
  // Used Types:  Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Web.Http.Filters.IHttpBaseProtocolFilter,Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs>
  TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs = interface(TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs_Delegate_Base)
  ['{9E2DA096-3896-5B4E-82EF-4B2B55B39EBD}']
    procedure Invoke(sender: Http_Filters_IHttpBaseProtocolFilter; args: Http_Filters_IHttpServerCustomValidationRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Web.Http.Filters.IHttpBaseProtocolFilter,Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs>
  }
  // Windows.Web.Http.Filters.IHttpBaseProtocolFilter4
  Http_Filters_IHttpBaseProtocolFilter4 = interface(IInspectable)
  ['{9FE36CCF-2983-4893-941F-EB518CA8CEF9}']
    function add_ServerCustomValidationRequested(eventHandler: TypedEventHandler_2__Http_Filters_IHttpBaseProtocolFilter__Http_Filters_IHttpServerCustomValidationRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ServerCustomValidationRequested(eventCookie: EventRegistrationToken); safecall;
    procedure ClearAuthenticationCache; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpChallengeHeaderValue)]
  Http_Headers_IHttpChallengeHeaderValueStatics = interface(IInspectable)
  ['{F3D38A72-FC01-4D01-A008-FCB7C459D635}']
    function Parse(input: HSTRING): Http_Headers_IHttpChallengeHeaderValue; safecall;
    function TryParse(input: HSTRING; out challengeHeaderValue: Http_Headers_IHttpChallengeHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpChallengeHeaderValue)]
  Http_Headers_IHttpChallengeHeaderValueFactory = interface(IInspectable)
  ['{C452C451-D99C-40AA-9399-90EEB98FC613}']
    function CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpChallengeHeaderValue; safecall;
    function CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpChallengeHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpCredentialsHeaderValue)]
  Http_Headers_IHttpCredentialsHeaderValueStatics = interface(IInspectable)
  ['{A69B2BE6-CE8C-4443-A35A-1B727B131036}']
    function Parse(input: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; safecall;
    function TryParse(input: HSTRING; out credentialsHeaderValue: Http_Headers_IHttpCredentialsHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpCredentialsHeaderValue)]
  Http_Headers_IHttpCredentialsHeaderValueFactory = interface(IInspectable)
  ['{F21D9E91-4D1C-4182-BFD1-34470A62F950}']
    function CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; safecall;
    function CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpConnectionOptionHeaderValue)]
  Http_Headers_IHttpConnectionOptionHeaderValueStatics = interface(IInspectable)
  ['{AAA75D37-A946-4B1F-85AF-48B68B3C50BD}']
    function Parse(input: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
    function TryParse(input: HSTRING; out connectionOptionHeaderValue: Http_Headers_IHttpConnectionOptionHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpConnectionOptionHeaderValue)]
  Http_Headers_IHttpConnectionOptionHeaderValueFactory = interface(IInspectable)
  ['{D93CCC1E-0B7D-4C3F-A58D-A2A1BDEABC0A}']
    function Create(token: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingHeaderValue)]
  Http_Headers_IHttpContentCodingHeaderValueStatics = interface(IInspectable)
  ['{94D8602E-F9BF-42F7-AA46-ED272A41E212}']
    function Parse(input: HSTRING): Http_Headers_IHttpContentCodingHeaderValue; safecall;
    function TryParse(input: HSTRING; out contentCodingHeaderValue: Http_Headers_IHttpContentCodingHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpContentCodingHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingHeaderValue)]
  Http_Headers_IHttpContentCodingHeaderValueFactory = interface(IInspectable)
  ['{C53D2BD7-332B-4350-8510-2E67A2289A5A}']
    function Create(contentCoding: HSTRING): Http_Headers_IHttpContentCodingHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentDispositionHeaderValue)]
  Http_Headers_IHttpContentDispositionHeaderValueStatics = interface(IInspectable)
  ['{29C56067-5A37-46E4-B074-C5177D69CA66}']
    function Parse(input: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue; safecall;
    function TryParse(input: HSTRING; out contentDispositionHeaderValue: Http_Headers_IHttpContentDispositionHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentDispositionHeaderValue)]
  Http_Headers_IHttpContentDispositionHeaderValueFactory = interface(IInspectable)
  ['{9915BBC4-456C-4E81-8295-B2AB3CBCF545}']
    function Create(dispositionType: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentRangeHeaderValue)]
  Http_Headers_IHttpContentRangeHeaderValueStatics = interface(IInspectable)
  ['{80A346CA-174C-4FAE-821C-134CD294AA38}']
    function Parse(input: HSTRING): Http_Headers_IHttpContentRangeHeaderValue; safecall;
    function TryParse(input: HSTRING; out contentRangeHeaderValue: Http_Headers_IHttpContentRangeHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  // Used Types:  UInt64
  }
  // Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentRangeHeaderValue)]
  Http_Headers_IHttpContentRangeHeaderValueFactory = interface(IInspectable)
  ['{3F5BD691-A03C-4456-9A6F-EF27ECD03CAE}']
    function CreateFromLength(length: UInt64): Http_Headers_IHttpContentRangeHeaderValue; safecall;
    function CreateFromRange(from: UInt64; &to: UInt64): Http_Headers_IHttpContentRangeHeaderValue; safecall;
    function CreateFromRangeWithLength(from: UInt64; &to: UInt64; length: UInt64): Http_Headers_IHttpContentRangeHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpCookiePairHeaderValue)]
  Http_Headers_IHttpCookiePairHeaderValueStatics = interface(IInspectable)
  ['{6E866D48-06AF-4462-8158-99388D5DCA81}']
    function Parse(input: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function TryParse(input: HSTRING; out cookiePairHeaderValue: Http_Headers_IHttpCookiePairHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpCookiePairHeaderValue)]
  Http_Headers_IHttpCookiePairHeaderValueFactory = interface(IInspectable)
  ['{635E326F-146F-4F56-AA21-2CB7D6D58B1E}']
    function CreateFromName(name: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; safecall;
    function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpDateOrDeltaHeaderValue)]
  Http_Headers_IHttpDateOrDeltaHeaderValueStatics = interface(IInspectable)
  ['{7C2659A8-6672-4E90-9A9A-F39766F7F576}']
    function Parse(input: HSTRING): Http_Headers_IHttpDateOrDeltaHeaderValue; safecall;
    function TryParse(input: HSTRING; out dateOrDeltaHeaderValue: Http_Headers_IHttpDateOrDeltaHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpExpectationHeaderValue)]
  Http_Headers_IHttpExpectationHeaderValueStatics = interface(IInspectable)
  ['{3019ABE2-CFE5-473B-A57F-FBA5B14EB257}']
    function Parse(input: HSTRING): Http_Headers_IHttpExpectationHeaderValue; safecall;
    function TryParse(input: HSTRING; out expectationHeaderValue: Http_Headers_IHttpExpectationHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpExpectationHeaderValue)]
  Http_Headers_IHttpExpectationHeaderValueFactory = interface(IInspectable)
  ['{4EA275CB-D53E-4868-8856-1E21A5030DC0}']
    function CreateFromName(name: HSTRING): Http_Headers_IHttpExpectationHeaderValue; safecall;
    function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpExpectationHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpLanguageRangeWithQualityHeaderValue)]
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics = interface(IInspectable)
  ['{2541E146-F308-46F5-B695-42F54024EC68}']
    function Parse(input: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function TryParse(input: HSTRING; out languageRangeWithQualityHeaderValue: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Double
  }
  // Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpLanguageRangeWithQualityHeaderValue)]
  Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory = interface(IInspectable)
  ['{7BB83970-780F-4C83-9FE4-DC3087F6BD55}']
    function CreateFromLanguageRange(languageRange: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
    function CreateFromLanguageRangeWithQuality(languageRange: HSTRING; quality: Double): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeHeaderValue)]
  Http_Headers_IHttpMediaTypeHeaderValueStatics = interface(IInspectable)
  ['{E04D83DF-1D41-4D8C-A2DE-6FD2ED87399B}']
    function Parse(input: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue; safecall;
    function TryParse(input: HSTRING; out mediaTypeHeaderValue: Http_Headers_IHttpMediaTypeHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeHeaderValue)]
  Http_Headers_IHttpMediaTypeHeaderValueFactory = interface(IInspectable)
  ['{BED747A8-CD17-42DD-9367-AB9C5B56DD7D}']
    function Create(mediaType: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeWithQualityHeaderValue)]
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueStatics = interface(IInspectable)
  ['{5B070CD9-B560-4FC8-9835-7E6C0A657B24}']
    function Parse(input: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function TryParse(input: HSTRING; out mediaTypeWithQualityHeaderValue: Http_Headers_IHttpMediaTypeWithQualityHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Double
  }
  // Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpMediaTypeWithQualityHeaderValue)]
  Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory = interface(IInspectable)
  ['{4C6D20F4-9457-44E6-A323-D122B958780B}']
    function CreateFromMediaType(mediaType: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
    function CreateFromMediaTypeWithQuality(mediaType: HSTRING; quality: Double): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpNameValueHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpNameValueHeaderValue)]
  Http_Headers_IHttpNameValueHeaderValueStatics = interface(IInspectable)
  ['{FFD4030F-1130-4152-8659-256909A9D115}']
    function Parse(input: HSTRING): Http_Headers_IHttpNameValueHeaderValue; safecall;
    function TryParse(input: HSTRING; out nameValueHeaderValue: Http_Headers_IHttpNameValueHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpNameValueHeaderValue)]
  Http_Headers_IHttpNameValueHeaderValueFactory = interface(IInspectable)
  ['{770E2267-CBF8-4736-A925-93FBE10C7CA8}']
    function CreateFromName(name: HSTRING): Http_Headers_IHttpNameValueHeaderValue; safecall;
    function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpNameValueHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpProductHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductHeaderValue)]
  Http_Headers_IHttpProductHeaderValueStatics = interface(IInspectable)
  ['{90C33E29-BEFC-4337-BE62-49F097975F53}']
    function Parse(input: HSTRING): Http_Headers_IHttpProductHeaderValue; safecall;
    function TryParse(input: HSTRING; out productHeaderValue: Http_Headers_IHttpProductHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpProductHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductHeaderValue)]
  Http_Headers_IHttpProductHeaderValueFactory = interface(IInspectable)
  ['{611AA4F5-82BC-42FB-977B-DC00536E5E86}']
    function CreateFromName(productName: HSTRING): Http_Headers_IHttpProductHeaderValue; safecall;
    function CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductInfoHeaderValue)]
  Http_Headers_IHttpProductInfoHeaderValueStatics = interface(IInspectable)
  ['{DB7FD857-327A-4E73-81E5-7059A302B042}']
    function Parse(input: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function TryParse(input: HSTRING; out productInfoHeaderValue: Http_Headers_IHttpProductInfoHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpProductInfoHeaderValue)]
  Http_Headers_IHttpProductInfoHeaderValueFactory = interface(IInspectable)
  ['{24220FBE-EABE-4464-B460-EC010B7C41E2}']
    function CreateFromComment(productComment: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; safecall;
    function CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingWithQualityHeaderValue)]
  Http_Headers_IHttpContentCodingWithQualityHeaderValueStatics = interface(IInspectable)
  ['{E8C9357C-8F89-4801-8E75-4C9ABFC3DE71}']
    function Parse(input: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function TryParse(input: HSTRING; out contentCodingWithQualityHeaderValue: Http_Headers_IHttpContentCodingWithQualityHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Used Types:  String
  // Used Types:  Double
  }
  // Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpContentCodingWithQualityHeaderValue)]
  Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory = interface(IInspectable)
  ['{C45EEE1A-C553-46FC-ADE2-D75C1D53DF7B}']
    function CreateFromValue(contentCoding: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
    function CreateFromValueWithQuality(contentCoding: HSTRING; quality: Double): Http_Headers_IHttpContentCodingWithQualityHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueStatics
  [WinRTClassNameAttribute(SHttp_Headers_HttpTransferCodingHeaderValue)]
  Http_Headers_IHttpTransferCodingHeaderValueStatics = interface(IInspectable)
  ['{6AB8892A-1A98-4D32-A906-7470A9875CE5}']
    function Parse(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue; safecall;
    function TryParse(input: HSTRING; out transferCodingHeaderValue: Http_Headers_IHttpTransferCodingHeaderValue): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Used Types:  String
  }
  // Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueFactory
  [WinRTClassNameAttribute(SHttp_Headers_HttpTransferCodingHeaderValue)]
  Http_Headers_IHttpTransferCodingHeaderValueFactory = interface(IInspectable)
  ['{BB62DFFC-E361-4F08-8E4F-C9E723DE703B}']
    function Create(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.WebErrorStatus
  // Used Types:  Int32
  }
  // Windows.Web.IWebErrorStatics
  [WinRTClassNameAttribute(SWebError)]
  IWebErrorStatics = interface(IInspectable)
  ['{FE616766-BF27-4064-87B7-6563BB11CE2E}']
    function GetStatus(hresult: Integer): WebErrorStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationAttribute
  [WinRTClassNameAttribute(SSyndication_SyndicationAttribute)]
  Syndication_ISyndicationAttribute = interface(IInspectable)
  ['{71E8F969-526E-4001-9A91-E84F83161AB1}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Namespace: HSTRING; safecall;
    procedure put_Namespace(value: HSTRING); safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Name: HSTRING read get_Name write put_Name;
    property Namespace: HSTRING read get_Namespace write put_Namespace;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationAttribute
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationAttributeFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationAttribute)]
  Syndication_ISyndicationAttributeFactory = interface(IInspectable)
  ['{624F1599-ED3E-420F-BE86-640414886E4B}']
    function CreateSyndicationAttribute(attributeName: HSTRING; attributeNamespace: HSTRING; attributeValue: HSTRING): Syndication_ISyndicationAttribute; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterator_1__Syndication_ISyndicationAttribute_Base = interface(IInspectable)
  ['{A76FCDE8-F86F-5B75-AA7D-5787467A319D}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationAttribute
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterator_1__Syndication_ISyndicationAttribute = interface(IIterator_1__Syndication_ISyndicationAttribute_Base)
  ['{C046C4B6-6B2B-5FEB-9088-CE54653DD53A}']
    function get_Current: Syndication_ISyndicationAttribute; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationAttribute): Cardinal; safecall;
    property Current: Syndication_ISyndicationAttribute read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterable_1__Syndication_ISyndicationAttribute_Base = interface(IInspectable)
  ['{329EABE1-EFCC-539E-96BA-F6A44F221DBD}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationAttribute>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationAttribute>
  IIterable_1__Syndication_ISyndicationAttribute = interface(IIterable_1__Syndication_ISyndicationAttribute_Base)
  ['{E94DC2E6-1E3B-57F9-8AF4-8EB27E8C46E2}']
    function First: IIterator_1__Syndication_ISyndicationAttribute; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationAttribute
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationAttribute>
  IVectorView_1__Syndication_ISyndicationAttribute = interface(IInspectable)
  ['{A64B3028-B855-5C10-B2C6-C321AA1EF109}']
    function GetAt(index: Cardinal): Syndication_ISyndicationAttribute; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationAttribute; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationAttribute): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationAttribute
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationAttribute>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationAttribute>
  IVector_1__Syndication_ISyndicationAttribute = interface(IInspectable)
  ['{DECD2471-BA14-566D-B9D6-876488AA4152}']
    function GetAt(index: Cardinal): Syndication_ISyndicationAttribute; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationAttribute; safecall;
    function IndexOf(value: Syndication_ISyndicationAttribute; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationAttribute); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationAttribute); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationAttribute); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationAttribute): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationAttribute); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationNode>
  IIterator_1__Syndication_ISyndicationNode_Base = interface(IInspectable)
  ['{2DC8D9D6-0F44-5692-933E-F8902AB7FB94}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationNode
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationNode>
  IIterator_1__Syndication_ISyndicationNode = interface(IIterator_1__Syndication_ISyndicationNode_Base)
  ['{2DC8D9D6-0F44-5692-933E-F8902AB7FB94}']
    function get_Current: Syndication_ISyndicationNode; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationNode): Cardinal; safecall;
    property Current: Syndication_ISyndicationNode read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationNode>
  IIterable_1__Syndication_ISyndicationNode_Base = interface(IInspectable)
  ['{B486569A-72B3-57AA-9950-CEA0B3E4FC58}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationNode>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationNode>
  IIterable_1__Syndication_ISyndicationNode = interface(IIterable_1__Syndication_ISyndicationNode_Base)
  ['{B486569A-72B3-57AA-9950-CEA0B3E4FC58}']
    function First: IIterator_1__Syndication_ISyndicationNode; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationNode
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationNode>
  IVectorView_1__Syndication_ISyndicationNode = interface(IInspectable)
  ['{6B4BD4A1-B4F6-5433-AFD7-BD2E501A1041}']
    function GetAt(index: Cardinal): Syndication_ISyndicationNode; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationNode; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationNode): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationNode
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationNode>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationNode>
  IVector_1__Syndication_ISyndicationNode = interface(IInspectable)
  ['{F4508AFA-9F02-5EB8-A389-14BBE5193AC0}']
    function GetAt(index: Cardinal): Syndication_ISyndicationNode; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationNode; safecall;
    function IndexOf(value: Syndication_ISyndicationNode; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationNode); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationNode); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationNode); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationNode): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationNode); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationAttribute>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationNode>
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.Web.Syndication.SyndicationFormat
  }
  // Windows.Web.Syndication.ISyndicationNode
  [WinRTClassNameAttribute(SSyndication_SyndicationNode)]
  Syndication_ISyndicationNode = interface(IInspectable)
  ['{753CEF78-51F8-45C0-A9F5-F1719DEC3FB2}']
    function get_NodeName: HSTRING; safecall;
    procedure put_NodeName(value: HSTRING); safecall;
    function get_NodeNamespace: HSTRING; safecall;
    procedure put_NodeNamespace(value: HSTRING); safecall;
    function get_NodeValue: HSTRING; safecall;
    procedure put_NodeValue(value: HSTRING); safecall;
    function get_Language: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_BaseUri: IUriRuntimeClass; safecall;
    procedure put_BaseUri(value: IUriRuntimeClass); safecall;
    function get_AttributeExtensions: IVector_1__Syndication_ISyndicationAttribute; safecall;
    function get_ElementExtensions: IVector_1__Syndication_ISyndicationNode; safecall;
    function GetXmlDocument(format: Syndication_SyndicationFormat): Xml_Dom_IXmlDocument; safecall;
    property AttributeExtensions: IVector_1__Syndication_ISyndicationAttribute read get_AttributeExtensions;
    property BaseUri: IUriRuntimeClass read get_BaseUri write put_BaseUri;
    property ElementExtensions: IVector_1__Syndication_ISyndicationNode read get_ElementExtensions;
    property Language: HSTRING read get_Language write put_Language;
    property NodeName: HSTRING read get_NodeName write put_NodeName;
    property NodeNamespace: HSTRING read get_NodeNamespace write put_NodeNamespace;
    property NodeValue: HSTRING read get_NodeValue write put_NodeValue;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationNode
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationNodeFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationNode)]
  Syndication_ISyndicationNodeFactory = interface(IInspectable)
  ['{12902188-4ACB-49A8-B777-A5EB92E18A79}']
    function CreateSyndicationNode(nodeName: HSTRING; nodeNamespace: HSTRING; nodeValue: HSTRING): Syndication_ISyndicationNode; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationGenerator
  [WinRTClassNameAttribute(SSyndication_SyndicationGenerator)]
  Syndication_ISyndicationGenerator = interface(IInspectable)
  ['{9768B379-FB2B-4F6D-B41C-088A5868825C}']
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    procedure put_Uri(value: IUriRuntimeClass); safecall;
    function get_Version: HSTRING; safecall;
    procedure put_Version(value: HSTRING); safecall;
    property Text: HSTRING read get_Text write put_Text;
    property Uri: IUriRuntimeClass read get_Uri write put_Uri;
    property Version: HSTRING read get_Version write put_Version;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationGenerator
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationGeneratorFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationGenerator)]
  Syndication_ISyndicationGeneratorFactory = interface(IInspectable)
  ['{A34083E3-1E26-4DBC-BA9D-1AB84BEFF97B}']
    function CreateSyndicationGenerator(text: HSTRING): Syndication_ISyndicationGenerator; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.Web.Syndication.ISyndicationText
  [WinRTClassNameAttribute(SSyndication_SyndicationText)]
  Syndication_ISyndicationText = interface(IInspectable)
  ['{B9CC5E80-313A-4091-A2A6-243E0EE923F9}']
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function get_Type: HSTRING; safecall;
    procedure put_Type(value: HSTRING); safecall;
    function get_Xml: Xml_Dom_IXmlDocument; safecall;
    procedure put_Xml(value: Xml_Dom_IXmlDocument); safecall;
    property Text: HSTRING read get_Text write put_Text;
    property &Type: HSTRING read get_Type write put_Type;
    property Xml: Xml_Dom_IXmlDocument read get_Xml write put_Xml;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  String
  // Used Types:  Windows.Web.Syndication.SyndicationTextType
  }
  // Windows.Web.Syndication.ISyndicationTextFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationText)]
  Syndication_ISyndicationTextFactory = interface(IInspectable)
  ['{EE7342F7-11C6-4B25-AB62-E596BD162946}']
    function CreateSyndicationText(text: HSTRING): Syndication_ISyndicationText; safecall;
    function CreateSyndicationTextEx(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationContent
  [WinRTClassNameAttribute(SSyndication_SyndicationContent)]
  Syndication_ISyndicationContent = interface(IInspectable)
  ['{4641FEFE-0E55-40D0-B8D0-6A2CCBA9FC7C}']
    function get_SourceUri: IUriRuntimeClass; safecall;
    procedure put_SourceUri(value: IUriRuntimeClass); safecall;
    property SourceUri: IUriRuntimeClass read get_SourceUri write put_SourceUri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  String
  // Used Types:  Windows.Web.Syndication.SyndicationTextType
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationContentFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationContent)]
  Syndication_ISyndicationContentFactory = interface(IInspectable)
  ['{3D2FBB93-9520-4173-9388-7E2DF324A8A0}']
    function CreateSyndicationContent(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText; safecall;
    function CreateSyndicationContentWithSourceUri(sourceUri: IUriRuntimeClass): Syndication_ISyndicationText; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationLink
  [WinRTClassNameAttribute(SSyndication_SyndicationLink)]
  Syndication_ISyndicationLink = interface(IInspectable)
  ['{27553ABD-A10E-41B5-86BD-9759086EB0C5}']
    function get_Length: Cardinal; safecall;
    procedure put_Length(value: Cardinal); safecall;
    function get_MediaType: HSTRING; safecall;
    procedure put_MediaType(value: HSTRING); safecall;
    function get_Relationship: HSTRING; safecall;
    procedure put_Relationship(value: HSTRING); safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    procedure put_Uri(value: IUriRuntimeClass); safecall;
    function get_ResourceLanguage: HSTRING; safecall;
    procedure put_ResourceLanguage(value: HSTRING); safecall;
    property Length: Cardinal read get_Length write put_Length;
    property MediaType: HSTRING read get_MediaType write put_MediaType;
    property Relationship: HSTRING read get_Relationship write put_Relationship;
    property ResourceLanguage: HSTRING read get_ResourceLanguage write put_ResourceLanguage;
    property Title: HSTRING read get_Title write put_Title;
    property Uri: IUriRuntimeClass read get_Uri write put_Uri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationLink
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  // Used Types:  UInt32
  }
  // Windows.Web.Syndication.ISyndicationLinkFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationLink)]
  Syndication_ISyndicationLinkFactory = interface(IInspectable)
  ['{5ED863D4-5535-48AC-98D4-C190995080B3}']
    function CreateSyndicationLink(uri: IUriRuntimeClass): Syndication_ISyndicationLink; safecall;
    function CreateSyndicationLinkEx(uri: IUriRuntimeClass; relationship: HSTRING; title: HSTRING; mediaType: HSTRING; length: Cardinal): Syndication_ISyndicationLink; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationPerson
  [WinRTClassNameAttribute(SSyndication_SyndicationPerson)]
  Syndication_ISyndicationPerson = interface(IInspectable)
  ['{FA1EE5DA-A7C6-4517-A096-0143FAF29327}']
    function get_Email: HSTRING; safecall;
    procedure put_Email(value: HSTRING); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    procedure put_Uri(value: IUriRuntimeClass); safecall;
    property Email: HSTRING read get_Email write put_Email;
    property Name: HSTRING read get_Name write put_Name;
    property Uri: IUriRuntimeClass read get_Uri write put_Uri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationPerson
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationPersonFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationPerson)]
  Syndication_ISyndicationPersonFactory = interface(IInspectable)
  ['{DCF4886D-229D-4B58-A49B-F3D2F0F5C99F}']
    function CreateSyndicationPerson(name: HSTRING): Syndication_ISyndicationPerson; safecall;
    function CreateSyndicationPersonEx(name: HSTRING; email: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationPerson; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationCategory
  [WinRTClassNameAttribute(SSyndication_SyndicationCategory)]
  Syndication_ISyndicationCategory = interface(IInspectable)
  ['{8715626F-0CBA-4A7F-89FF-ECB5281423B6}']
    function get_Label: HSTRING; safecall;
    procedure put_Label(value: HSTRING); safecall;
    function get_Scheme: HSTRING; safecall;
    procedure put_Scheme(value: HSTRING); safecall;
    function get_Term: HSTRING; safecall;
    procedure put_Term(value: HSTRING); safecall;
    property &Label: HSTRING read get_Label write put_Label;
    property Scheme: HSTRING read get_Scheme write put_Scheme;
    property Term: HSTRING read get_Term write put_Term;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationCategory
  // Used Types:  String
  }
  // Windows.Web.Syndication.ISyndicationCategoryFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationCategory)]
  Syndication_ISyndicationCategoryFactory = interface(IInspectable)
  ['{AB42802F-49E0-4525-8AB2-AB45C02528FF}']
    function CreateSyndicationCategory(term: HSTRING): Syndication_ISyndicationCategory; safecall;
    function CreateSyndicationCategoryEx(term: HSTRING; scheme: HSTRING; &label: HSTRING): Syndication_ISyndicationCategory; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterator_1__Syndication_ISyndicationPerson_Base = interface(IInspectable)
  ['{1745E807-F209-5DA6-8855-7F99E25EB1FC}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationPerson
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterator_1__Syndication_ISyndicationPerson = interface(IIterator_1__Syndication_ISyndicationPerson_Base)
  ['{3468C9B4-7475-52D5-9B53-A41A3D150395}']
    function get_Current: Syndication_ISyndicationPerson; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationPerson): Cardinal; safecall;
    property Current: Syndication_ISyndicationPerson read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterable_1__Syndication_ISyndicationPerson_Base = interface(IInspectable)
  ['{E58E7844-EB34-5284-B09E-DE6762D548CA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationPerson>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationPerson>
  IIterable_1__Syndication_ISyndicationPerson = interface(IIterable_1__Syndication_ISyndicationPerson_Base)
  ['{7E957B1A-ADEC-53BC-AF6C-1003C87796FE}']
    function First: IIterator_1__Syndication_ISyndicationPerson; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationPerson
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationPerson>
  IVectorView_1__Syndication_ISyndicationPerson = interface(IInspectable)
  ['{39BDE03E-6EE0-5441-8C7C-365FFFE9FD86}']
    function GetAt(index: Cardinal): Syndication_ISyndicationPerson; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationPerson; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationPerson): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationPerson
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationPerson>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationPerson>
  IVector_1__Syndication_ISyndicationPerson = interface(IInspectable)
  ['{F38EE985-95AE-516A-97B7-644F488876DD}']
    function GetAt(index: Cardinal): Syndication_ISyndicationPerson; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationPerson; safecall;
    function IndexOf(value: Syndication_ISyndicationPerson; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationPerson); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationPerson); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationPerson); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationPerson): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationPerson); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterator_1__Syndication_ISyndicationCategory_Base = interface(IInspectable)
  ['{2A9228FA-B088-5690-BB38-B7044E0B502B}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationCategory
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterator_1__Syndication_ISyndicationCategory = interface(IIterator_1__Syndication_ISyndicationCategory_Base)
  ['{A15B75B5-824A-5120-842E-CE47127A78C7}']
    function get_Current: Syndication_ISyndicationCategory; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationCategory): Cardinal; safecall;
    property Current: Syndication_ISyndicationCategory read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterable_1__Syndication_ISyndicationCategory_Base = interface(IInspectable)
  ['{D151F7D1-EABD-5300-B55C-149EB289CC71}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationCategory>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationCategory>
  IIterable_1__Syndication_ISyndicationCategory = interface(IIterable_1__Syndication_ISyndicationCategory_Base)
  ['{9C8EFF63-08E7-5A2C-9B1E-067361E49ECB}']
    function First: IIterator_1__Syndication_ISyndicationCategory; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationCategory
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationCategory>
  IVectorView_1__Syndication_ISyndicationCategory = interface(IInspectable)
  ['{CB100B5F-64E4-5935-88B2-C45C7778D72B}']
    function GetAt(index: Cardinal): Syndication_ISyndicationCategory; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationCategory; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationCategory): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationCategory
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationCategory>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationCategory>
  IVector_1__Syndication_ISyndicationCategory = interface(IInspectable)
  ['{9566B443-2358-5233-8D66-4ED2CAE1970D}']
    function GetAt(index: Cardinal): Syndication_ISyndicationCategory; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationCategory; safecall;
    function IndexOf(value: Syndication_ISyndicationCategory; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationCategory); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationCategory); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationCategory); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationCategory): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationCategory); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationLink>
  IIterator_1__Syndication_ISyndicationLink_Base = interface(IInspectable)
  ['{901642B7-6CA4-5B57-B8F1-73208342BA4A}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationLink
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationLink>
  IIterator_1__Syndication_ISyndicationLink = interface(IIterator_1__Syndication_ISyndicationLink_Base)
  ['{AB9941B7-8DFA-5E73-A88C-D43CCDC85975}']
    function get_Current: Syndication_ISyndicationLink; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationLink): Cardinal; safecall;
    property Current: Syndication_ISyndicationLink read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationLink>
  IIterable_1__Syndication_ISyndicationLink_Base = interface(IInspectable)
  ['{C6919F6A-66D9-556A-9632-87D39AF14638}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationLink>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationLink>
  IIterable_1__Syndication_ISyndicationLink = interface(IIterable_1__Syndication_ISyndicationLink_Base)
  ['{81964BDA-E897-5E5B-89E9-803831E1FB03}']
    function First: IIterator_1__Syndication_ISyndicationLink; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationLink
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationLink>
  IVectorView_1__Syndication_ISyndicationLink = interface(IInspectable)
  ['{E373BAE8-0E2D-5DC2-AA47-496928DA5BC9}']
    function GetAt(index: Cardinal): Syndication_ISyndicationLink; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationLink; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationLink): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationLink
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationLink>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationLink>
  IVector_1__Syndication_ISyndicationLink = interface(IInspectable)
  ['{F97D4D18-DFE4-5BE5-985F-A3D702AAE02B}']
    function GetAt(index: Cardinal): Syndication_ISyndicationLink; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationLink; safecall;
    function IndexOf(value: Syndication_ISyndicationLink; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationLink); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationLink); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationLink); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationLink): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationLink); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationItem>
  IIterator_1__Syndication_ISyndicationItem_Base = interface(IInspectable)
  ['{D5692AA3-D785-5DB4-AC5C-B3832082E629}']
  end;
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationItem>
  IIterator_1__Syndication_ISyndicationItem = interface(IIterator_1__Syndication_ISyndicationItem_Base)
  ['{7E9C7811-1007-58A8-A9DF-2E2B53BBACFE}']
    function get_Current: Syndication_ISyndicationItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSyndication_ISyndicationItem): Cardinal; safecall;
    property Current: Syndication_ISyndicationItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationItem>
  IIterable_1__Syndication_ISyndicationItem_Base = interface(IInspectable)
  ['{55463EEF-ECB8-59CD-8D6B-74DAACBE7D19}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.Syndication.ISyndicationItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.Syndication.ISyndicationItem>
  IIterable_1__Syndication_ISyndicationItem = interface(IIterable_1__Syndication_ISyndicationItem_Base)
  ['{52506073-C9CC-5618-925E-BB9790457CF3}']
    function First: IIterator_1__Syndication_ISyndicationItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationItem>
  IVectorView_1__Syndication_ISyndicationItem = interface(IInspectable)
  ['{E7141A0F-787F-5BE7-A686-ADC8BDD3F378}']
    function GetAt(index: Cardinal): Syndication_ISyndicationItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Syndication_ISyndicationItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationItem>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationItem>
  IVector_1__Syndication_ISyndicationItem = interface(IInspectable)
  ['{B4E7F680-4FBE-5721-842B-20EE24F6EBE8}']
    function GetAt(index: Cardinal): Syndication_ISyndicationItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Syndication_ISyndicationItem; safecall;
    function IndexOf(value: Syndication_ISyndicationItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Syndication_ISyndicationItem); safecall;
    procedure InsertAt(index: Cardinal; value: Syndication_ISyndicationItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Syndication_ISyndicationItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSyndication_ISyndicationItem): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSyndication_ISyndicationItem); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationPerson>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationCategory>
  // Used Types:  Windows.Web.Syndication.ISyndicationGenerator
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationItem>
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationLink>
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  Windows.Web.Syndication.SyndicationFormat
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.Web.Syndication.ISyndicationFeed
  [WinRTClassNameAttribute(SSyndication_SyndicationFeed)]
  Syndication_ISyndicationFeed = interface(IInspectable)
  ['{7FFE3CD2-5B66-4D62-8403-1BC10D910D6B}']
    function get_Authors: IVector_1__Syndication_ISyndicationPerson; safecall;
    function get_Categories: IVector_1__Syndication_ISyndicationCategory; safecall;
    function get_Contributors: IVector_1__Syndication_ISyndicationPerson; safecall;
    function get_Generator: Syndication_ISyndicationGenerator; safecall;
    procedure put_Generator(value: Syndication_ISyndicationGenerator); safecall;
    function get_IconUri: IUriRuntimeClass; safecall;
    procedure put_IconUri(value: IUriRuntimeClass); safecall;
    function get_Id: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Items: IVector_1__Syndication_ISyndicationItem; safecall;
    function get_LastUpdatedTime: DateTime; safecall;
    procedure put_LastUpdatedTime(value: DateTime); safecall;
    function get_Links: IVector_1__Syndication_ISyndicationLink; safecall;
    function get_ImageUri: IUriRuntimeClass; safecall;
    procedure put_ImageUri(value: IUriRuntimeClass); safecall;
    function get_Rights: Syndication_ISyndicationText; safecall;
    procedure put_Rights(value: Syndication_ISyndicationText); safecall;
    function get_Subtitle: Syndication_ISyndicationText; safecall;
    procedure put_Subtitle(value: Syndication_ISyndicationText); safecall;
    function get_Title: Syndication_ISyndicationText; safecall;
    procedure put_Title(value: Syndication_ISyndicationText); safecall;
    function get_FirstUri: IUriRuntimeClass; safecall;
    function get_LastUri: IUriRuntimeClass; safecall;
    function get_NextUri: IUriRuntimeClass; safecall;
    function get_PreviousUri: IUriRuntimeClass; safecall;
    function get_SourceFormat: Syndication_SyndicationFormat; safecall;
    procedure Load(feed: HSTRING); safecall;
    procedure LoadFromXml(feedDocument: Xml_Dom_IXmlDocument); safecall;
    property Authors: IVector_1__Syndication_ISyndicationPerson read get_Authors;
    property Categories: IVector_1__Syndication_ISyndicationCategory read get_Categories;
    property Contributors: IVector_1__Syndication_ISyndicationPerson read get_Contributors;
    property FirstUri: IUriRuntimeClass read get_FirstUri;
    property Generator: Syndication_ISyndicationGenerator read get_Generator write put_Generator;
    property IconUri: IUriRuntimeClass read get_IconUri write put_IconUri;
    property Id: HSTRING read get_Id write put_Id;
    property ImageUri: IUriRuntimeClass read get_ImageUri write put_ImageUri;
    property Items: IVector_1__Syndication_ISyndicationItem read get_Items;
    property LastUpdatedTime: DateTime read get_LastUpdatedTime write put_LastUpdatedTime;
    property LastUri: IUriRuntimeClass read get_LastUri;
    property Links: IVector_1__Syndication_ISyndicationLink read get_Links;
    property NextUri: IUriRuntimeClass read get_NextUri;
    property PreviousUri: IUriRuntimeClass read get_PreviousUri;
    property Rights: Syndication_ISyndicationText read get_Rights write put_Rights;
    property SourceFormat: Syndication_SyndicationFormat read get_SourceFormat;
    property Subtitle: Syndication_ISyndicationText read get_Subtitle write put_Subtitle;
    property Title: Syndication_ISyndicationText read get_Title write put_Title;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationPerson>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationCategory>
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  String
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Web.Syndication.ISyndicationLink>
  // Used Types:  Windows.Web.Syndication.ISyndicationFeed
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.Web.Syndication.ISyndicationItem
  [WinRTClassNameAttribute(SSyndication_SyndicationItem)]
  Syndication_ISyndicationItem = interface(IInspectable)
  ['{548DB883-C384-45C1-8AE8-A378C4EC486C}']
    function get_Authors: IVector_1__Syndication_ISyndicationPerson; safecall;
    function get_Categories: IVector_1__Syndication_ISyndicationCategory; safecall;
    function get_Contributors: IVector_1__Syndication_ISyndicationPerson; safecall;
    function get_Content: Syndication_ISyndicationText; safecall;
    procedure put_Content(value: Syndication_ISyndicationText); safecall;
    function get_Id: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_LastUpdatedTime: DateTime; safecall;
    procedure put_LastUpdatedTime(value: DateTime); safecall;
    function get_Links: IVector_1__Syndication_ISyndicationLink; safecall;
    function get_PublishedDate: DateTime; safecall;
    procedure put_PublishedDate(value: DateTime); safecall;
    function get_Rights: Syndication_ISyndicationText; safecall;
    procedure put_Rights(value: Syndication_ISyndicationText); safecall;
    function get_Source: Syndication_ISyndicationFeed; safecall;
    procedure put_Source(value: Syndication_ISyndicationFeed); safecall;
    function get_Summary: Syndication_ISyndicationText; safecall;
    procedure put_Summary(value: Syndication_ISyndicationText); safecall;
    function get_Title: Syndication_ISyndicationText; safecall;
    procedure put_Title(value: Syndication_ISyndicationText); safecall;
    function get_CommentsUri: IUriRuntimeClass; safecall;
    procedure put_CommentsUri(value: IUriRuntimeClass); safecall;
    function get_EditUri: IUriRuntimeClass; safecall;
    function get_EditMediaUri: IUriRuntimeClass; safecall;
    function get_ETag: HSTRING; safecall;
    function get_ItemUri: IUriRuntimeClass; safecall;
    procedure Load(item: HSTRING); safecall;
    procedure LoadFromXml(itemDocument: Xml_Dom_IXmlDocument); safecall;
    property Authors: IVector_1__Syndication_ISyndicationPerson read get_Authors;
    property Categories: IVector_1__Syndication_ISyndicationCategory read get_Categories;
    property CommentsUri: IUriRuntimeClass read get_CommentsUri write put_CommentsUri;
    property Content: Syndication_ISyndicationText read get_Content write put_Content;
    property Contributors: IVector_1__Syndication_ISyndicationPerson read get_Contributors;
    property ETag: HSTRING read get_ETag;
    property EditMediaUri: IUriRuntimeClass read get_EditMediaUri;
    property EditUri: IUriRuntimeClass read get_EditUri;
    property Id: HSTRING read get_Id write put_Id;
    property ItemUri: IUriRuntimeClass read get_ItemUri;
    property LastUpdatedTime: DateTime read get_LastUpdatedTime write put_LastUpdatedTime;
    property Links: IVector_1__Syndication_ISyndicationLink read get_Links;
    property PublishedDate: DateTime read get_PublishedDate write put_PublishedDate;
    property Rights: Syndication_ISyndicationText read get_Rights write put_Rights;
    property Source: Syndication_ISyndicationFeed read get_Source write put_Source;
    property Summary: Syndication_ISyndicationText read get_Summary write put_Summary;
    property Title: Syndication_ISyndicationText read get_Title write put_Title;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  // Used Types:  String
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationItemFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationItem)]
  Syndication_ISyndicationItemFactory = interface(IInspectable)
  ['{251D434F-7DB8-487A-85E4-10D191E66EBB}']
    function CreateSyndicationItem(title: HSTRING; content: Syndication_ISyndicationText; uri: IUriRuntimeClass): Syndication_ISyndicationItem; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationFeed
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationFeedFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationFeed)]
  Syndication_ISyndicationFeedFactory = interface(IInspectable)
  ['{23472232-8BE9-48B7-8934-6205131D9357}']
    function CreateSyndicationFeed(title: HSTRING; subtitle: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationFeed; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{1017BBE0-9D10-543E-8F03-885122A082F3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.RetrievalProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface(AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Delegate_Base)
  ['{6BBAA6FB-5C28-5D4E-BA85-F3B521BC136E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress; progressInfo: Syndication_RetrievalProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{0E3D7F70-4E8C-5260-A7E5-786E05BDED99}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Delegate_Base)
  ['{CEE2FF7E-9996-5941-970E-ECE3FE740274}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Base = interface(IInspectable)
  ['{92EAF151-415E-5F87-8095-781623C88998}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.ISyndicationFeed
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress = interface(IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress_Base)
  ['{06171284-D4E1-545D-B77B-124FB0FA6D5E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress; safecall;
    function GetResults: Syndication_ISyndicationFeed; safecall;
    property Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationFeed,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Web.Syndication.ISyndicationClient
  [WinRTClassNameAttribute(SSyndication_SyndicationClient)]
  Syndication_ISyndicationClient = interface(IInspectable)
  ['{9E18A9B7-7249-4B45-B229-7DF895A5A1F5}']
    function get_ServerCredential: IPasswordCredential; safecall;
    procedure put_ServerCredential(value: IPasswordCredential); safecall;
    function get_ProxyCredential: IPasswordCredential; safecall;
    procedure put_ProxyCredential(value: IPasswordCredential); safecall;
    function get_MaxResponseBufferSize: Cardinal; safecall;
    procedure put_MaxResponseBufferSize(value: Cardinal); safecall;
    function get_Timeout: Cardinal; safecall;
    procedure put_Timeout(value: Cardinal); safecall;
    function get_BypassCacheOnRetrieve: Boolean; safecall;
    procedure put_BypassCacheOnRetrieve(value: Boolean); safecall;
    procedure SetRequestHeader(name: HSTRING; value: HSTRING); safecall;
    function RetrieveFeedAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__Syndication_ISyndicationFeed__Syndication_RetrievalProgress; safecall;
    property BypassCacheOnRetrieve: Boolean read get_BypassCacheOnRetrieve write put_BypassCacheOnRetrieve;
    property MaxResponseBufferSize: Cardinal read get_MaxResponseBufferSize write put_MaxResponseBufferSize;
    property ProxyCredential: IPasswordCredential read get_ProxyCredential write put_ProxyCredential;
    property ServerCredential: IPasswordCredential read get_ServerCredential write put_ServerCredential;
    property Timeout: Cardinal read get_Timeout write put_Timeout;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationClient
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  }
  // Windows.Web.Syndication.ISyndicationClientFactory
  [WinRTClassNameAttribute(SSyndication_SyndicationClient)]
  Syndication_ISyndicationClientFactory = interface(IInspectable)
  ['{2EC4B32C-A79B-4114-B29A-05DFFBAFB9A4}']
    function CreateSyndicationClient(serverCredential: IPasswordCredential): Syndication_ISyndicationClient; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.SyndicationErrorStatus
  // Used Types:  Int32
  }
  // Windows.Web.Syndication.ISyndicationErrorStatics
  [WinRTClassNameAttribute(SSyndication_SyndicationError)]
  Syndication_ISyndicationErrorStatics = interface(IInspectable)
  ['{1FBB2361-45C7-4833-8AA0-BE5F3B58A7F4}']
    function GetStatus(hresult: Integer): Syndication_SyndicationErrorStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.Syndication.ISyndicationCategory>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Web.AtomPub.IResourceCollection
  [WinRTClassNameAttribute(SAtomPub_ResourceCollection)]
  AtomPub_IResourceCollection = interface(IInspectable)
  ['{7F5FD609-BC88-41D4-88FA-3DE6704D428E}']
    function get_Title: Syndication_ISyndicationText; safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    function get_Categories: IVectorView_1__Syndication_ISyndicationCategory; safecall;
    function get_Accepts: IVectorView_1__HSTRING; safecall;
    property Accepts: IVectorView_1__HSTRING read get_Accepts;
    property Categories: IVectorView_1__Syndication_ISyndicationCategory read get_Categories;
    property Title: Syndication_ISyndicationText read get_Title;
    property Uri: IUriRuntimeClass read get_Uri;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IResourceCollection>
  IIterator_1__AtomPub_IResourceCollection_Base = interface(IInspectable)
  ['{2B175876-0920-52F0-80BF-DFE79744128D}']
  end;
  {
  // Used Types:  Windows.Web.AtomPub.IResourceCollection
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IResourceCollection>
  IIterator_1__AtomPub_IResourceCollection = interface(IIterator_1__AtomPub_IResourceCollection_Base)
  ['{2C3CD384-F0EA-5744-B55C-786D03796630}']
    function get_Current: AtomPub_IResourceCollection; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAtomPub_IResourceCollection): Cardinal; safecall;
    property Current: AtomPub_IResourceCollection read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IResourceCollection>
  IIterable_1__AtomPub_IResourceCollection_Base = interface(IInspectable)
  ['{D4372A2D-7AB0-5D8E-BD5C-6E9C0A67A8D8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IResourceCollection>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IResourceCollection>
  IIterable_1__AtomPub_IResourceCollection = interface(IIterable_1__AtomPub_IResourceCollection_Base)
  ['{82AF2E63-9EA4-5986-BA8D-6B5BDA64C2CE}']
    function First: IIterator_1__AtomPub_IResourceCollection; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.AtomPub.IResourceCollection
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IResourceCollection>
  IVectorView_1__AtomPub_IResourceCollection = interface(IInspectable)
  ['{1C7AC147-BF75-5084-99B0-043C64966DA0}']
    function GetAt(index: Cardinal): AtomPub_IResourceCollection; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AtomPub_IResourceCollection; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAtomPub_IResourceCollection): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Syndication.ISyndicationText
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IResourceCollection>
  }
  // Windows.Web.AtomPub.IWorkspace
  [WinRTClassNameAttribute(SAtomPub_Workspace)]
  AtomPub_IWorkspace = interface(IInspectable)
  ['{B41DA63B-A4B8-4036-89C5-83C31266BA49}']
    function get_Title: Syndication_ISyndicationText; safecall;
    function get_Collections: IVectorView_1__AtomPub_IResourceCollection; safecall;
    property Collections: IVectorView_1__AtomPub_IResourceCollection read get_Collections;
    property Title: Syndication_ISyndicationText read get_Title;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IWorkspace>
  IIterator_1__AtomPub_IWorkspace_Base = interface(IInspectable)
  ['{0CC8C426-D68A-5136-9741-DE326764CA32}']
  end;
  {
  // Used Types:  Windows.Web.AtomPub.IWorkspace
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IWorkspace>
  IIterator_1__AtomPub_IWorkspace = interface(IIterator_1__AtomPub_IWorkspace_Base)
  ['{0D0B65E8-5680-5085-AB9E-AF1A7BFC9CEF}']
    function get_Current: AtomPub_IWorkspace; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAtomPub_IWorkspace): Cardinal; safecall;
    property Current: AtomPub_IWorkspace read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IWorkspace>
  IIterable_1__AtomPub_IWorkspace_Base = interface(IInspectable)
  ['{F02D0EBE-EAC2-502F-9836-1C5482333BFE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Web.AtomPub.IWorkspace>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Web.AtomPub.IWorkspace>
  IIterable_1__AtomPub_IWorkspace = interface(IIterable_1__AtomPub_IWorkspace_Base)
  ['{21810C7F-89FD-50E7-95BA-0A8FA703FE77}']
    function First: IIterator_1__AtomPub_IWorkspace; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.AtomPub.IWorkspace
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IWorkspace>
  IVectorView_1__AtomPub_IWorkspace = interface(IInspectable)
  ['{22BF3BE7-AE21-53B1-8C19-7E6EACF5B6D7}']
    function GetAt(index: Cardinal): AtomPub_IWorkspace; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AtomPub_IWorkspace; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAtomPub_IWorkspace): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Web.AtomPub.IWorkspace>
  }
  // Windows.Web.AtomPub.IServiceDocument
  [WinRTClassNameAttribute(SAtomPub_ServiceDocument)]
  AtomPub_IServiceDocument = interface(IInspectable)
  ['{8B7EC771-2AB3-4DBE-8BCC-778F92B75E51}']
    function get_Workspaces: IVectorView_1__AtomPub_IWorkspace; safecall;
    property Workspaces: IVectorView_1__AtomPub_IWorkspace read get_Workspaces;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{DD2A6D54-55AA-5D09-B790-9520D4EB4F19}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.RetrievalProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface(AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Delegate_Base)
  ['{16BD9C58-BC2E-5919-9761-A0C4EDA09E5C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress; progressInfo: Syndication_RetrievalProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{5F03B1D3-470D-5BE7-8176-1C9A46010900}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface(AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Delegate_Base)
  ['{C632EA30-7B86-500B-AD9D-EA17CB4FA4CC}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Base = interface(IInspectable)
  ['{DA07ABF4-91FA-5C96-84CB-459EA97B934D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.AtomPub.IServiceDocument
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress = interface(IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress_Base)
  ['{9F53E55D-8049-5D65-A406-122203A563B5}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress; safecall;
    function GetResults: AtomPub_IServiceDocument; safecall;
    property Progress: AsyncOperationProgressHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{6136B327-4152-54E3-AA34-38A0C121DC4D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.RetrievalProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress = interface(AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress_Delegate_Base)
  ['{762108C6-97D2-5C35-A696-BC328A160CC6}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress; progressInfo: Syndication_RetrievalProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{76772EC1-C26F-5F6E-8D3B-8314107CEFEB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress = interface(AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress_Delegate_Base)
  ['{7855EC87-CE8B-5FAD-9B25-74C6C5D0D45E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress_Base = interface(IInspectable)
  ['{F71CFF65-E737-5345-B38F-FD445D2DC7E2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress = interface(IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress_Base)
  ['{C4231403-5E6A-57BC-B936-3B4BFD933A33}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__Syndication_RetrievalProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__Syndication_RetrievalProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{B670D335-E83B-58B1-AD7B-840396085C65}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.RetrievalProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface(AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Delegate_Base)
  ['{BEBEA3ED-7801-5BEF-B4E9-7B4734EDC79A}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress; progressInfo: Syndication_RetrievalProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Delegate_Base = interface(IUnknown)
  ['{9DE7422B-4BC3-5546-87B8-2EEBFD60BE48}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Delegate_Base)
  ['{BCC71114-5715-55A3-A6C8-A9ABD461BF2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Base = interface(IInspectable)
  ['{44FA5A15-1204-521C-85E5-01259301D527}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress = interface(IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress_Base)
  ['{2232A74A-682F-52EB-9ED5-D05012CEA69A}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress; safecall;
    function GetResults: Syndication_ISyndicationItem; safecall;
    property Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Delegate_Base = interface(IUnknown)
  ['{1FFB57B2-D2DE-5559-8DE2-50109C63539B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Web.Syndication.TransferProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface(AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Delegate_Base)
  ['{BEBEA3ED-7801-5BEF-B4E9-7B4734EDC79A}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress; progressInfo: Syndication_TransferProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Delegate_Base = interface(IUnknown)
  ['{8A796EA9-FF95-50EF-93EA-711BF7946473}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Delegate_Base)
  ['{BCC71114-5715-55A3-A6C8-A9ABD461BF2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Base = interface(IInspectable)
  ['{E57D0717-27C0-561E-B4B3-72AA2B1E3FC9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress = interface(IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress_Base)
  ['{2232A74A-682F-52EB-9ED5-D05012CEA69A}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress; safecall;
    function GetResults: Syndication_ISyndicationItem; safecall;
    property Progress: AsyncOperationProgressHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Syndication_ISyndicationItem__Syndication_TransferProgress read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionProgressHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionProgressHandler_1__Syndication_TransferProgress_Delegate_Base = interface(IUnknown)
  ['{C1610085-94D0-5706-9AC6-10179D7DEB92}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Web.Syndication.TransferProgress
  }
  // Windows.Foundation.AsyncActionProgressHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionProgressHandler_1__Syndication_TransferProgress = interface(AsyncActionProgressHandler_1__Syndication_TransferProgress_Delegate_Base)
  ['{657A3FC8-2BA5-53E0-B1BB-8A6843C437FF}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Syndication_TransferProgress; progressInfo: Syndication_TransferProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress_Delegate_Base = interface(IUnknown)
  ['{F1C031C8-90BF-5CAE-ADF6-155B4AEDFB60}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Windows.Web.Syndication.TransferProgress>
  AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress = interface(AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress_Delegate_Base)
  ['{70B8BCF5-0B59-5479-9BB5-1ADC2770894D}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Syndication_TransferProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncActionProgressHandler`1<Windows.Web.Syndication.TransferProgress>
  // Used Types:  Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Windows.Web.Syndication.TransferProgress>
  }
  // Windows.Foundation.IAsyncActionWithProgress`1<Windows.Web.Syndication.TransferProgress>
  IAsyncActionWithProgress_1__Syndication_TransferProgress = interface(IInspectable)
  ['{661278A4-FCBD-5A6F-A09B-192B7B8AAC76}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__Syndication_TransferProgress); safecall;
    function get_Progress: AsyncActionProgressHandler_1__Syndication_TransferProgress; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__Syndication_TransferProgress read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__Syndication_TransferProgress read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.AtomPub.IServiceDocument,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.RetrievalProgress>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Web.Syndication.ISyndicationItem,Windows.Web.Syndication.TransferProgress>
  // Used Types:  String
  // Used Types:  Windows.Web.Syndication.ISyndicationItem
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Windows.Web.Syndication.TransferProgress>
  }
  // Windows.Web.AtomPub.IAtomPubClient
  [WinRTClassNameAttribute(SAtomPub_AtomPubClient)]
  AtomPub_IAtomPubClient = interface(IInspectable)
  ['{35392C38-CDED-4D4C-9637-05F15C1C9406}']
    function RetrieveServiceDocumentAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__AtomPub_IServiceDocument__Syndication_RetrievalProgress; safecall;
    function RetrieveMediaResourceAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__IInputStream__Syndication_RetrievalProgress; safecall;
    function RetrieveResourceAsync(uri: IUriRuntimeClass): IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_RetrievalProgress; safecall;
    function CreateResourceAsync(uri: IUriRuntimeClass; description: HSTRING; item: Syndication_ISyndicationItem): IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress; safecall;
    function CreateMediaResourceAsync(uri: IUriRuntimeClass; mediaType: HSTRING; description: HSTRING; mediaStream: IInputStream): IAsyncOperationWithProgress_2__Syndication_ISyndicationItem__Syndication_TransferProgress; safecall;
    function UpdateMediaResourceAsync(uri: IUriRuntimeClass; mediaType: HSTRING; mediaStream: IInputStream): IAsyncActionWithProgress_1__Syndication_TransferProgress; safecall;
    function UpdateResourceAsync(uri: IUriRuntimeClass; item: Syndication_ISyndicationItem): IAsyncActionWithProgress_1__Syndication_TransferProgress; safecall;
    function UpdateResourceItemAsync(item: Syndication_ISyndicationItem): IAsyncActionWithProgress_1__Syndication_TransferProgress; safecall;
    function DeleteResourceAsync(uri: IUriRuntimeClass): IAsyncActionWithProgress_1__Syndication_TransferProgress; safecall;
    function DeleteResourceItemAsync(item: Syndication_ISyndicationItem): IAsyncActionWithProgress_1__Syndication_TransferProgress; safecall;
    procedure CancelAsyncOperations; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.AtomPub.IAtomPubClient
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  }
  // Windows.Web.AtomPub.IAtomPubClientFactory
  [WinRTClassNameAttribute(SAtomPub_AtomPubClient)]
  AtomPub_IAtomPubClientFactory = interface(IInspectable)
  ['{49D55012-57CB-4BDE-AB9F-2610B172777B}']
    function CreateAtomPubClientWithCredentials(serverCredential: IPasswordCredential): AtomPub_IAtomPubClient; safecall;
  end;


  // Emit Forwarded classes
  // Windows.Web.Http.HttpRequestMessage
  // DualAPI
  // Implements: Windows.Web.Http.IHttpRequestMessage
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpRequestMessageFactory"
  // Instantiable: "Http_IHttpRequestMessage"
  THttp_HttpRequestMessage = class(TWinRTGenericImportFI<Http_IHttpRequestMessageFactory, Http_IHttpRequestMessage>)
  public
    // -> Http_IHttpRequestMessageFactory
    class function Create(method: Http_IHttpMethod; uri: IUriRuntimeClass): Http_IHttpRequestMessage; overload; static; inline;
  end;

  // Windows.Web.Http.HttpResponseMessage
  // DualAPI
  // Implements: Windows.Web.Http.IHttpResponseMessage
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpResponseMessageFactory"
  // Instantiable: "Http_IHttpResponseMessage"
  THttp_HttpResponseMessage = class(TWinRTGenericImportFI<Http_IHttpResponseMessageFactory, Http_IHttpResponseMessage>)
  public
    // -> Http_IHttpResponseMessageFactory
    class function Create(statusCode: Http_HttpStatusCode): Http_IHttpResponseMessage; overload; static; inline;
  end;

  // Windows.Web.Http.HttpClient
  // DualAPI
  // Implements: Windows.Web.Http.IHttpClient
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpClientFactory"
  // Instantiable: "Http_IHttpClient"
  THttp_HttpClient = class(TWinRTGenericImportFI<Http_IHttpClientFactory, Http_IHttpClient>)
  public
    // -> Http_IHttpClientFactory
    class function Create(filter: Http_Filters_IHttpFilter): Http_IHttpClient; overload; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpContentHeaderCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentHeaderCollection
  // Implements: Windows.Foundation.Collections.IMap`2<String,String>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // Implements: Windows.Foundation.IStringable
  // Instantiable: "Http_Headers_IHttpContentHeaderCollection"
  THttp_Headers_HttpContentHeaderCollection = class(TWinRTGenericImportI<Http_Headers_IHttpContentHeaderCollection>) end;

  // Windows.Web.Http.Headers.HttpRequestHeaderCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpRequestHeaderCollection
  // Implements: Windows.Foundation.Collections.IMap`2<String,String>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.HttpCookie
  // DualAPI
  // Implements: Windows.Web.Http.IHttpCookie
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpCookieFactory"
  THttp_HttpCookie = class(TWinRTGenericImportF<Http_IHttpCookieFactory>)
  public
    // -> Http_IHttpCookieFactory
    class function Create(name: HSTRING; domain: HSTRING; path: HSTRING): Http_IHttpCookie; static; inline;
  end;

  // Windows.Web.Http.HttpCookieCollection
  // DualAPI
  // Implements: Windows.Foundation.Collections.IVectorView`1<Windows.Web.Http.IHttpCookie>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpCookie>

  // Windows.Web.Http.HttpMethod
  // DualAPI
  // Implements: Windows.Web.Http.IHttpMethod
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.IHttpMethodStatics"
  // Factory: "Windows.Web.Http.IHttpMethodFactory"
  THttp_HttpMethod = class(TWinRTGenericImportFS<Http_IHttpMethodFactory, Http_IHttpMethodStatics>)
  public
    // -> Http_IHttpMethodStatics
    class function get_Delete: Http_IHttpMethod; static; inline;
    class function get_Get: Http_IHttpMethod; static; inline;
    class function get_Head: Http_IHttpMethod; static; inline;
    class function get_Options: Http_IHttpMethod; static; inline;
    class function get_Patch: Http_IHttpMethod; static; inline;
    class function get_Post: Http_IHttpMethod; static; inline;
    class function get_Put: Http_IHttpMethod; static; inline;
    class property Delete: Http_IHttpMethod read get_Delete;
    class property Get: Http_IHttpMethod read get_Get;
    class property Head: Http_IHttpMethod read get_Head;
    class property Options: Http_IHttpMethod read get_Options;
    class property Patch: Http_IHttpMethod read get_Patch;
    class property Post: Http_IHttpMethod read get_Post;
    class property Put: Http_IHttpMethod read get_Put;

    // -> Http_IHttpMethodFactory
    class function Create(method: HSTRING): Http_IHttpMethod; static; inline;
  end;

  // Windows.Web.Http.HttpTransportInformation
  // DualAPI
  // Implements: Windows.Web.Http.IHttpTransportInformation
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpResponseHeaderCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpResponseHeaderCollection
  // Implements: Windows.Foundation.Collections.IMap`2<String,String>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.HttpStringContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpStringContentFactory"
  THttp_HttpStringContent = class(TWinRTGenericImportF<Http_IHttpStringContentFactory>)
  public
    // -> Http_IHttpStringContentFactory
    class function CreateFromString(content: HSTRING): Http_IHttpContent; static; inline;
    class function CreateFromStringWithEncoding(content: HSTRING; encoding: UnicodeEncoding): Http_IHttpContent; static; inline;
    class function CreateFromStringWithEncodingAndMediaType(content: HSTRING; encoding: UnicodeEncoding; mediaType: HSTRING): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpBufferContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpBufferContentFactory"
  THttp_HttpBufferContent = class(TWinRTGenericImportF<Http_IHttpBufferContentFactory>)
  public
    // -> Http_IHttpBufferContentFactory
    class function CreateFromBuffer(content: IBuffer): Http_IHttpContent; static; inline;
    class function CreateFromBufferWithOffset(content: IBuffer; offset: Cardinal; count: Cardinal): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpStreamContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpStreamContentFactory"
  THttp_HttpStreamContent = class(TWinRTGenericImportF<Http_IHttpStreamContentFactory>)
  public
    // -> Http_IHttpStreamContentFactory
    class function CreateFromInputStream(content: IInputStream): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpFormUrlEncodedContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpFormUrlEncodedContentFactory"
  THttp_HttpFormUrlEncodedContent = class(TWinRTGenericImportF<Http_IHttpFormUrlEncodedContentFactory>)
  public
    // -> Http_IHttpFormUrlEncodedContentFactory
    class function Create(content: IIterable_1__IKeyValuePair_2__HSTRING__HSTRING): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpMultipartContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Web.Http.IHttpMultipartContent
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpContent>
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpMultipartContentFactory"
  // Instantiable: "Http_IHttpMultipartContent"
  THttp_HttpMultipartContent = class(TWinRTGenericImportFI<Http_IHttpMultipartContentFactory, Http_IHttpMultipartContent>)
  public
    // -> Http_IHttpMultipartContentFactory
    class function CreateWithSubtype(subtype: HSTRING): Http_IHttpContent; static; inline;
    class function CreateWithSubtypeAndBoundary(subtype: HSTRING; boundary: HSTRING): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpMultipartFormDataContent
  // DualAPI
  // Implements: Windows.Web.Http.IHttpContent
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Web.Http.IHttpMultipartFormDataContent
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpContent>
  // Implements: Windows.Foundation.IStringable
  // Factory: "Windows.Web.Http.IHttpMultipartFormDataContentFactory"
  // Instantiable: "Http_IHttpMultipartFormDataContent"
  THttp_HttpMultipartFormDataContent = class(TWinRTGenericImportFI<Http_IHttpMultipartFormDataContentFactory, Http_IHttpMultipartFormDataContent>)
  public
    // -> Http_IHttpMultipartFormDataContentFactory
    class function CreateWithBoundary(boundary: HSTRING): Http_IHttpContent; static; inline;
  end;

  // Windows.Web.Http.HttpCookieManager
  // DualAPI
  // Implements: Windows.Web.Http.IHttpCookieManager

  // Windows.Web.Http.Filters.HttpCacheControl
  // DualAPI
  // Implements: Windows.Web.Http.Filters.IHttpCacheControl

  // Windows.Web.Http.Filters.HttpBaseProtocolFilter
  // DualAPI
  // Implements: Windows.Web.Http.Filters.IHttpBaseProtocolFilter
  // Implements: Windows.Web.Http.Filters.IHttpFilter
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Web.Http.Filters.IHttpBaseProtocolFilter2
  // Implements: Windows.Web.Http.Filters.IHttpBaseProtocolFilter3
  // Implements: Windows.Web.Http.Filters.IHttpBaseProtocolFilter4
  // Instantiable: "Http_Filters_IHttpBaseProtocolFilter"
  THttp_Filters_HttpBaseProtocolFilter = class(TWinRTGenericImportI<Http_Filters_IHttpBaseProtocolFilter>) end;

  // Windows.Web.Http.Filters.HttpServerCustomValidationRequestedEventArgs
  // DualAPI
  // Implements: Windows.Web.Http.Filters.IHttpServerCustomValidationRequestedEventArgs

  // Windows.Web.Http.Headers.HttpContentDispositionHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentDispositionHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueFactory"
  THttp_Headers_HttpContentDispositionHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpContentDispositionHeaderValueFactory, Http_Headers_IHttpContentDispositionHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpContentDispositionHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out contentDispositionHeaderValue: Http_Headers_IHttpContentDispositionHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpContentDispositionHeaderValueFactory
    class function Create(dispositionType: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpContentCodingHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentCodingHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpLanguageHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpLanguageHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Globalization.ILanguage>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Globalization.ILanguage>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpContentRangeHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentRangeHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpContentRangeHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory"
  THttp_Headers_HttpContentRangeHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpContentRangeHeaderValueFactory, Http_Headers_IHttpContentRangeHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpContentRangeHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpContentRangeHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out contentRangeHeaderValue: Http_Headers_IHttpContentRangeHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpContentRangeHeaderValueFactory
    class function CreateFromLength(length: UInt64): Http_Headers_IHttpContentRangeHeaderValue; static; inline;
    class function CreateFromRange(from: UInt64; &to: UInt64): Http_Headers_IHttpContentRangeHeaderValue; static; inline;
    class function CreateFromRangeWithLength(from: UInt64; &to: UInt64; length: UInt64): Http_Headers_IHttpContentRangeHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpMediaTypeHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpMediaTypeHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueFactory"
  THttp_Headers_HttpMediaTypeHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpMediaTypeHeaderValueFactory, Http_Headers_IHttpMediaTypeHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpMediaTypeHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out mediaTypeHeaderValue: Http_Headers_IHttpMediaTypeHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpMediaTypeHeaderValueFactory
    class function Create(mediaType: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpCredentialsHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpCredentialsHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpCredentialsHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory"
  THttp_Headers_HttpCredentialsHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpCredentialsHeaderValueFactory, Http_Headers_IHttpCredentialsHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpCredentialsHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out credentialsHeaderValue: Http_Headers_IHttpCredentialsHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpCredentialsHeaderValueFactory
    class function CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; static; inline;
    class function CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpCredentialsHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpCacheDirectiveHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpCacheDirectiveHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpNameValueHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpConnectionOptionHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpCookiePairHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpCookiePairHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpCookiePairHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpExpectationHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpExpectationHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpExpectationHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpTransferCodingHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpProductInfoHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpProductInfoHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpProductInfoHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpMethodHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpMethodHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.IHttpMethod>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.IHttpMethod>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpChallengeHeaderValueCollection
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpChallengeHeaderValueCollection
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Web.Http.Headers.IHttpChallengeHeaderValue>
  // Implements: Windows.Foundation.IStringable

  // Windows.Web.Http.Headers.HttpDateOrDeltaHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpDateOrDeltaHeaderValueStatics"
  THttp_Headers_HttpDateOrDeltaHeaderValue = class(TWinRTGenericImportS<Http_Headers_IHttpDateOrDeltaHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpDateOrDeltaHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpDateOrDeltaHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out dateOrDeltaHeaderValue: Http_Headers_IHttpDateOrDeltaHeaderValue): Boolean; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpNameValueHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpNameValueHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpNameValueHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory"
  THttp_Headers_HttpNameValueHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpNameValueHeaderValueFactory, Http_Headers_IHttpNameValueHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpNameValueHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpNameValueHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out nameValueHeaderValue: Http_Headers_IHttpNameValueHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpNameValueHeaderValueFactory
    class function CreateFromName(name: HSTRING): Http_Headers_IHttpNameValueHeaderValue; static; inline;
    class function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpNameValueHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpChallengeHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpChallengeHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpChallengeHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory"
  THttp_Headers_HttpChallengeHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpChallengeHeaderValueFactory, Http_Headers_IHttpChallengeHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpChallengeHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpChallengeHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out challengeHeaderValue: Http_Headers_IHttpChallengeHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpChallengeHeaderValueFactory
    class function CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpChallengeHeaderValue; static; inline;
    class function CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpChallengeHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpConnectionOptionHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueFactory"
  THttp_Headers_HttpConnectionOptionHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpConnectionOptionHeaderValueFactory, Http_Headers_IHttpConnectionOptionHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpConnectionOptionHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out connectionOptionHeaderValue: Http_Headers_IHttpConnectionOptionHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpConnectionOptionHeaderValueFactory
    class function Create(token: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpContentCodingHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentCodingHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpContentCodingHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpContentCodingHeaderValueFactory"
  THttp_Headers_HttpContentCodingHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpContentCodingHeaderValueFactory, Http_Headers_IHttpContentCodingHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpContentCodingHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpContentCodingHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out contentCodingHeaderValue: Http_Headers_IHttpContentCodingHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpContentCodingHeaderValueFactory
    class function Create(contentCoding: HSTRING): Http_Headers_IHttpContentCodingHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpCookiePairHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpCookiePairHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpCookiePairHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory"
  THttp_Headers_HttpCookiePairHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpCookiePairHeaderValueFactory, Http_Headers_IHttpCookiePairHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpCookiePairHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out cookiePairHeaderValue: Http_Headers_IHttpCookiePairHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpCookiePairHeaderValueFactory
    class function CreateFromName(name: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; static; inline;
    class function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpCookiePairHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpExpectationHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpExpectationHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpExpectationHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory"
  THttp_Headers_HttpExpectationHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpExpectationHeaderValueFactory, Http_Headers_IHttpExpectationHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpExpectationHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpExpectationHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out expectationHeaderValue: Http_Headers_IHttpExpectationHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpExpectationHeaderValueFactory
    class function CreateFromName(name: HSTRING): Http_Headers_IHttpExpectationHeaderValue; static; inline;
    class function CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpExpectationHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpLanguageRangeWithQualityHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory"
  THttp_Headers_HttpLanguageRangeWithQualityHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory, Http_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpLanguageRangeWithQualityHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out languageRangeWithQualityHeaderValue: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory
    class function CreateFromLanguageRange(languageRange: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; static; inline;
    class function CreateFromLanguageRangeWithQuality(languageRange: HSTRING; quality: Double): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpMediaTypeWithQualityHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory"
  THttp_Headers_HttpMediaTypeWithQualityHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory, Http_Headers_IHttpMediaTypeWithQualityHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpMediaTypeWithQualityHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out mediaTypeWithQualityHeaderValue: Http_Headers_IHttpMediaTypeWithQualityHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory
    class function CreateFromMediaType(mediaType: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; static; inline;
    class function CreateFromMediaTypeWithQuality(mediaType: HSTRING; quality: Double): Http_Headers_IHttpMediaTypeWithQualityHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpProductHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpProductHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpProductHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpProductHeaderValueFactory"
  THttp_Headers_HttpProductHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpProductHeaderValueFactory, Http_Headers_IHttpProductHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpProductHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpProductHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out productHeaderValue: Http_Headers_IHttpProductHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpProductHeaderValueFactory
    class function CreateFromName(productName: HSTRING): Http_Headers_IHttpProductHeaderValue; static; inline;
    class function CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpProductInfoHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpProductInfoHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpProductInfoHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory"
  THttp_Headers_HttpProductInfoHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpProductInfoHeaderValueFactory, Http_Headers_IHttpProductInfoHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpProductInfoHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out productInfoHeaderValue: Http_Headers_IHttpProductInfoHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpProductInfoHeaderValueFactory
    class function CreateFromComment(productComment: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; static; inline;
    class function CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductInfoHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpContentCodingWithQualityHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory"
  THttp_Headers_HttpContentCodingWithQualityHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory, Http_Headers_IHttpContentCodingWithQualityHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpContentCodingWithQualityHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out contentCodingWithQualityHeaderValue: Http_Headers_IHttpContentCodingWithQualityHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory
    class function CreateFromValue(contentCoding: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue; static; inline;
    class function CreateFromValueWithQuality(contentCoding: HSTRING; quality: Double): Http_Headers_IHttpContentCodingWithQualityHeaderValue; static; inline;
  end;

  // Windows.Web.Http.Headers.HttpTransferCodingHeaderValue
  // DualAPI
  // Implements: Windows.Web.Http.Headers.IHttpTransferCodingHeaderValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueStatics"
  // Factory: "Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueFactory"
  THttp_Headers_HttpTransferCodingHeaderValue = class(TWinRTGenericImportFS<Http_Headers_IHttpTransferCodingHeaderValueFactory, Http_Headers_IHttpTransferCodingHeaderValueStatics>)
  public
    // -> Http_Headers_IHttpTransferCodingHeaderValueStatics
    class function Parse(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue; static; inline;
    class function TryParse(input: HSTRING; out transferCodingHeaderValue: Http_Headers_IHttpTransferCodingHeaderValue): Boolean; static; inline;

    // -> Http_Headers_IHttpTransferCodingHeaderValueFactory
    class function Create(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue; static; inline;
  end;

  // Windows.Web.WebError
  // DualAPI
  // Statics: "Windows.Web.IWebErrorStatics"
  TWebError = class(TWinRTGenericImportS<IWebErrorStatics>)
  public
    // -> IWebErrorStatics
    class function GetStatus(hresult: Integer): WebErrorStatus; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationAttribute
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationAttribute
  // Factory: "Windows.Web.Syndication.ISyndicationAttributeFactory"
  // Instantiable: "Syndication_ISyndicationAttribute"
  TSyndication_SyndicationAttribute = class(TWinRTGenericImportFI<Syndication_ISyndicationAttributeFactory, Syndication_ISyndicationAttribute>)
  public
    // -> Syndication_ISyndicationAttributeFactory
    class function CreateSyndicationAttribute(attributeName: HSTRING; attributeNamespace: HSTRING; attributeValue: HSTRING): Syndication_ISyndicationAttribute; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationNode
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationNodeFactory"
  // Instantiable: "Syndication_ISyndicationNode"
  TSyndication_SyndicationNode = class(TWinRTGenericImportFI<Syndication_ISyndicationNodeFactory, Syndication_ISyndicationNode>)
  public
    // -> Syndication_ISyndicationNodeFactory
    class function CreateSyndicationNode(nodeName: HSTRING; nodeNamespace: HSTRING; nodeValue: HSTRING): Syndication_ISyndicationNode; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationGenerator
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationGenerator
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationGeneratorFactory"
  // Instantiable: "Syndication_ISyndicationGenerator"
  TSyndication_SyndicationGenerator = class(TWinRTGenericImportFI<Syndication_ISyndicationGeneratorFactory, Syndication_ISyndicationGenerator>)
  public
    // -> Syndication_ISyndicationGeneratorFactory
    class function CreateSyndicationGenerator(text: HSTRING): Syndication_ISyndicationGenerator; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationText
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationText
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationTextFactory"
  // Instantiable: "Syndication_ISyndicationText"
  TSyndication_SyndicationText = class(TWinRTGenericImportFI<Syndication_ISyndicationTextFactory, Syndication_ISyndicationText>)
  public
    // -> Syndication_ISyndicationTextFactory
    class function CreateSyndicationText(text: HSTRING): Syndication_ISyndicationText; static; inline;
    class function CreateSyndicationTextEx(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationContent
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationText
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Implements: Windows.Web.Syndication.ISyndicationContent
  // Factory: "Windows.Web.Syndication.ISyndicationContentFactory"
  // Instantiable: "Syndication_ISyndicationContent"
  TSyndication_SyndicationContent = class(TWinRTGenericImportFI<Syndication_ISyndicationContentFactory, Syndication_ISyndicationContent>)
  public
    // -> Syndication_ISyndicationContentFactory
    class function CreateSyndicationContent(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText; static; inline;
    class function CreateSyndicationContentWithSourceUri(sourceUri: IUriRuntimeClass): Syndication_ISyndicationText; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationLink
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationLink
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationLinkFactory"
  // Instantiable: "Syndication_ISyndicationLink"
  TSyndication_SyndicationLink = class(TWinRTGenericImportFI<Syndication_ISyndicationLinkFactory, Syndication_ISyndicationLink>)
  public
    // -> Syndication_ISyndicationLinkFactory
    class function CreateSyndicationLink(uri: IUriRuntimeClass): Syndication_ISyndicationLink; static; inline;
    class function CreateSyndicationLinkEx(uri: IUriRuntimeClass; relationship: HSTRING; title: HSTRING; mediaType: HSTRING; length: Cardinal): Syndication_ISyndicationLink; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationPerson
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationPerson
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationPersonFactory"
  // Instantiable: "Syndication_ISyndicationPerson"
  TSyndication_SyndicationPerson = class(TWinRTGenericImportFI<Syndication_ISyndicationPersonFactory, Syndication_ISyndicationPerson>)
  public
    // -> Syndication_ISyndicationPersonFactory
    class function CreateSyndicationPerson(name: HSTRING): Syndication_ISyndicationPerson; static; inline;
    class function CreateSyndicationPersonEx(name: HSTRING; email: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationPerson; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationCategory
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationCategory
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationCategoryFactory"
  // Instantiable: "Syndication_ISyndicationCategory"
  TSyndication_SyndicationCategory = class(TWinRTGenericImportFI<Syndication_ISyndicationCategoryFactory, Syndication_ISyndicationCategory>)
  public
    // -> Syndication_ISyndicationCategoryFactory
    class function CreateSyndicationCategory(term: HSTRING): Syndication_ISyndicationCategory; static; inline;
    class function CreateSyndicationCategoryEx(term: HSTRING; scheme: HSTRING; &label: HSTRING): Syndication_ISyndicationCategory; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationFeed
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationFeed
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationFeedFactory"
  // Instantiable: "Syndication_ISyndicationFeed"
  TSyndication_SyndicationFeed = class(TWinRTGenericImportFI<Syndication_ISyndicationFeedFactory, Syndication_ISyndicationFeed>)
  public
    // -> Syndication_ISyndicationFeedFactory
    class function CreateSyndicationFeed(title: HSTRING; subtitle: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationFeed; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationItem
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationItem
  // Implements: Windows.Web.Syndication.ISyndicationNode
  // Factory: "Windows.Web.Syndication.ISyndicationItemFactory"
  // Instantiable: "Syndication_ISyndicationItem"
  TSyndication_SyndicationItem = class(TWinRTGenericImportFI<Syndication_ISyndicationItemFactory, Syndication_ISyndicationItem>)
  public
    // -> Syndication_ISyndicationItemFactory
    class function CreateSyndicationItem(title: HSTRING; content: Syndication_ISyndicationText; uri: IUriRuntimeClass): Syndication_ISyndicationItem; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationClient
  // DualAPI
  // Implements: Windows.Web.Syndication.ISyndicationClient
  // Factory: "Windows.Web.Syndication.ISyndicationClientFactory"
  // Instantiable: "Syndication_ISyndicationClient"
  TSyndication_SyndicationClient = class(TWinRTGenericImportFI<Syndication_ISyndicationClientFactory, Syndication_ISyndicationClient>)
  public
    // -> Syndication_ISyndicationClientFactory
    class function CreateSyndicationClient(serverCredential: IPasswordCredential): Syndication_ISyndicationClient; static; inline;
  end;

  // Windows.Web.Syndication.SyndicationError
  // DualAPI
  // Statics: "Windows.Web.Syndication.ISyndicationErrorStatics"
  TSyndication_SyndicationError = class(TWinRTGenericImportS<Syndication_ISyndicationErrorStatics>)
  public
    // -> Syndication_ISyndicationErrorStatics
    class function GetStatus(hresult: Integer): Syndication_SyndicationErrorStatus; static; inline;
  end;

  // Windows.Web.AtomPub.ResourceCollection
  // DualAPI
  // Implements: Windows.Web.AtomPub.IResourceCollection
  // Implements: Windows.Web.Syndication.ISyndicationNode

  // Windows.Web.AtomPub.Workspace
  // DualAPI
  // Implements: Windows.Web.AtomPub.IWorkspace
  // Implements: Windows.Web.Syndication.ISyndicationNode

  // Windows.Web.AtomPub.ServiceDocument
  // DualAPI
  // Implements: Windows.Web.AtomPub.IServiceDocument
  // Implements: Windows.Web.Syndication.ISyndicationNode

  // Windows.Web.AtomPub.AtomPubClient
  // DualAPI
  // Implements: Windows.Web.AtomPub.IAtomPubClient
  // Implements: Windows.Web.Syndication.ISyndicationClient
  // Factory: "Windows.Web.AtomPub.IAtomPubClientFactory"
  // Instantiable: "AtomPub_IAtomPubClient"
  TAtomPub_AtomPubClient = class(TWinRTGenericImportFI<AtomPub_IAtomPubClientFactory, AtomPub_IAtomPubClient>)
  public
    // -> AtomPub_IAtomPubClientFactory
    class function CreateAtomPubClientWithCredentials(serverCredential: IPasswordCredential): AtomPub_IAtomPubClient; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { THttp_HttpRequestMessage }
// Factories for : "Http_HttpRequestMessage"
// Factory: "Windows.Web.Http.IHttpRequestMessageFactory"
// -> Http_IHttpRequestMessageFactory

class function THttp_HttpRequestMessage.Create(method: Http_IHttpMethod; uri: IUriRuntimeClass): Http_IHttpRequestMessage;
begin
  Result := Factory.Create(method, uri);
end;


 { THttp_HttpResponseMessage }
// Factories for : "Http_HttpResponseMessage"
// Factory: "Windows.Web.Http.IHttpResponseMessageFactory"
// -> Http_IHttpResponseMessageFactory

class function THttp_HttpResponseMessage.Create(statusCode: Http_HttpStatusCode): Http_IHttpResponseMessage;
begin
  Result := Factory.Create(statusCode);
end;


 { THttp_HttpClient }
// Factories for : "Http_HttpClient"
// Factory: "Windows.Web.Http.IHttpClientFactory"
// -> Http_IHttpClientFactory

class function THttp_HttpClient.Create(filter: Http_Filters_IHttpFilter): Http_IHttpClient;
begin
  Result := Factory.Create(filter);
end;


 { THttp_Headers_HttpContentHeaderCollection }

 { THttp_HttpCookie }
// Factories for : "Http_HttpCookie"
// Factory: "Windows.Web.Http.IHttpCookieFactory"
// -> Http_IHttpCookieFactory

class function THttp_HttpCookie.Create(name: HSTRING; domain: HSTRING; path: HSTRING): Http_IHttpCookie;
begin
  Result := Factory.Create(name, domain, path);
end;


 { THttp_HttpMethod }

class function THttp_HttpMethod.get_Delete: Http_IHttpMethod;
begin
  Result := Statics.get_Delete;
end;

class function THttp_HttpMethod.get_Get: Http_IHttpMethod;
begin
  Result := Statics.get_Get;
end;

class function THttp_HttpMethod.get_Head: Http_IHttpMethod;
begin
  Result := Statics.get_Head;
end;

class function THttp_HttpMethod.get_Options: Http_IHttpMethod;
begin
  Result := Statics.get_Options;
end;

class function THttp_HttpMethod.get_Patch: Http_IHttpMethod;
begin
  Result := Statics.get_Patch;
end;

class function THttp_HttpMethod.get_Post: Http_IHttpMethod;
begin
  Result := Statics.get_Post;
end;

class function THttp_HttpMethod.get_Put: Http_IHttpMethod;
begin
  Result := Statics.get_Put;
end;

// Factories for : "Http_HttpMethod"
// Factory: "Windows.Web.Http.IHttpMethodFactory"
// -> Http_IHttpMethodFactory

class function THttp_HttpMethod.Create(method: HSTRING): Http_IHttpMethod;
begin
  Result := Factory.Create(method);
end;


 { THttp_HttpStringContent }
// Factories for : "Http_HttpStringContent"
// Factory: "Windows.Web.Http.IHttpStringContentFactory"
// -> Http_IHttpStringContentFactory

class function THttp_HttpStringContent.CreateFromString(content: HSTRING): Http_IHttpContent;
begin
  Result := Factory.CreateFromString(content);
end;

class function THttp_HttpStringContent.CreateFromStringWithEncoding(content: HSTRING; encoding: UnicodeEncoding): Http_IHttpContent;
begin
  Result := Factory.CreateFromStringWithEncoding(content, encoding);
end;

class function THttp_HttpStringContent.CreateFromStringWithEncodingAndMediaType(content: HSTRING; encoding: UnicodeEncoding; mediaType: HSTRING): Http_IHttpContent;
begin
  Result := Factory.CreateFromStringWithEncodingAndMediaType(content, encoding, mediaType);
end;


 { THttp_HttpBufferContent }
// Factories for : "Http_HttpBufferContent"
// Factory: "Windows.Web.Http.IHttpBufferContentFactory"
// -> Http_IHttpBufferContentFactory

class function THttp_HttpBufferContent.CreateFromBuffer(content: IBuffer): Http_IHttpContent;
begin
  Result := Factory.CreateFromBuffer(content);
end;

class function THttp_HttpBufferContent.CreateFromBufferWithOffset(content: IBuffer; offset: Cardinal; count: Cardinal): Http_IHttpContent;
begin
  Result := Factory.CreateFromBufferWithOffset(content, offset, count);
end;


 { THttp_HttpStreamContent }
// Factories for : "Http_HttpStreamContent"
// Factory: "Windows.Web.Http.IHttpStreamContentFactory"
// -> Http_IHttpStreamContentFactory

class function THttp_HttpStreamContent.CreateFromInputStream(content: IInputStream): Http_IHttpContent;
begin
  Result := Factory.CreateFromInputStream(content);
end;


 { THttp_HttpFormUrlEncodedContent }
// Factories for : "Http_HttpFormUrlEncodedContent"
// Factory: "Windows.Web.Http.IHttpFormUrlEncodedContentFactory"
// -> Http_IHttpFormUrlEncodedContentFactory

class function THttp_HttpFormUrlEncodedContent.Create(content: IIterable_1__IKeyValuePair_2__HSTRING__HSTRING): Http_IHttpContent;
begin
  Result := Factory.Create(content);
end;


 { THttp_HttpMultipartContent }
// Factories for : "Http_HttpMultipartContent"
// Factory: "Windows.Web.Http.IHttpMultipartContentFactory"
// -> Http_IHttpMultipartContentFactory

class function THttp_HttpMultipartContent.CreateWithSubtype(subtype: HSTRING): Http_IHttpContent;
begin
  Result := Factory.CreateWithSubtype(subtype);
end;

class function THttp_HttpMultipartContent.CreateWithSubtypeAndBoundary(subtype: HSTRING; boundary: HSTRING): Http_IHttpContent;
begin
  Result := Factory.CreateWithSubtypeAndBoundary(subtype, boundary);
end;


 { THttp_HttpMultipartFormDataContent }
// Factories for : "Http_HttpMultipartFormDataContent"
// Factory: "Windows.Web.Http.IHttpMultipartFormDataContentFactory"
// -> Http_IHttpMultipartFormDataContentFactory

class function THttp_HttpMultipartFormDataContent.CreateWithBoundary(boundary: HSTRING): Http_IHttpContent;
begin
  Result := Factory.CreateWithBoundary(boundary);
end;


 { THttp_Filters_HttpBaseProtocolFilter }

 { THttp_Headers_HttpContentDispositionHeaderValue }

class function THttp_Headers_HttpContentDispositionHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpContentDispositionHeaderValue.TryParse(input: HSTRING; out contentDispositionHeaderValue: Http_Headers_IHttpContentDispositionHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, contentDispositionHeaderValue);
end;

// Factories for : "Http_Headers_HttpContentDispositionHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpContentDispositionHeaderValueFactory"
// -> Http_Headers_IHttpContentDispositionHeaderValueFactory

class function THttp_Headers_HttpContentDispositionHeaderValue.Create(dispositionType: HSTRING): Http_Headers_IHttpContentDispositionHeaderValue;
begin
  Result := Factory.Create(dispositionType);
end;


 { THttp_Headers_HttpContentRangeHeaderValue }

class function THttp_Headers_HttpContentRangeHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpContentRangeHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpContentRangeHeaderValue.TryParse(input: HSTRING; out contentRangeHeaderValue: Http_Headers_IHttpContentRangeHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, contentRangeHeaderValue);
end;

// Factories for : "Http_Headers_HttpContentRangeHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpContentRangeHeaderValueFactory"
// -> Http_Headers_IHttpContentRangeHeaderValueFactory

class function THttp_Headers_HttpContentRangeHeaderValue.CreateFromLength(length: UInt64): Http_Headers_IHttpContentRangeHeaderValue;
begin
  Result := Factory.CreateFromLength(length);
end;

class function THttp_Headers_HttpContentRangeHeaderValue.CreateFromRange(from: UInt64; &to: UInt64): Http_Headers_IHttpContentRangeHeaderValue;
begin
  Result := Factory.CreateFromRange(from, &to);
end;

class function THttp_Headers_HttpContentRangeHeaderValue.CreateFromRangeWithLength(from: UInt64; &to: UInt64; length: UInt64): Http_Headers_IHttpContentRangeHeaderValue;
begin
  Result := Factory.CreateFromRangeWithLength(from, &to, length);
end;


 { THttp_Headers_HttpMediaTypeHeaderValue }

class function THttp_Headers_HttpMediaTypeHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpMediaTypeHeaderValue.TryParse(input: HSTRING; out mediaTypeHeaderValue: Http_Headers_IHttpMediaTypeHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, mediaTypeHeaderValue);
end;

// Factories for : "Http_Headers_HttpMediaTypeHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpMediaTypeHeaderValueFactory"
// -> Http_Headers_IHttpMediaTypeHeaderValueFactory

class function THttp_Headers_HttpMediaTypeHeaderValue.Create(mediaType: HSTRING): Http_Headers_IHttpMediaTypeHeaderValue;
begin
  Result := Factory.Create(mediaType);
end;


 { THttp_Headers_HttpCredentialsHeaderValue }

class function THttp_Headers_HttpCredentialsHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpCredentialsHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpCredentialsHeaderValue.TryParse(input: HSTRING; out credentialsHeaderValue: Http_Headers_IHttpCredentialsHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, credentialsHeaderValue);
end;

// Factories for : "Http_Headers_HttpCredentialsHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpCredentialsHeaderValueFactory"
// -> Http_Headers_IHttpCredentialsHeaderValueFactory

class function THttp_Headers_HttpCredentialsHeaderValue.CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpCredentialsHeaderValue;
begin
  Result := Factory.CreateFromScheme(scheme);
end;

class function THttp_Headers_HttpCredentialsHeaderValue.CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpCredentialsHeaderValue;
begin
  Result := Factory.CreateFromSchemeWithToken(scheme, token);
end;


 { THttp_Headers_HttpDateOrDeltaHeaderValue }

class function THttp_Headers_HttpDateOrDeltaHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpDateOrDeltaHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpDateOrDeltaHeaderValue.TryParse(input: HSTRING; out dateOrDeltaHeaderValue: Http_Headers_IHttpDateOrDeltaHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, dateOrDeltaHeaderValue);
end;


 { THttp_Headers_HttpNameValueHeaderValue }

class function THttp_Headers_HttpNameValueHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpNameValueHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpNameValueHeaderValue.TryParse(input: HSTRING; out nameValueHeaderValue: Http_Headers_IHttpNameValueHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, nameValueHeaderValue);
end;

// Factories for : "Http_Headers_HttpNameValueHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpNameValueHeaderValueFactory"
// -> Http_Headers_IHttpNameValueHeaderValueFactory

class function THttp_Headers_HttpNameValueHeaderValue.CreateFromName(name: HSTRING): Http_Headers_IHttpNameValueHeaderValue;
begin
  Result := Factory.CreateFromName(name);
end;

class function THttp_Headers_HttpNameValueHeaderValue.CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpNameValueHeaderValue;
begin
  Result := Factory.CreateFromNameWithValue(name, value);
end;


 { THttp_Headers_HttpChallengeHeaderValue }

class function THttp_Headers_HttpChallengeHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpChallengeHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpChallengeHeaderValue.TryParse(input: HSTRING; out challengeHeaderValue: Http_Headers_IHttpChallengeHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, challengeHeaderValue);
end;

// Factories for : "Http_Headers_HttpChallengeHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpChallengeHeaderValueFactory"
// -> Http_Headers_IHttpChallengeHeaderValueFactory

class function THttp_Headers_HttpChallengeHeaderValue.CreateFromScheme(scheme: HSTRING): Http_Headers_IHttpChallengeHeaderValue;
begin
  Result := Factory.CreateFromScheme(scheme);
end;

class function THttp_Headers_HttpChallengeHeaderValue.CreateFromSchemeWithToken(scheme: HSTRING; token: HSTRING): Http_Headers_IHttpChallengeHeaderValue;
begin
  Result := Factory.CreateFromSchemeWithToken(scheme, token);
end;


 { THttp_Headers_HttpConnectionOptionHeaderValue }

class function THttp_Headers_HttpConnectionOptionHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpConnectionOptionHeaderValue.TryParse(input: HSTRING; out connectionOptionHeaderValue: Http_Headers_IHttpConnectionOptionHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, connectionOptionHeaderValue);
end;

// Factories for : "Http_Headers_HttpConnectionOptionHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpConnectionOptionHeaderValueFactory"
// -> Http_Headers_IHttpConnectionOptionHeaderValueFactory

class function THttp_Headers_HttpConnectionOptionHeaderValue.Create(token: HSTRING): Http_Headers_IHttpConnectionOptionHeaderValue;
begin
  Result := Factory.Create(token);
end;


 { THttp_Headers_HttpContentCodingHeaderValue }

class function THttp_Headers_HttpContentCodingHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpContentCodingHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpContentCodingHeaderValue.TryParse(input: HSTRING; out contentCodingHeaderValue: Http_Headers_IHttpContentCodingHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, contentCodingHeaderValue);
end;

// Factories for : "Http_Headers_HttpContentCodingHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpContentCodingHeaderValueFactory"
// -> Http_Headers_IHttpContentCodingHeaderValueFactory

class function THttp_Headers_HttpContentCodingHeaderValue.Create(contentCoding: HSTRING): Http_Headers_IHttpContentCodingHeaderValue;
begin
  Result := Factory.Create(contentCoding);
end;


 { THttp_Headers_HttpCookiePairHeaderValue }

class function THttp_Headers_HttpCookiePairHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpCookiePairHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpCookiePairHeaderValue.TryParse(input: HSTRING; out cookiePairHeaderValue: Http_Headers_IHttpCookiePairHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, cookiePairHeaderValue);
end;

// Factories for : "Http_Headers_HttpCookiePairHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpCookiePairHeaderValueFactory"
// -> Http_Headers_IHttpCookiePairHeaderValueFactory

class function THttp_Headers_HttpCookiePairHeaderValue.CreateFromName(name: HSTRING): Http_Headers_IHttpCookiePairHeaderValue;
begin
  Result := Factory.CreateFromName(name);
end;

class function THttp_Headers_HttpCookiePairHeaderValue.CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpCookiePairHeaderValue;
begin
  Result := Factory.CreateFromNameWithValue(name, value);
end;


 { THttp_Headers_HttpExpectationHeaderValue }

class function THttp_Headers_HttpExpectationHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpExpectationHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpExpectationHeaderValue.TryParse(input: HSTRING; out expectationHeaderValue: Http_Headers_IHttpExpectationHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, expectationHeaderValue);
end;

// Factories for : "Http_Headers_HttpExpectationHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpExpectationHeaderValueFactory"
// -> Http_Headers_IHttpExpectationHeaderValueFactory

class function THttp_Headers_HttpExpectationHeaderValue.CreateFromName(name: HSTRING): Http_Headers_IHttpExpectationHeaderValue;
begin
  Result := Factory.CreateFromName(name);
end;

class function THttp_Headers_HttpExpectationHeaderValue.CreateFromNameWithValue(name: HSTRING; value: HSTRING): Http_Headers_IHttpExpectationHeaderValue;
begin
  Result := Factory.CreateFromNameWithValue(name, value);
end;


 { THttp_Headers_HttpLanguageRangeWithQualityHeaderValue }

class function THttp_Headers_HttpLanguageRangeWithQualityHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpLanguageRangeWithQualityHeaderValue.TryParse(input: HSTRING; out languageRangeWithQualityHeaderValue: Http_Headers_IHttpLanguageRangeWithQualityHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, languageRangeWithQualityHeaderValue);
end;

// Factories for : "Http_Headers_HttpLanguageRangeWithQualityHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpLanguageRangeWithQualityHeaderValueFactory"
// -> Http_Headers_IHttpLanguageRangeWithQualityHeaderValueFactory

class function THttp_Headers_HttpLanguageRangeWithQualityHeaderValue.CreateFromLanguageRange(languageRange: HSTRING): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;
begin
  Result := Factory.CreateFromLanguageRange(languageRange);
end;

class function THttp_Headers_HttpLanguageRangeWithQualityHeaderValue.CreateFromLanguageRangeWithQuality(languageRange: HSTRING; quality: Double): Http_Headers_IHttpLanguageRangeWithQualityHeaderValue;
begin
  Result := Factory.CreateFromLanguageRangeWithQuality(languageRange, quality);
end;


 { THttp_Headers_HttpMediaTypeWithQualityHeaderValue }

class function THttp_Headers_HttpMediaTypeWithQualityHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpMediaTypeWithQualityHeaderValue.TryParse(input: HSTRING; out mediaTypeWithQualityHeaderValue: Http_Headers_IHttpMediaTypeWithQualityHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, mediaTypeWithQualityHeaderValue);
end;

// Factories for : "Http_Headers_HttpMediaTypeWithQualityHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpMediaTypeWithQualityHeaderValueFactory"
// -> Http_Headers_IHttpMediaTypeWithQualityHeaderValueFactory

class function THttp_Headers_HttpMediaTypeWithQualityHeaderValue.CreateFromMediaType(mediaType: HSTRING): Http_Headers_IHttpMediaTypeWithQualityHeaderValue;
begin
  Result := Factory.CreateFromMediaType(mediaType);
end;

class function THttp_Headers_HttpMediaTypeWithQualityHeaderValue.CreateFromMediaTypeWithQuality(mediaType: HSTRING; quality: Double): Http_Headers_IHttpMediaTypeWithQualityHeaderValue;
begin
  Result := Factory.CreateFromMediaTypeWithQuality(mediaType, quality);
end;


 { THttp_Headers_HttpProductHeaderValue }

class function THttp_Headers_HttpProductHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpProductHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpProductHeaderValue.TryParse(input: HSTRING; out productHeaderValue: Http_Headers_IHttpProductHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, productHeaderValue);
end;

// Factories for : "Http_Headers_HttpProductHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpProductHeaderValueFactory"
// -> Http_Headers_IHttpProductHeaderValueFactory

class function THttp_Headers_HttpProductHeaderValue.CreateFromName(productName: HSTRING): Http_Headers_IHttpProductHeaderValue;
begin
  Result := Factory.CreateFromName(productName);
end;

class function THttp_Headers_HttpProductHeaderValue.CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductHeaderValue;
begin
  Result := Factory.CreateFromNameWithVersion(productName, productVersion);
end;


 { THttp_Headers_HttpProductInfoHeaderValue }

class function THttp_Headers_HttpProductInfoHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpProductInfoHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpProductInfoHeaderValue.TryParse(input: HSTRING; out productInfoHeaderValue: Http_Headers_IHttpProductInfoHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, productInfoHeaderValue);
end;

// Factories for : "Http_Headers_HttpProductInfoHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpProductInfoHeaderValueFactory"
// -> Http_Headers_IHttpProductInfoHeaderValueFactory

class function THttp_Headers_HttpProductInfoHeaderValue.CreateFromComment(productComment: HSTRING): Http_Headers_IHttpProductInfoHeaderValue;
begin
  Result := Factory.CreateFromComment(productComment);
end;

class function THttp_Headers_HttpProductInfoHeaderValue.CreateFromNameWithVersion(productName: HSTRING; productVersion: HSTRING): Http_Headers_IHttpProductInfoHeaderValue;
begin
  Result := Factory.CreateFromNameWithVersion(productName, productVersion);
end;


 { THttp_Headers_HttpContentCodingWithQualityHeaderValue }

class function THttp_Headers_HttpContentCodingWithQualityHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpContentCodingWithQualityHeaderValue.TryParse(input: HSTRING; out contentCodingWithQualityHeaderValue: Http_Headers_IHttpContentCodingWithQualityHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, contentCodingWithQualityHeaderValue);
end;

// Factories for : "Http_Headers_HttpContentCodingWithQualityHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpContentCodingWithQualityHeaderValueFactory"
// -> Http_Headers_IHttpContentCodingWithQualityHeaderValueFactory

class function THttp_Headers_HttpContentCodingWithQualityHeaderValue.CreateFromValue(contentCoding: HSTRING): Http_Headers_IHttpContentCodingWithQualityHeaderValue;
begin
  Result := Factory.CreateFromValue(contentCoding);
end;

class function THttp_Headers_HttpContentCodingWithQualityHeaderValue.CreateFromValueWithQuality(contentCoding: HSTRING; quality: Double): Http_Headers_IHttpContentCodingWithQualityHeaderValue;
begin
  Result := Factory.CreateFromValueWithQuality(contentCoding, quality);
end;


 { THttp_Headers_HttpTransferCodingHeaderValue }

class function THttp_Headers_HttpTransferCodingHeaderValue.Parse(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue;
begin
  Result := Statics.Parse(input);
end;

class function THttp_Headers_HttpTransferCodingHeaderValue.TryParse(input: HSTRING; out transferCodingHeaderValue: Http_Headers_IHttpTransferCodingHeaderValue): Boolean;
begin
  Result := Statics.TryParse(input, transferCodingHeaderValue);
end;

// Factories for : "Http_Headers_HttpTransferCodingHeaderValue"
// Factory: "Windows.Web.Http.Headers.IHttpTransferCodingHeaderValueFactory"
// -> Http_Headers_IHttpTransferCodingHeaderValueFactory

class function THttp_Headers_HttpTransferCodingHeaderValue.Create(input: HSTRING): Http_Headers_IHttpTransferCodingHeaderValue;
begin
  Result := Factory.Create(input);
end;


 { TWebError }

class function TWebError.GetStatus(hresult: Integer): WebErrorStatus;
begin
  Result := Statics.GetStatus(hresult);
end;


 { TSyndication_SyndicationAttribute }
// Factories for : "Syndication_SyndicationAttribute"
// Factory: "Windows.Web.Syndication.ISyndicationAttributeFactory"
// -> Syndication_ISyndicationAttributeFactory

class function TSyndication_SyndicationAttribute.CreateSyndicationAttribute(attributeName: HSTRING; attributeNamespace: HSTRING; attributeValue: HSTRING): Syndication_ISyndicationAttribute;
begin
  Result := Factory.CreateSyndicationAttribute(attributeName, attributeNamespace, attributeValue);
end;


 { TSyndication_SyndicationNode }
// Factories for : "Syndication_SyndicationNode"
// Factory: "Windows.Web.Syndication.ISyndicationNodeFactory"
// -> Syndication_ISyndicationNodeFactory

class function TSyndication_SyndicationNode.CreateSyndicationNode(nodeName: HSTRING; nodeNamespace: HSTRING; nodeValue: HSTRING): Syndication_ISyndicationNode;
begin
  Result := Factory.CreateSyndicationNode(nodeName, nodeNamespace, nodeValue);
end;


 { TSyndication_SyndicationGenerator }
// Factories for : "Syndication_SyndicationGenerator"
// Factory: "Windows.Web.Syndication.ISyndicationGeneratorFactory"
// -> Syndication_ISyndicationGeneratorFactory

class function TSyndication_SyndicationGenerator.CreateSyndicationGenerator(text: HSTRING): Syndication_ISyndicationGenerator;
begin
  Result := Factory.CreateSyndicationGenerator(text);
end;


 { TSyndication_SyndicationText }
// Factories for : "Syndication_SyndicationText"
// Factory: "Windows.Web.Syndication.ISyndicationTextFactory"
// -> Syndication_ISyndicationTextFactory

class function TSyndication_SyndicationText.CreateSyndicationText(text: HSTRING): Syndication_ISyndicationText;
begin
  Result := Factory.CreateSyndicationText(text);
end;

class function TSyndication_SyndicationText.CreateSyndicationTextEx(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText;
begin
  Result := Factory.CreateSyndicationTextEx(text, &type);
end;


 { TSyndication_SyndicationContent }
// Factories for : "Syndication_SyndicationContent"
// Factory: "Windows.Web.Syndication.ISyndicationContentFactory"
// -> Syndication_ISyndicationContentFactory

class function TSyndication_SyndicationContent.CreateSyndicationContent(text: HSTRING; &type: Syndication_SyndicationTextType): Syndication_ISyndicationText;
begin
  Result := Factory.CreateSyndicationContent(text, &type);
end;

class function TSyndication_SyndicationContent.CreateSyndicationContentWithSourceUri(sourceUri: IUriRuntimeClass): Syndication_ISyndicationText;
begin
  Result := Factory.CreateSyndicationContentWithSourceUri(sourceUri);
end;


 { TSyndication_SyndicationLink }
// Factories for : "Syndication_SyndicationLink"
// Factory: "Windows.Web.Syndication.ISyndicationLinkFactory"
// -> Syndication_ISyndicationLinkFactory

class function TSyndication_SyndicationLink.CreateSyndicationLink(uri: IUriRuntimeClass): Syndication_ISyndicationLink;
begin
  Result := Factory.CreateSyndicationLink(uri);
end;

class function TSyndication_SyndicationLink.CreateSyndicationLinkEx(uri: IUriRuntimeClass; relationship: HSTRING; title: HSTRING; mediaType: HSTRING; length: Cardinal): Syndication_ISyndicationLink;
begin
  Result := Factory.CreateSyndicationLinkEx(uri, relationship, title, mediaType, length);
end;


 { TSyndication_SyndicationPerson }
// Factories for : "Syndication_SyndicationPerson"
// Factory: "Windows.Web.Syndication.ISyndicationPersonFactory"
// -> Syndication_ISyndicationPersonFactory

class function TSyndication_SyndicationPerson.CreateSyndicationPerson(name: HSTRING): Syndication_ISyndicationPerson;
begin
  Result := Factory.CreateSyndicationPerson(name);
end;

class function TSyndication_SyndicationPerson.CreateSyndicationPersonEx(name: HSTRING; email: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationPerson;
begin
  Result := Factory.CreateSyndicationPersonEx(name, email, uri);
end;


 { TSyndication_SyndicationCategory }
// Factories for : "Syndication_SyndicationCategory"
// Factory: "Windows.Web.Syndication.ISyndicationCategoryFactory"
// -> Syndication_ISyndicationCategoryFactory

class function TSyndication_SyndicationCategory.CreateSyndicationCategory(term: HSTRING): Syndication_ISyndicationCategory;
begin
  Result := Factory.CreateSyndicationCategory(term);
end;

class function TSyndication_SyndicationCategory.CreateSyndicationCategoryEx(term: HSTRING; scheme: HSTRING; &label: HSTRING): Syndication_ISyndicationCategory;
begin
  Result := Factory.CreateSyndicationCategoryEx(term, scheme, &label);
end;


 { TSyndication_SyndicationFeed }
// Factories for : "Syndication_SyndicationFeed"
// Factory: "Windows.Web.Syndication.ISyndicationFeedFactory"
// -> Syndication_ISyndicationFeedFactory

class function TSyndication_SyndicationFeed.CreateSyndicationFeed(title: HSTRING; subtitle: HSTRING; uri: IUriRuntimeClass): Syndication_ISyndicationFeed;
begin
  Result := Factory.CreateSyndicationFeed(title, subtitle, uri);
end;


 { TSyndication_SyndicationItem }
// Factories for : "Syndication_SyndicationItem"
// Factory: "Windows.Web.Syndication.ISyndicationItemFactory"
// -> Syndication_ISyndicationItemFactory

class function TSyndication_SyndicationItem.CreateSyndicationItem(title: HSTRING; content: Syndication_ISyndicationText; uri: IUriRuntimeClass): Syndication_ISyndicationItem;
begin
  Result := Factory.CreateSyndicationItem(title, content, uri);
end;


 { TSyndication_SyndicationClient }
// Factories for : "Syndication_SyndicationClient"
// Factory: "Windows.Web.Syndication.ISyndicationClientFactory"
// -> Syndication_ISyndicationClientFactory

class function TSyndication_SyndicationClient.CreateSyndicationClient(serverCredential: IPasswordCredential): Syndication_ISyndicationClient;
begin
  Result := Factory.CreateSyndicationClient(serverCredential);
end;


 { TSyndication_SyndicationError }

class function TSyndication_SyndicationError.GetStatus(hresult: Integer): Syndication_SyndicationErrorStatus;
begin
  Result := Statics.GetStatus(hresult);
end;


 { TAtomPub_AtomPubClient }
// Factories for : "AtomPub_AtomPubClient"
// Factory: "Windows.Web.AtomPub.IAtomPubClientFactory"
// -> AtomPub_IAtomPubClientFactory

class function TAtomPub_AtomPubClient.CreateAtomPubClientWithCredentials(serverCredential: IPasswordCredential): AtomPub_IAtomPubClient;
begin
  Result := Factory.CreateAtomPubClientWithCredentials(serverCredential);
end;



end.
