import 'package:deliveryboy/Api/Config.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final Dio _dio = Dio();
  Api() {
    _dio.options.baseUrl = Config.baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=oonu3ro0agbeiik4t0l6egt8ab'
    };
    _dio.options.responseType = ResponseType.plain;
    _dio.interceptors.add(
        PrettyDioLogger(requestBody: true, responseBody: true, error: true));
  }
  Dio get sendRequest => _dio;
}
