import 'package:demeter_app/core/services/dio_http_service_impl.dart';
import 'package:demeter_app/core/services/http_service.dart';
import 'package:demeter_app/core/services/mock_http_service_impl.dart';
import 'package:demeter_app/features/refund/domain/export.dart';
import 'package:demeter_app/features/refund/domain/repository/search_refund_repository.dart';
import 'package:demeter_app/features/refund/domain/repository/search_refund_repository_impl.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static initialize() {
    final getIt = GetIt.I;

    //core
    // getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    getIt.registerLazySingleton<HttpService>(() => MockHttpServiceImpl());
    //Repositories
    getIt.registerLazySingleton<SearchRefundRepository>(
      () => SearchRefundRepositoryImpl(getIt()),
    );

    // Services
    getIt.registerLazySingleton<SearchRefundService>(
      () => SearchRefundServiceImpl(getIt()),
    );

    //controllers
  }
}
