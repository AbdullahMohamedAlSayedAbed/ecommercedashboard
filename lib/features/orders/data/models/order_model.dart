import 'package:ecommercedashboard/features/orders/data/models/order_product_model.dart';
import 'package:ecommercedashboard/features/orders/data/models/shipping_address_model.dart';

class OrderModel {
  final num totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uID,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      orderProducts:
          (json['orderProducts'] as List)
              .map((e) => OrderProductModel.fromJson(e))
              .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'totalPrice': totalPrice,
      'uID': uID,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddress.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
  OrderModel toEntity() {
    return OrderModel(
      totalPrice: totalPrice,
      uID: uID,
      shippingAddress: shippingAddress.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }
}
