import 'package:mocktail/mocktail.dart';
import 'package:music_player/domain/helpers/domain_error.dart';
import 'package:music_player/ui/pages/discover/discover.dart';
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

  final listOfMostPlayedMusicsMock = [
    MusicEntity(
      bandName: 'Paramore',
      musicName: "Ain't Fun",
      imagePath: '/path/Paramore/image1',
      musicPath: '/path/Paramore/music1',
    ),
    MusicEntity(
      bandName: 'Draft Punk',
      musicName: "Get Lucky",
      imagePath: '/path/DraftPunk/image1',
      musicPath: '/path/DraftPunk/music1',
    ),
  ];

  final listOfRecentPlayedMusicsMock = [
    MusicEntity(
      bandName: 'Paramore',
      musicName: "Ain't Fun",
      imagePath: '/path/Paramore/image1',
      musicPath: '/path/Paramore/music1',
    ),
    MusicEntity(
      bandName: 'Draft Punk',
      musicName: "Get Lucky",
      imagePath: '/path/DraftPunk/image1',
      musicPath: '/path/DraftPunk/music1',
    ),
  ];

  MusicsExpectation mockRecentPlayedMusics() =>
      when(() => loadRecentPlayedMusicsUseCase());

  void loadRecentPlayedMusicsSuccess() {
    mockRecentPlayedMusics()
        .thenAnswer((_) async => listOfRecentPlayedMusicsMock);
  }

  void loadRecentPlayedMusicsError() {
    mockRecentPlayedMusics().thenThrow(DomainError.unexpected);
  }

  MusicsExpectation mockMostPlayedMusics() =>
      when(() => loadMostPlayedMusicsUseCase());

  void loadMostPlayedMusicsSuccess() {
    mockMostPlayedMusics().thenAnswer((_) async => listOfMostPlayedMusicsMock);
  }

  void loadMostPlayedMusicsError() {
    mockMostPlayedMusics().thenThrow(DomainError.unexpected);
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

  test(
      'should emits error state and error message when loadMostPlayedMusicsUseCase throws',
      () async {
    loadMostPlayedMusicsError();

    await sut.loadMusics();

    sut.discoverScreenState.listen(
      expectAsync1(
        (newState) {
          final currentStateIsError = newState is DiscoverErrorState;

          expect(currentStateIsError, true);
        },
      ),
    );
  });
  test(
      'should emits error state and error message when loadRecentPlayedMusicsUseCase throws',
      () async {
    loadRecentPlayedMusicsError();

    await sut.loadMusics();

    sut.discoverScreenState.listen(
      expectAsync1(
        (newState) {
          final currentStateIsError = newState is DiscoverErrorState;

          expect(currentStateIsError, true);
        },
      ),
    );
  });
}
