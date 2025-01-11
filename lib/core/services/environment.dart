import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get getFileName => ".env";

  static String get getUrl => dotenv.env['API_URL']!;
  static String get getUrlParto => dotenv.env['API_TOKEN']!;
}
