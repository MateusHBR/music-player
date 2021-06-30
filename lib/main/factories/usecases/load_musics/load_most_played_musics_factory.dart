import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';

import '../../factories.dart';

LoadMusics makeMostPlayedMusics() {
  return LoadMostPlayedMusics(
    getMusicsFromCacheStorage: makeCacheMockAdapter(),
  );
}
