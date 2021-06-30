import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:music_player/data/usecases/usecases.dart';

import 'package:music_player/domain/entities/entities.dart';

import 'package:music_player/presentation/presenters/presenters.dart';

class LoadMostPlayedMusicsSpy extends Mock implements LoadMostPlayedMusics {}

class LoadRecentPlayedMusicsSpy extends Mock implements LoadRecentPlayedMusics {
}

typedef MusicsExpectation = When<Future<List<MusicEntity>>>;
void main() {
  late LoadMostPlayedMusicsSpy loadMostPlayedMusicsUseCase;
  late LoadRecentPlayedMusicsSpy loadRecentPlayedMusicsUseCase;
  late RxDartDiscoverPresenter sut;

  MusicsExpectation mockRecentPlayedMusics() =>
      when(() => loadRecentPlayedMusicsUseCase());

  MusicsExpectation mockMostPlayedMusics() =>
      when(() => loadMostPlayedMusicsUseCase());

  void loadRecentPlayedMusicsSuccess() {
    mockRecentPlayedMusics().thenAnswer((_) async => []);
  }

  void loadMostPlayedMusicsSuccess() {
    mockMostPlayedMusics().thenAnswer((_) async => []);
  }

  setUp(() {
    loadMostPlayedMusicsUseCase = LoadMostPlayedMusicsSpy();
    loadRecentPlayedMusicsUseCase = LoadRecentPlayedMusicsSpy();
    sut = RxDartDiscoverPresenter(
      loadMostPlayedMusicsUseCase: loadMostPlayedMusicsUseCase,
      loadRecentPlayedMusicsUseCase: loadRecentPlayedMusicsUseCase,
    );

    loadRecentPlayedMusicsSuccess();
    loadMostPlayedMusicsSuccess();
  });

  test(
      'should call loadMostPlayedMusicsUsecase and loadRecentPlayedMusicsUseCase when load musics be called',
      () async {
    await sut.loadMusics();

    verify(() => loadMostPlayedMusicsUseCase()).called(1);
    verify(() => loadRecentPlayedMusicsUseCase()).called(1);
  });
}
