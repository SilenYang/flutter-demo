import 'package:dio/dio.dart';
import 'dart:io';
import 'apis.dart';

class Fetch {
  static Dio _dio;

  static Fetch _instance;
  factory Fetch() => getInstance();

  static Fetch getInstance() {
    if (_instance == null) {
      _instance = Fetch._();
    }
    return _instance;
  }

  Fetch._() {
    _dio = Dio(
      Options(
        baseUrl: Apis.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 10000,
        headers: {"user-agent": "dio", "api": "1.0.0"},
        contentType: ContentType.json,
        responseType: ResponseType.PLAIN,
      ),
    );
  }

  getDio() {
    return _dio;
  }
}
