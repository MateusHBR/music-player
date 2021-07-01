import 'package:just_audio/just_audio.dart';

import '../../../ui/models/models.dart';
import '../../../ui/pages/music_player/music_player.dart';

class RxDartMusicPlayerPresenter implements MusicPlayerPresenter {
  AudioPlayer? _audioPlayer;

  @override
  Stream<MusicPlayerState> get stateOfSongThatIsPlaying =>
      _audioPlayer!.playerStateStream
          .map(
            (audioPlayerEvent) =>
                MusicPlayerState.fromJustAudiio(audioPlayerEvent),
          )
          .distinct();

  @override
  Stream<double> get volume => _audioPlayer!.volumeStream;

  @override
  void initState(String musicPath) {
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
}
