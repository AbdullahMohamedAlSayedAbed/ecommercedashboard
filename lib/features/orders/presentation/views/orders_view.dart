import 'package:ecommercedashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: OrdersViewBody(),
    );
  }
}
