import 'package:ecommercedashboard/core/services/get_it_service.dart';
import 'package:ecommercedashboard/features/orders/domin/repos/order_repo.dart';
import 'package:ecommercedashboard/features/orders/presentation/cubit/cubit/get_orders_cubit.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(getIt<OrderRepo>())..getOrders(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}
