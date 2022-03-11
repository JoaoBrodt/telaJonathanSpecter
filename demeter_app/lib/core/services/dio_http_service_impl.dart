import 'package:dio/dio.dart';
import 'package:demeter_app/core/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(BaseOptions(baseUrl: "https://api.github.com/", headers: {
      'content-type': 'application/json;charset=utf-8',
      'Accept': 'application/vnd.github.mercy-preview+json',
    }));
    _dio.interceptors.add(LogInterceptor());
  }
  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }
}
