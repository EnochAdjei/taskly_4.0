import 'package:flutter/material.dart';
import 'package:taskly4_0/theme.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, required this.value, required this.onChanged});

  final bool? value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.primaryColor,
      value: value,
      onChanged: onChanged,
    );
  }
}
