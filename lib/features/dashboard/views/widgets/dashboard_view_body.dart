import 'package:ecommercedashboard/core/helper/on_generate_router.dart';
import 'package:ecommercedashboard/core/widgets/custom_buttton.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.addProductView);
            },
            text: 'Add Product',
          ),
        ],
      ),
    );
  }
}
