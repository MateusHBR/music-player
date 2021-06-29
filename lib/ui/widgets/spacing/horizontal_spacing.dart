import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double size;

  const HorizontalSpacing(
    this.size, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
