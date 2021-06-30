import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';

import '../../factories.dart';

LoadMusics makeRecentPlayedMusics() {
  return LoadRecentPlayedMusics(
    getMusicsFromCacheStorage: makeCacheMockAdapter(),
  );
}
