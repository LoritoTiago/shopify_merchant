import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shopify_merchant/core/data/data_source/get_products_data_source.dart';
import 'package:shopify_merchant/core/data/repository/get_products_repository.dart';
import 'package:shopify_merchant/core/services/base_service.dart';

var getIt = GetIt.I;

class DI {
  static Future<void> initDi() async {
    getIt.registerSingleton(BaseService());

    getIt.registerLazySingleton(() => http.Client());
    getIt.registerLazySingleton(
      () => GetProductsDataSource(client: getIt()),
    );

    getIt.registerLazySingleton(
      () => GetProductsRepository(
        dataSource: getIt(),
      ),
    );
  }
}
