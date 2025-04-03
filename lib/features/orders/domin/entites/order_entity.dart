import 'package:ecommercedashboard/core/enums/order_enum.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/order_product_entity.dart';
import 'package:ecommercedashboard/features/orders/domin/entites/shipping_address_entity.dart';

class OrderEntity {
  final num totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatus status;

  OrderEntity({
    required this.totalPrice,
    required this.uID,
    required this.status,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
