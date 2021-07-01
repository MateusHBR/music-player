import 'package:music_player/ui/models/states/states.dart';

abstract class MusicPlayerPresenter {
  Stream<MusicPlayerState> get stateOfSongThatIsPlaying;
  Stream<double> get volume;

  void initState(String musicPath);
  void dispose();
  Future<void> play();
  Future<void> pause();
  Future<void> replay();
  Future<void> onVolumeChanged(double newVolume);
}
