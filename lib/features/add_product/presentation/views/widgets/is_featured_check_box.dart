import 'package:ecommercedashboard/core/utils/app_style.dart';
import 'package:ecommercedashboard/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IsFeaturedCheckBox extends StatefulWidget {

  final ValueChanged<bool> onChanged;

  const IsFeaturedCheckBox({super.key, required this.onChanged});

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is featured product?',
                style: AppStyle.body13Semibold.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
          },
        ),
      ],
    );
  }
}
