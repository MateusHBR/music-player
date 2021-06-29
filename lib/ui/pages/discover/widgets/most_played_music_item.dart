import 'package:flutter/material.dart';

import '../../../../ui/values/values.dart';
import '../../../../ui/widgets/widgets.dart';

class MostPlayedMusicItem extends StatelessWidget {
  final String bandName;
  final String musicName;

  MostPlayedMusicItem({
    Key? key,
    required this.bandName,
    required this.musicName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const VerticalSpacing(8),
        RichText(
          text: TextSpan(
            text: bandName,
            style: TextStyles.body(),
            children: [
              TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: musicName,
                style: TextStyles.bodyRegular(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
