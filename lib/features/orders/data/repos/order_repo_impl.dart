import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommercedashboard/core/error/failers.dart';
import 'package:ecommercedashboard/core/services/database_service.dart';
import 'package:ecommercedashboard/core/utils/backend_endpoint.dart';
import 'package:ecommercedashboard/features/orders/data/models/order_model.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_entity.dart';
import 'package:ecommercedashboard/features/orders/domin/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;
  OrderRepoImpl({required this.databaseService});
  @override
  Stream<Either<Failures, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var response in databaseService.streamData(
        path: BackendEndpoint.getOrder,
      )) {
        List<OrderEntity> orders =
            (response as List<dynamic>)
                .map((e) => OrderModel.fromJson(e).toEntity())
                .toList();
        yield Right(orders);
      }
    } catch (e) {
      log(e.toString());
      yield Left(ServerFailure(e.toString()));
    }
  }
}
