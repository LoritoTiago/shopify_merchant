import 'package:get_it/get_it.dart';
import 'package:shopify_merchant/core/services/base_service.dart';

var getIt = GetIt.I;

class DI {
  static Future<void> initDi() async {
    getIt.registerSingleton(BaseService());
  }
}
