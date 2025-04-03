import 'package:ecommercedashboard/features/orders/data/models/order_product_model.dart';
import 'package:ecommercedashboard/features/orders/data/models/shipping_address_model.dart';

class OrderEntity {
  final num totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uID,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
