import 'package:shopify_merchant/core/const/consts.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = Consts.errorNetworkMessage});
}
