
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Must be top-level function
_parseAndDecode(String response) => jsonDecode(response);

parseJson(String text) => compute(_parseAndDecode, text);

class HttpBase {

  final String resource;
  final x_api_key = "742A3106-4DCF-4C57-BA43-564C8EE844AA";
  final Dio dio = Dio();

  HttpBase (this.resource) {
    String baseUrl = "";

    if (kDebugMode) baseUrl = "";
    else if (kReleaseMode) baseUrl = "";

    // dio base url options and timeout:
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 10000; // 10 seconds
    dio.options.receiveTimeout = 10000;

    // dio transformers for decoding string responses into json objects
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    /**
     * Intercept requests to add the following headers:
     *   1. JWT
     *   2. x-api-key
     *
     * Intercept Responses:
     *   1. Check response code.
     *   2. Catch errors.
     * */
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          options.headers["x-api-key"] = x_api_key;
          options.headers["Authorization"] = "Bearer jwt here";
          return handler.next(options);
        },
        onResponse:(response, handler) {
          // do something with the response here.
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // catch error here.
          return handler.next(e);
        }
    ));

  }

  Future<Response<T>> get<T> ({Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) {
    return dio.get(resource, queryParameters: queryParameters, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> post<T> ({data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    return dio.post(resource, data: data, queryParameters: queryParameters, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> put<T> ({data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    return dio.put(resource, data: data, queryParameters: queryParameters, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
  }

  Future<Response<T>> delete<T> ({data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    return dio.delete(resource, data: data, queryParameters: queryParameters, cancelToken: cancelToken);
  }

}