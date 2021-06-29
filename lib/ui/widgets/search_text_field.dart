import 'package:flutter/material.dart';

import '../values/values.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;

  SearchTextField({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.bodyRegular(),
      decoration: fieldDecoration,
    );
  }

  InputDecoration get fieldDecoration => InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.body2Thin(),
        fillColor: KColors.white.withOpacity(0.20),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: KColors.white.withOpacity(0.6),
        ),
      );
}
