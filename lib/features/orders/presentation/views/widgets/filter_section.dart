import 'package:ecommercedashboard/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        spacing: 16,
        children: [
          const Icon(Icons.filter_list, size: 24),
          Text('Filter', style: AppStyle.body17Bold),
        ],
      ),
    );
  }
}
