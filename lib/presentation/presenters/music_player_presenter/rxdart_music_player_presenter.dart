import 'package:just_audio/just_audio.dart';

import '../../../ui/models/models.dart';
import '../../../ui/pages/music_player/music_player.dart';

class RxDartMusicPlayerPresenter implements MusicPlayerPresenter {
  AudioPlayer? _audioPlayer;

  @override
  Stream<MusicPlayerState> get stateOfSongThatIsPlayingStream =>
      _audioPlayer!.playerStateStream
          .map(
            (audioPlayerEvent) =>
                MusicPlayerState.fromJustAudiio(audioPlayerEvent),
          )
          .distinct();

  @override
  Stream<double> get volumeStream => _audioPlayer!.volumeStream;

  @override
  Stream<Duration> get musicDurationStream =>
      _audioPlayer!.durationStream.map((newTimeEvent) {
        if (newTimeEvent == null) {
          return Duration(seconds: 0, milliseconds: 0);
        }

        return newTimeEvent;
      });

  double get musicDurationInSeconds =>
      _audioPlayer!.duration?.inSeconds.toDouble() ?? 0.0;

  @override
  Stream<Duration> get currentPositionAtMusicStream =>
      _audioPlayer!.positionStream;

  @override
  void initState(String musicPath) async {
    _audioPlayer = AudioPlayer();

    _audioPlayer!.setAsset(musicPath);
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    _audioPlayer = null;
  }

  @override
  Future<void> pause() async {
    await _audioPlayer!.pause();
  }

  @override
  Future<void> play() async {
    await _audioPlayer!.play();
  }

  @override
  Future<void> replay() async {
    _audioPlayer!.seek(
      Duration.zero,
      index: _audioPlayer!.effectiveIndices!.first,
    );
  }

  @override
  Future<void> onVolumeChanged(double newVolume) async {
    await _audioPlayer!.setVolume(newVolume);
  }

  @override
  Future<void> changeMusicTime(int seconds) async {
    _audioPlayer!.seek(
      Duration(seconds: seconds),
      index: _audioPlayer!.effectiveIndices!.first,
    );
  }
}
