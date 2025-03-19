import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommercedashboard/core/error/failers.dart';
import 'package:ecommercedashboard/core/repos/product_repo/product_repo.dart';
import 'package:ecommercedashboard/core/services/database_service.dart';
import 'package:ecommercedashboard/core/utils/backend_endpoint.dart';
import 'package:ecommercedashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:ecommercedashboard/features/add_product/domin/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsCollection,
        data: AddProductInputModel.fromEntity(addProductEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure("Failed to add product"));
    }
  }
}
