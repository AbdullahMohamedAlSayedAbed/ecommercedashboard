import 'package:ecommercedashboard/core/widgets/custom_error_widget.dart';
import 'package:ecommercedashboard/features/orders/data/dummy/get_order_dummy_data.dart';
import 'package:ecommercedashboard/features/orders/presentation/cubit/cubit/get_orders_cubit.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBlocBuilder extends StatelessWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersFailure) {
          return CustomErrorWidget(text: state.errorMessage);
        } else if (state is GetOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else {
          return Skeletonizer(child: OrdersViewBody(orders: getSampleOrders()));
        }
      },
    );
  }
}
