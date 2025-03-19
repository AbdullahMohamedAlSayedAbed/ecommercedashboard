import 'package:ecommercedashboard/core/utils/app_style.dart';
import 'package:ecommercedashboard/core/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
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
                text: 'is product organic?',
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


