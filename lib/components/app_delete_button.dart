import 'package:flutter/material.dart';

class AppDeleteButton extends StatelessWidget {
  const AppDeleteButton({super.key, required this.onPress});

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress, child: Icon(Icons.delete));
  }
}
