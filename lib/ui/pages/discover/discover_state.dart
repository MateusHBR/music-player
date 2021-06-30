import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

abstract class DiscoverState {}

class DiscoverSuccessState extends Equatable implements DiscoverState {
  final List<MusicEntity> listOfRecentPlayedMusics;
  final List<MusicEntity> listOfMostPlayedMusics;

  DiscoverSuccessState({
    required this.listOfMostPlayedMusics,
    required this.listOfRecentPlayedMusics,
  });

  @override
  List<Object?> get props => [listOfMostPlayedMusics, listOfRecentPlayedMusics];
}

class DiscoverLoadingState extends Equatable implements DiscoverState {
  List<Object?> get props => [];
}

class DiscoverErrorState extends Equatable implements DiscoverState {
  List<Object?> get props => [];
}
