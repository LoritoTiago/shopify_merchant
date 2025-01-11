import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopify_merchant/core/services/environment.dart';

class EnvironmentSetting {
  static void start() async {
    await dotenv.load(fileName: Environment.getFileName);
  }
}
