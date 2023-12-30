import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Network {
  late final Dio _dio;
  static final Network _instance = Network._init();
  factory Network() => _instance;

  Network._init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(_AuthenticationInterceptor());
  }

  void setAccessToken(String accToken) {
    _dio.options.headers['Authorization'] = accToken;
  }

  Future<dynamic> get(String url) async {
    final response = await _dio.get(url);
    return response;
  }

  Future<dynamic> post(String url, dynamic data) async {
    final response = await _dio.post(url, data: data);
    return response;
  }

  Future<dynamic> put(String url, dynamic data) async {
    final response = await _dio.put(url, data: data);
    return response;
  }

  Future<dynamic> delete(String url) async {
    final response = await _dio.delete(url);
    return response;
  }

  Future<dynamic> patch(String url, dynamic data) async {
    final response = await _dio.patch(url, data: data);
    return response;
  }
}

/*
 * Extention 
 */
extension DioErrorX on DioException {
  OSError? getOsError() {
    if (type == DioExceptionType.unknown && error is SocketException) {
      SocketException socketErr = error as SocketException;
      return socketErr.osError as OSError;
    }
    return null;
  }

  // SocketException: Network is unreachable
  bool isNetUnreachable() {
    OSError? osErr = getOsError();
    if (osErr != null && osErr.errorCode == 101) {
      return true;
    }

    return false;
  }

  // SocketException: Connection refused
  bool isServerRefused() {
    OSError? osErr = getOsError();
    if (osErr != null && osErr.errorCode == 111) {
      return true;
    }

    return false;
  }
}

/*
 * Interceptor 
 */
class _AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger().t('Request[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger().t('Response[${response.statusCode}] => PATH: ${response.realUri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger().t(
        'DioException[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    if (err.isNetUnreachable()) {
      Logger().e("Device Network Error");
    }

    if (err.isServerRefused()) {
      Logger().e("Server Connection Refused");
    }

    if (err.response!.statusCode == 401) {
      // do refresh token
    }

    super.onError(err, handler);
  }
}
