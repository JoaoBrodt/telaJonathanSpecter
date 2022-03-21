import 'package:demeter_app/core/services/api.dart';
import 'package:demeter_app/core/services/http_service.dart';
import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';
import 'package:demeter_app/features/refund/domain/exception/refund_exception.dart';
import 'package:demeter_app/features/refund/domain/repository/search_refund_repository.dart';
import 'package:demeter_app/features/refund/domain/repository/search_refund_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_resources/read_file.dart';

class HttpServiceMock extends Mock implements HttpService {}

void main() {
  late HttpServiceMock httpServiceMock;
  late SearchRefundRepository searchRefundRepository;
  late String json;
  setUpAll(() async {
    httpServiceMock = HttpServiceMock();
    searchRefundRepository = SearchRefundRepositoryImpl(httpServiceMock);
    json = FileJson.read(path: 'refund/refunds_approved_mock.json');
  });

  group('search refunds success.', () {
    setUp(() async {
      when(() => httpServiceMock
          .get(API.refunds, queryParameters: {'type': 'APPROVED'})).thenAnswer(
        (_) async => Response(
            requestOptions: RequestOptions(path: API.refunds), data: json),
      );
    });
    test('It searchs approved refunds and return 3 items.', () async {
      final result = await searchRefundRepository('APPROVED');
      late List<RefundEntity> refunds;
      result.fold((l) => null, (r) => refunds = r);
      expect(3, refunds.length);
    });
  });
  group('search refunds failure.', () {
    setUp(() async {
      when(() => httpServiceMock.get(API.refunds,
          queryParameters: {'type': 'APPROVED'})).thenThrow(Exception());
    });
    test('It searchs approved refund exception.', () async {
      final result = await searchRefundRepository('APPROVED');
      late Exception error;
      result.fold((left) => error = left, (right) => null);
      expect(true, error is RefundException);
    });
  });
}
