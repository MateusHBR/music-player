import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double size;

  const VerticalSpacing(
    this.size, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
