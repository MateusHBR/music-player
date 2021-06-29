import 'package:equatable/equatable.dart';

class MusicEntity extends Equatable {
  final String musicPath;
  final String imagePath;
  final String musicName;
  final String bandName;

  MusicEntity({
    required this.musicPath,
    required this.imagePath,
    required this.musicName,
    required this.bandName,
  });

  @override
  List<Object?> get props => [
        musicPath,
        imagePath,
        musicName,
        bandName,
      ];
}
