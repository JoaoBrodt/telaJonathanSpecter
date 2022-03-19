import 'package:demeter_app/core/services/http_service.dart';
import 'package:demeter_app/features/refund/domain/exception/refund_exception.dart';
import 'package:demeter_app/features/refund/domain/entities/refund_model.dart';
import 'package:dartz/dartz.dart';
import 'package:demeter_app/features/refund/domain/export.dart';

class SearchRefundServiceImpl implements SearchRefundService {
  final SearchRefundRepository _searchRepository;

  SearchRefundServiceImpl(SearchRefundRepository searchRepository)
      : _searchRepository = searchRepository;
  @override
  Future<Either<RefundException, List<RefundEntity>>> call(String type) async {
    return await _searchRepository(type);
  }
}
