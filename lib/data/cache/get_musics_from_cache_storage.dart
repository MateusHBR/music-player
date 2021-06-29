import '../models/cache_music_model.dart';

abstract class GetMusicsFromCacheStorage {
  Future<List<CacheMusicModel>> getMostPlayedCachedMusics();
  Future<List<CacheMusicModel>> getRecentMusics();
}
