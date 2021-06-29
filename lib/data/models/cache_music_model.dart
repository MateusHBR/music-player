import 'package:music_player/domain/entities/entities.dart';

class CacheMusicModel {
  final String musicPath;
  final String imagePath;
  final String musicName;
  final String bandName;

  CacheMusicModel({
    required this.musicPath,
    required this.imagePath,
    required this.musicName,
    required this.bandName,
  });

  MusicEntity toEntity() {
    return MusicEntity(
      bandName: bandName,
      imagePath: imagePath,
      musicName: musicName,
      musicPath: musicPath,
    );
  }
}
