import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LoadMostPlayerMusics implements LoadMusics {
  final GetMusicsFromCacheStorage getMusicsCacheStorage;

  LoadMostPlayerMusics({required this.getMusicsCacheStorage});

  @override
  Future<List<MusicEntity>> call() async {
    final cachedMusics =
        await getMusicsCacheStorage.getMostPlayedCachedMusics();

    return cachedMusics
        .map(
          (music) => music.toEntity(),
        )
        .toList();
  }
}
