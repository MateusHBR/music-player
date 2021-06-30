import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:music_player/ui/pages/discover/discover.dart';
import 'package:music_player/ui/widgets/widgets.dart';

class DiscoverPresenterSpy extends Mock implements DiscoverPresenter {}

void main() {
  late DiscoverPresenter presenter;
  late StreamController<bool> opacityIsNotDisplayingBodyController;
  late StreamController<DiscoverState> discoverScreenStateController;

  void initializeStreams() {
    opacityIsNotDisplayingBodyController = StreamController<bool>();
    discoverScreenStateController = StreamController<DiscoverState>();
  }

  void mockStreams() {
    when(
      () => presenter.opacityIsNotDisplayingBody,
    ).thenAnswer(
      (_) => opacityIsNotDisplayingBodyController.stream,
    );

    when(
      () => presenter.discoverScreenState,
    ).thenAnswer(
      (_) => discoverScreenStateController.stream,
    );
  }

  void closeStreams() {
    opacityIsNotDisplayingBodyController.close();
    discoverScreenStateController.close();
  }

  Future<void> loadPage(WidgetTester tester) async {
    presenter = DiscoverPresenterSpy();

    initializeStreams();
    mockStreams();

    when(() => presenter.loadMusics()).thenAnswer((_) async => {});

    final discoverPage = MaterialApp(
      home: DiscoverPage(
        presenter: presenter,
      ),
    );

    await tester.pumpWidget(discoverPage);
  }

  tearDown(() {
    closeStreams();
  });

  testWidgets('should load with correct initial screen state',
      (WidgetTester tester) async {
    await loadPage(tester);

    final arrowBackButton = find.descendant(
      of: find.byType(InkWell),
      matching: find.byIcon(Icons.arrow_back),
    );

    expect(arrowBackButton, findsOneWidget);

    final discoverText = find.text('Discover');

    expect(discoverText, findsOneWidget);

    final searchTextField = find.byType(SearchTextField);

    expect(searchTextField, findsOneWidget);

    await tester.enterText(searchTextField, 'Roses');

    expect(find.text('Roses'), findsOneWidget);

    final boxShadowWidget = find.byType(FooterBoxShadow);

    expect(boxShadowWidget, findsOneWidget);

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    expect(circularProgressIndicator, findsOneWidget);

    final recentPlayedMusicItem = find.byType(RecentPlayedMusicItem);

    expect(recentPlayedMusicItem, findsNothing);

    final mostPlayedMusicItem = find.byType(MostPlayedMusicItem);

    expect(mostPlayedMusicItem, findsNothing);
  });
}