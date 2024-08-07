import 'package:flutter/material.dart';

import '../utils/color_utility.dart';

class CustomContainer extends StatelessWidget {
  final Color containerColor;
  final Widget? child;
  final double? height;

  final EdgeInsetsGeometry? margin;

  const CustomContainer(
      {required this.containerColor,
      required this.child,
      this.height,
      this.margin,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(8),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorUtility.purple),
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
