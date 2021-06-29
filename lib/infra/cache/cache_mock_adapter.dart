import 'package:music_player/data/cache/cache.dart';
import 'package:music_player/data/models/cache_music_model.dart';

class CacheMockAdapter implements GetMusicsFromCacheStorage {
  @override
  Future<List<CacheMusicModel>> getMostPlayedCachedMusics() async {
    return [
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
  }

  @override
  Future<List<CacheMusicModel>> getRecentMusics() async {
    return [
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
  }
}
