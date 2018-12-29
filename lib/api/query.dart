import 'package:dio/dio.dart';
import 'dart:io';
import 'apis.dart';

class DioFactory {
  static Dio _dio;

  static DioFactory _instance;

  static DioFactory getInstance() {
    if (_instance == null) {
      _instance = DioFactory._();
      _instance._init();
    }
    return _instance;
  }

  DioFactory._();

  _init() {
    _dio = Dio(
      Options(
        baseUrl: Apis.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 10000,
        // 5s
        headers: {"user-agent": "dio", "api": "1.0.0"},
        contentType: ContentType.JSON,
        // Transform the response data to a String encoded with UTF8.
        // The default value is [ResponseType.JSON].
        responseType: ResponseType.PLAIN,
      ),
    );
  }

  getDio() {
    return _dio;
  }
}
