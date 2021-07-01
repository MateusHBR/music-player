import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

import '../enums/enums.dart';

class MusicPlayerState extends Equatable {
  final bool playing;
  final ProcessingMusicStatus status;

  MusicPlayerState({
    required this.playing,
    required this.status,
  });

  MusicPlayerState.initial({
    this.playing = false,
    this.status = ProcessingMusicStatus.idle,
  });

  @override
  List<Object?> get props => [this.playing, this.status];

  factory MusicPlayerState.fromJustAudiio(PlayerState? playerState) {
    if (playerState == null) return MusicPlayerState.initial();

    return MusicPlayerState(
      playing: playerState.playing,
      status: playerState.processingState.convert,
    );
  }
}
