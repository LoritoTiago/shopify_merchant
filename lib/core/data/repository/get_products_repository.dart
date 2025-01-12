import 'package:dartz/dartz.dart';
import 'package:shopify_merchant/core/data/data_source/get_products_data_source.dart';
import 'package:shopify_merchant/core/data/model/product_model.dart';
import 'package:shopify_merchant/core/error/exceptions/http_request_exception.dart';
import 'package:shopify_merchant/core/error/exceptions/network_exception.dart';
import 'package:shopify_merchant/core/error/failures/i_failures.dart';

class GetProductsRepository {
  final GetProductsDataSource dataSource;

  GetProductsRepository({required this.dataSource});

  Future<Either<Failure, ProductModel>> call() async {
    try {
      final result = await dataSource.call();
      return Right(result);
    } on HttpRequestException catch (e) {
      return Left(
        HttpRequestFailure(statusCode: e.statusCode, message: e.message),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(message: e.message),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
