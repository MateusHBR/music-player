import '../../../data/cache/cache.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/entities/music_entity.dart';
import '../../../domain/usecases/usecases.dart';

class LoadRecentPlayedMusics implements LoadMusics {
  final GetMusicsFromCacheStorage getMusicsFromCacheStorage;

  LoadRecentPlayedMusics({
    required this.getMusicsFromCacheStorage,
  });

  @override
  Future<List<MusicEntity>> call() async {
    try {
      final recentMusics = await getMusicsFromCacheStorage.getRecentMusics();

      return recentMusics
          .map(
            (music) => music.toEntity(),
          )
          .toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
