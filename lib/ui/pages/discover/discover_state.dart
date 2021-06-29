import '../../../domain/entities/entities.dart';

abstract class DiscoverState {}

class DiscoverSuccessState implements DiscoverState {
  final List<MusicEntity> listOfRecentMusics;
  final List<MusicEntity> listOfMostPlayedMusics;

  DiscoverSuccessState({
    required this.listOfMostPlayedMusics,
    required this.listOfRecentMusics,
  });
}

class DiscoverLoadingState implements DiscoverState {}

class DiscoverErrorState implements DiscoverState {}
