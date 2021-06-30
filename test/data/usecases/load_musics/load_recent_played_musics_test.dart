import 'package:mocktail/mocktail.dart';
import 'package:music_player/domain/helpers/helpers.dart';
import 'package:test/test.dart';

import 'package:music_player/data/cache/cache.dart';
import 'package:music_player/data/models/models.dart';
import 'package:music_player/data/usecases/load_musics/load_musics.dart';

class GetMusicsFromCacheStorageSpy extends Mock
    implements GetMusicsFromCacheStorage {}

typedef MusicsExpectation = When<Future<List<CacheMusicModel>>>;

void main() {
  final loadedMusicsMock = [
    CacheMusicModel(
      bandName: 'Paramore',
      musicName: "Ain't Fun",
      imagePath: '/path/Paramore/image1',
      musicPath: '/path/Paramore/music1',
    ),
    CacheMusicModel(
      bandName: 'Draft Punk',
      musicName: "Get Lucky",
      imagePath: '/path/DraftPunk/image1',
      musicPath: '/path/DraftPunk/music1',
    ),
  ];

  late GetMusicsFromCacheStorageSpy getMusicsFromCacheStorage;
  late LoadRecentPlayedMusics sut;

  setUp(() {
    getMusicsFromCacheStorage = GetMusicsFromCacheStorageSpy();
    sut = LoadRecentPlayedMusics(
      getMusicsFromCacheStorage: getMusicsFromCacheStorage,
    );
  });

  MusicsExpectation mockRecentPlayedMusics() => when(
        () => getMusicsFromCacheStorage.getRecentMusics(),
      );

  void mockRecentPlayedMusicsSuccess() {
    mockRecentPlayedMusics().thenAnswer((invocation) async => loadedMusicsMock);
  }

  void mockRecentPlayedMusicsError() {
    mockRecentPlayedMusics().thenThrow(Exception());
  }

  test('should load recent played musics', () async {
    mockRecentPlayedMusicsSuccess();

    final recentPlayedMusics = await sut();

    expect(
      recentPlayedMusics,
      loadedMusicsMock.map((music) => music.toEntity()).toList(),
    );
  });

  test('should throw Unexpected error if music cache throws', () async {
    mockRecentPlayedMusicsError();

    final future = sut.call();

    expect(future, throwsA(DomainError.unexpected));
  });
}
