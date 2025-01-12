part of "i_failures.dart";

class HttpRequestFailure implements Failure {
  final int statusCode;
  final String message;
  HttpRequestFailure(
      {this.message = Consts.errorNetworkMessage, required this.statusCode});
}
