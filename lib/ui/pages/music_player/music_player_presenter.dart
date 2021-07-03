import 'package:music_player/ui/models/states/states.dart';

abstract class MusicPlayerPresenter {
  Stream<MusicPlayerState> get stateOfSongThatIsPlayingStream;
  Stream<double> get volumeStream;
  Stream<Duration> get musicDurationStream;
  double get musicDurationInSeconds;
  Stream<Duration> get currentPositionAtMusicStream;

  void initState(String musicPath);
  void dispose();
  Future<void> play();
  Future<void> pause();
  Future<void> replay();
  Future<void> onVolumeChanged(double newVolume);
}
