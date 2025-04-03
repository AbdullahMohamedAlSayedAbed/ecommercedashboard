import 'package:ecommercedashboard/features/orders/data/dummy/get_order_dummy_data.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/widgets/order_item_list_view.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        children: [
          SizedBox(height: 16),
          FilterSection(),
          Expanded(child: OrderItemListView(orders: getSampleOrders())),
        ],
      ),
    );
  }
}
