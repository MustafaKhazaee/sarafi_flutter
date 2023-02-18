
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sarafi/services/authentication_service.dart';

import '../../routes/main_routes.dart';
import '../../services/storage_service.dart';

// Must be top-level function
_parseAndDecode(String response) => jsonDecode(response);

_Encode(dynamic response) => jsonEncode(response);

parseJson(String text) => compute(_parseAndDecode, text);

encodeJson(dynamic data) => compute(_Encode, data);

class HttpBase {

  final String resource;
  final x_api_key = "742A3106-4DCF-4C57-BA43-564C8EE844AA";
  final Dio dio = Dio();
  final authService = AuthenticationService();
  final myStatuses = {
    status401Unauthorized,
    status440LoginTimeout,
    status408RequestTimeout,
    status504GatewayTimeout,
    status524TimeoutOccurred,
    status522ConnectionTimedOut,
    status419AuthenticationTimeout,
    status598NetworkReadTimeoutError,
    status599NetworkConnectTimeoutError
  };

  HttpBase (this.resource) {
    String baseUrl = "http://10.0.2.2:5273/api/v1/";

    if (kDebugMode) baseUrl = "http://10.0.2.2:5273/api/v1/";
    else if (kReleaseMode) baseUrl = "http://10.0.2.2:5273/api/v1/";

    // dio base url options and timeout:
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000; // 10 seconds
    dio.options.receiveTimeout = 5000;

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
        onRequest:(options, handler) async {
          options.headers["x-api-key"] = x_api_key;
          final accessToken = await SecureStorage.getString("access_token");
          options.headers["Authorization"] = "Bearer $accessToken";

          return handler.next(options);
        },
        onResponse:(response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.message == 'Http status error [401]') {
            final response = await authService.refreshToken();
            if (response.IsRefreshed!) {
            } else {
              mainRouterKey.currentState?.popAndPushNamed(LoginRoute);
              e = DioError(requestOptions: RequestOptions(
                path: '',
              ));
            }
          }
          return handler.next(e);
        }
    ));

    // Retry policy interceptor : refresh token and then retry
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 3),
        Duration(seconds: 5),
        Duration(seconds: 8),
      ],
      retryEvaluator: DefaultRetryEvaluator(myStatuses).evaluate,
    ));
  }

  Future<dynamic> get (String action, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) async {
    final r = await dio.get('$resource/$action', queryParameters: queryParameters, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
    return r.data;
  }

  Future<dynamic> post (String action, {data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    final r = await dio.post('$resource/$action', data: data, queryParameters: queryParameters, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
    return r.data;
  }

  Future<dynamic> put (String action, {data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    final r = await dio.put('$resource/$action', data: data, queryParameters: queryParameters, cancelToken: cancelToken, onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
    return r.data;
  }

  Future<dynamic> delete (String action, {data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    final r = await dio.delete('$resource/$action', data: data, queryParameters: queryParameters, cancelToken: cancelToken);
    return r.data;
  }

}