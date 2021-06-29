import 'package:flutter/material.dart';

class FooterBoxShadow extends StatelessWidget {
  final List<Color> colors;
  final double heigth;

  const FooterBoxShadow({
    Key? key,
    required this.colors,
    required this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: heigth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
