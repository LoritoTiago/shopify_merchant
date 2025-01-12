import 'package:shopify_merchant/core/const/consts.dart';

enum SplashStatus {
  isLoading(message: "Loading data"),

  haveError(message: Consts.errorNetworkMessage),
  loaded(message: "Success");

  const SplashStatus({this.message = ""});
  final String message;
}
