import 'package:shopify_merchant/core/const/consts.dart';

class HttpRequestException implements Exception {
  final int statusCode;
  final String message;
  HttpRequestException(
      {this.message = Consts.errorNetworkMessage, required this.statusCode});
}
