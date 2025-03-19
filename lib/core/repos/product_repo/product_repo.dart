import 'package:dartz/dartz.dart';
import 'package:ecommercedashboard/core/error/failers.dart';
import 'package:ecommercedashboard/features/add_product/domin/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
