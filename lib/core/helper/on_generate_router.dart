
import 'package:ecommercedashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommercedashboard/features/dashboard/views/dashboard_view.dart';
import 'package:ecommercedashboard/features/orders/presentation/views/orders_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String dashboardView = 'dashboardView';
  static const String addProductView = 'addProductView';
  static const String ordersView = 'ordersView';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardView:
        return MaterialPageRoute(builder: (context) => const DashboardView());
      case addProductView:
        return MaterialPageRoute(builder: (context) => const AddProductView());
      case ordersView:
        return MaterialPageRoute(builder: (context) => const OrdersView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
