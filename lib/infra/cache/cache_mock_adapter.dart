import 'package:music_player/data/cache/cache.dart';
import 'package:music_player/data/models/cache_music_model.dart';

class CacheMockAdapter implements GetMusicsFromCacheStorage {
  final _imagesPath = "lib/ui/assets/images";

  @override
  Future<List<CacheMusicModel>> getMostPlayedCachedMusics() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      CacheMusicModel(
        bandName: 'Paramore',
        musicName: "Ain't Fun",
        imagePath: '$_imagesPath/aint_fun.png',
        musicPath: '/path/Paramore/music1',
      ),
      CacheMusicModel(
        bandName: 'Draft Punk',
        musicName: "Get Lucky",
        imagePath: '$_imagesPath/get_lucky.png',
        musicPath: '/path/DraftPunk/music1',
      ),
      CacheMusicModel(
        bandName: 'Nothing But Thieves',
        musicName: "Impossible",
        imagePath: '$_imagesPath/impossible.png',
        musicPath: '/path/Paramore/music1',
      ),
      CacheMusicModel(
        bandName: 'Depeche Mode',
        musicName: "Hole to Feed",
        imagePath: '$_imagesPath/hole_to_feed.png',
        musicPath: '/path/DraftPunk/music1',
      ),
    ];
  }

  @override
  Future<List<CacheMusicModel>> getRecentMusics() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      CacheMusicModel(
        bandName: 'Foo Fighters',
        musicName: "Making A Fire",
        imagePath: '$_imagesPath/making_a_fire.png',
        musicPath: '/path/Paramore/music1',
      ),
      CacheMusicModel(
        bandName: 'WOW',
        musicName: "Tiesto",
        imagePath: '$_imagesPath/wow.png',
        musicPath: '/path/DraftPunk/music1',
      ),
    ];
  }
}
