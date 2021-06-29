import '../../../data/cache/cache.dart';
import '../../../domain/entities/music_entity.dart';
import '../../../domain/usecases/usecases.dart';

class LoadRecentMusics implements LoadMusics {
  final GetMusicsFromCacheStorage getMusicsFromCacheStorage;

  LoadRecentMusics({
    required this.getMusicsFromCacheStorage,
  });

  @override
  Future<List<MusicEntity>> call() async {
    final recentMusics = await getMusicsFromCacheStorage.getRecentMusics();

    return recentMusics
        .map(
          (music) => music.toEntity(),
        )
        .toList();
  }
}
