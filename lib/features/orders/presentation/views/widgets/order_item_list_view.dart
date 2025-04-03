import 'package:ecommercedashboard/features/orders/domin/entites/order_entity.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
      return OrderItemWidget(order: orders[index]);
    });
  }
}
