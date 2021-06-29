import 'package:mocktail/mocktail.dart';
import 'package:music_player/data/models/models.dart';
import 'package:test/test.dart';

import 'package:music_player/data/cache/cache.dart';
import 'package:music_player/data/usecases/usecases.dart';

class GetMusicsFromCacheStorageSpy extends Mock
    implements GetMusicsFromCacheStorage {}

typedef MusicsExpectation = When<Future<List<CacheMusicModel>>>;

void main() {
  late GetMusicsFromCacheStorageSpy getMusicsCacheStorage;
  late LoadMostPlayerMusics sut;
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

  setUp(() {
    getMusicsCacheStorage = GetMusicsFromCacheStorageSpy();

    sut = LoadMostPlayerMusics(
      getMusicsCacheStorage: getMusicsCacheStorage,
    );
  });

  MusicsExpectation mockMostPlayedMusics() =>
      when(() => getMusicsCacheStorage.getMostPlayedCachedMusics());

  void mockMostPlayerMusicsSuccess() {
    mockMostPlayedMusics().thenAnswer(
      (_) async => loadedMusicsMock,
    );
  }

  test('should load most player musics', () async {
    mockMostPlayerMusicsSuccess();

    final musics = await sut.call();

    expect(
      musics,
      loadedMusicsMock.map((music) => music.toEntity()).toList(),
    );
  });
}
