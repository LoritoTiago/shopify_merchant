import 'package:shopify_merchant/core/const/consts.dart';

class ServerException implements Exception {
  final String message;
  ServerException({this.message = Consts.errorNetworkMessage});
}
