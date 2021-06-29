import '../entities/entities.dart';

abstract class LoadMusics {
  Future<List<MusicEntity>> call();
}
