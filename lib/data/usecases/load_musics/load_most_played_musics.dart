import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

import '../../cache/cache.dart';

class LoadMostPlayerMusics implements LoadMusics {
  final GetMusicsFromCacheStorage getMusicsCacheStorage;

  LoadMostPlayerMusics({required this.getMusicsCacheStorage});

  @override
  Future<List<MusicEntity>> call() async {
    try {
      final cachedMusics =
          await getMusicsCacheStorage.getMostPlayedCachedMusics();

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
