import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';

import '../../models/models.dart';
import '../../values/values.dart' as values;
import '../../widgets/widgets.dart';
import 'music_player_presenter.dart';

class MusicPlayerPage extends StatefulWidget {
  final MusicPlayerPresenter presenter;
  final MusicEntity music;

  MusicPlayerPage({
    Key? key,
    required this.presenter,
    required this.music,
  }) : super(key: key);

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState(presenter);
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final MusicPlayerPresenter presenter;

  _MusicPlayerPageState(this.presenter);

  @override
  void initState() {
    super.initState();
    presenter.initState(widget.music.musicPath);
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 44,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          _headerImage(context),
          _body(),
        ],
      ),
    );
  }

  Widget _headerImage(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Material(
          color: values.KColors.blue,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.music.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.all(21),
                  icon: Icon(
                    Icons.close,
                    color: values.KColors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const FooterBoxShadow(
                  colors: [
                    Colors.transparent,
                    values.KColors.blue,
                  ],
                  heigth: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Material(
          color: values.KColors.blue,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const VerticalSpacing(27),
                _musicNameAndBand(),
                const VerticalSpacing(26),
                _musicProgressBar(),
                const VerticalSpacing(22),
                _musicPayerActions(),
                const VerticalSpacing(22),
                _volume(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _musicNameAndBand() {
    return Column(
      children: [
        Text(
          widget.music.musicName,
          style: values.TextStyles.medium(),
        ),
        const VerticalSpacing(8),
        Text(
          widget.music.bandName,
          style: values.TextStyles.bodyRegular(),
        ),
      ],
    );
  }

  Widget _musicProgressBar() {
    return Column(
      children: [
        StreamBuilder<Duration>(
          stream: presenter.currentPositionAtMusicStream,
          initialData: Duration.zero,
          builder: (context, snapshot) {
            var actualMusicPositionInSeconds =
                snapshot.data!.inSeconds.toDouble();

            final musicDurationInSeconds = presenter.musicDurationInSeconds;

            if (actualMusicPositionInSeconds > musicDurationInSeconds) {
              actualMusicPositionInSeconds = musicDurationInSeconds;
            }

            return Slider(
              value: actualMusicPositionInSeconds,
              max: musicDurationInSeconds,
              onChanged: (musicTime) async => presenter.changeMusicTime(
                musicTime.toInt(),
              ),
              inactiveColor: values.KColors.white.withOpacity(0.38),
              activeColor: values.KColors.white,
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<Duration>(
              stream: presenter.currentPositionAtMusicStream,
              initialData: Duration.zero,
              builder: (context, snapshot) {
                final currentPositionAtMusicTime = snapshot.data!;
                return Text(
                  currentPositionAtMusicTime.inSeconds.toString(),
                  style: values.TextStyles.caption(),
                );
              },
            ),
            StreamBuilder<Duration>(
              stream: presenter.musicDurationStream,
              initialData: Duration.zero,
              builder: (context, snapshot) {
                final musicDuration = snapshot.data!;

                return Text(
                  musicDuration.inSeconds.toString(),
                  style: values.TextStyles.caption(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _musicPayerActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.skip_previous,
          size: 24,
          color: values.KColors.white.withOpacity(0.38),
        ),
        const HorizontalSpacing(34),
        _playButton(),
        const HorizontalSpacing(34),
        Icon(
          Icons.skip_next,
          size: 24,
          color: values.KColors.white.withOpacity(0.38),
        ),
      ],
    );
  }

  Widget _playButton() {
    return StreamBuilder<MusicPlayerState>(
      stream: presenter.stateOfSongThatIsPlayingStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data ?? MusicPlayerState.initial();

        if (!playerState.playing) {
          return IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.play_circle_fill,
              color: values.KColors.white,
            ),
            iconSize: 66,
            onPressed: presenter.play,
          );
        }

        if (playerState.status.isCompleted) {
          return IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.replay_circle_filled,
              color: values.KColors.white,
            ),
            iconSize: 66,
            onPressed: presenter.replay,
          );
        }

        return IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.pause_circle,
            color: values.KColors.white,
          ),
          iconSize: 66,
          onPressed: presenter.pause,
        );
      },
    );
  }

  Widget _volume() {
    return Row(
      children: [
        Icon(
          Icons.volume_down,
          size: 12,
          color: values.KColors.white.withOpacity(0.38),
        ),
        Flexible(child: _volumeSlider()),
        Icon(
          Icons.volume_up,
          size: 12,
          color: values.KColors.white.withOpacity(0.38),
        ),
      ],
    );
  }

  Widget _volumeSlider() {
    return StreamBuilder<double>(
      stream: presenter.volumeStream,
      initialData: 1.0,
      builder: (context, snapshot) {
        final volume = snapshot.data!;

        return Slider(
          max: 1,
          value: volume,
          onChanged: presenter.onVolumeChanged,
          inactiveColor: values.KColors.white.withOpacity(0.38),
          activeColor: values.KColors.white,
        );
      },
    );
  }
}
