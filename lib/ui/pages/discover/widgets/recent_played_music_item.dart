import 'package:flutter/material.dart';
import 'package:music_player/ui/values/values.dart';
import 'package:music_player/ui/widgets/widgets.dart';

class RecentPlayedMusicItem extends StatelessWidget {
  final String bandName;
  final String musicName;
  final String imagePath;
  final Function()? onLongPressed;

  RecentPlayedMusicItem({
    Key? key,
    required this.bandName,
    required this.musicName,
    required this.onLongPressed,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onLongPress: onLongPressed,
                child: Container(
                  height: 230,
                  width: 208,
                ),
              ),
            ),
          ),
          _positionedFooterBoxShadow(),
          Positioned(
            bottom: 12,
            right: 0,
            left: 0,
            child: IgnorePointer(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 12,
                  right: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_fill,
                      size: 24,
                      color: KColors.white.withOpacity(0.6),
                    ),
                    const HorizontalSpacing(8),
                    _musicNameAndBand(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _musicNameAndBand() {
    return Flexible(
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
        text: TextSpan(
          text: musicName,
          style: TextStyles.supertitle(),
          children: [
            TextSpan(
              text: ' ',
            ),
            TextSpan(
              text: bandName,
              style: TextStyles.supertitleMedium(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _positionedFooterBoxShadow() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: const FooterBoxShadow(
        heigth: 56,
        colors: [
          Colors.transparent,
          KColors.black,
        ],
      ),
    );
  }
}
