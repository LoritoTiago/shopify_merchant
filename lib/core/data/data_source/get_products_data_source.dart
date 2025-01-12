import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/error/exceptions/http_request_exception.dart';
import 'package:shopify_merchant/core/error/exceptions/server_exception.dart';
import 'package:shopify_merchant/core/services/environment.dart';
import 'package:shopify_merchant/core/settings/headers_settings.dart';

class GetProductsDataSource {
  final http.Client client;

  GetProductsDataSource({required this.client});

  Future<ProductModel> call() async {
    try {
      final header = HeadersSettings.getHeaders();

      final url = Uri.parse(
          "${Environment.getUrl}/products.json?access_token=${Environment.getToken}");

      final result = await client
          .get(url, headers: header)
          .timeout(HeadersSettings.baseTimeout);

      if (result.statusCode == 200) {
        final body = productModelFromJson(result.body);

        return body;
      } else {
        log(result.body);
        throw HttpRequestException(statusCode: result.statusCode);
      }
    } on HttpRequestException catch (e) {
      throw HttpRequestException(statusCode: e.statusCode);
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
