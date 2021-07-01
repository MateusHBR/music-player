import 'package:music_player/ui/models/states/states.dart';

abstract class MusicPlayerPresenter {
  Stream<MusicPlayerState> get stateOfSongThatIsPlaying;

  void initState(String musicPath);
  void dispose();
  Future<void> play();
  Future<void> pause();
  Future<void> replay();
}
