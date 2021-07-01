import 'package:just_audio/just_audio.dart';

enum ProcessingMusicStatus {
  idle,
  loading,
  buffering,
  ready,
  completed,
}

extension ProcessingMusicStatusExtension on ProcessingMusicStatus {
  bool get isInitializing {
    return this == ProcessingMusicStatus.loading ||
        this == ProcessingMusicStatus.buffering;
  }

  bool get isCompleted => this == ProcessingMusicStatus.completed;
}

extension JustAudioExtension on ProcessingState {
  ProcessingMusicStatus get convert {
    switch (this) {
      case ProcessingState.idle:
        return ProcessingMusicStatus.idle;
      case ProcessingState.loading:
        return ProcessingMusicStatus.loading;
      case ProcessingState.buffering:
        return ProcessingMusicStatus.buffering;
      case ProcessingState.ready:
        return ProcessingMusicStatus.ready;
      case ProcessingState.completed:
        return ProcessingMusicStatus.completed;
      default:
        return ProcessingMusicStatus.idle;
    }
  }
}
