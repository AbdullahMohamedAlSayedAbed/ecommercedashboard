
import 'package:ecommercedashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommercedashboard/features/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String dashboardView = 'dashboardView';
  static const String addProductView = 'addProductView';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardView:
        return MaterialPageRoute(builder: (context) => const DashboardView());
      case addProductView:
        return MaterialPageRoute(builder: (context) => const AddProductView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
