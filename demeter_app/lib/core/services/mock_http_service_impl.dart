import 'package:demeter_app/core/services/api.dart';
import 'package:dio/dio.dart';
import 'package:demeter_app/core/services/http_service.dart';
import 'package:flutter/services.dart';

class MockHttpServiceImpl implements HttpService {
  MockHttpServiceImpl() {}
  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    await Future.delayed(const Duration(seconds: 3));
    if (path == API.refunds) {
      final data = await _loadingRefundMocks(queryParameters);
      return Response(
          requestOptions: RequestOptions(path: API.refunds), data: data);
    }
    throw Exception("No Mock Implementation");
  }
}

Future<String> _loadingRefundMocks(
    Map<String, dynamic>? queryParameters) async {
  var location = 'mocks/refunds/refunds_approved_mock.json';
  final type = queryParameters?['type']?.toString() ?? '';
  if (type == 'PENDING') {
    location = 'mocks/refunds/refunds_pending_mock.json';
  }
  return await rootBundle.loadString(location);
}
