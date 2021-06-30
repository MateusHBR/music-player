import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LoadMostPlayedMusics implements LoadMusics {
  final GetMusicsFromCacheStorage getMusicsFromCacheStorage;

  LoadMostPlayedMusics({required this.getMusicsFromCacheStorage});

  @override
  Future<List<MusicEntity>> call() async {
    try {
      final cachedMusics =
          await getMusicsFromCacheStorage.getMostPlayedCachedMusics();

      return cachedMusics
          .map(
            (music) => music.toEntity(),
          )
          .toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
