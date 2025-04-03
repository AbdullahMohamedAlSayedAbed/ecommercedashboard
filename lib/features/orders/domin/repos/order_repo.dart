import 'package:dartz/dartz.dart';
import 'package:ecommercedashboard/core/error/failers.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_entity.dart';

abstract class OrderRepo {
  Stream <Either<Failures, List<OrderEntity>>> getOrders();
}
