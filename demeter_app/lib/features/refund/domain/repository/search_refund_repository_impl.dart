import 'dart:convert';

import 'package:demeter_app/core/services/api.dart';
import 'package:demeter_app/core/services/http_service.dart';
import 'package:demeter_app/features/refund/domain/dto/refund_dto.dart';
import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';
import 'package:dartz/dartz.dart';
import 'package:demeter_app/features/refund/domain/exception/refund_exception.dart';
import 'package:demeter_app/features/refund/domain/repository/search_refund_repository.dart';

class SearchRefundRepositoryImpl extends SearchRefundRepository {
  final HttpService _httpService;
  SearchRefundRepositoryImpl(HttpService httpService)
      : _httpService = httpService;

  @override
  Future<Either<RefundException, List<RefundEntity>>> call(String type) async {
    try {
      final response =
          await _httpService.get(API.refunds, queryParameters: {'type': type});

      if (response.data != null) {
        final List<dynamic> data = jsonDecode(response.data)['items'];
        return Right(data.map((e) => RefundDto.fromJson(e)).toList());
      }
      return const Right([]);
    } catch (e) {
      //TODO: add log
      return Left(RefundException(message: 'Failed to load refunds'));
    }
  }
}
