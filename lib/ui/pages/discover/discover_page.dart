import 'package:flutter/material.dart';

import '../../values/values.dart';
import '../../widgets/widgets.dart';

import 'widgets/widgets.dart';
import 'discover_presenter.dart';

class DiscoverPage extends StatefulWidget {
  final DiscoverPresenter? presenter;

  DiscoverPage({Key? key, this.presenter}) : super(key: key);
  // DiscoverPage({Key? key, required this.presenter}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState(this.presenter);
}

class _DiscoverPageState extends State<DiscoverPage> {
  final DiscoverPresenter? presenter;

  _DiscoverPageState(this.presenter);

  @override
  void initState() {
    super.initState();
    presenter?.loadMusics();
  }

  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard,
      child: Scaffold(
        backgroundColor: KColors.blue,
        appBar: _customAppBar(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    KColors.blue,
                    KColors.blueDark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _header(),
                  _body(context),
                ],
              ),
            ),
            _footerPositionedBoxShadow(),
          ],
        ),
      ),
    );
  }

  PreferredSize _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(64),
      child: SafeArea(
        top: true,
        child: Container(
          color: KColors.blue,
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.arrow_back,
                    color: KColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyles.heading1(),
          ),
          const VerticalSpacing(16),
          SearchTextField(
            hintText: 'Pesquisar',
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    var isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return StreamBuilder<bool>(
      initialData: false,
      stream: presenter?.isLoading,
      builder: (context, snapshot) {
        final isLoading = snapshot.data!;

        if (isLoading) {
          return _loadingWidget();
        }

        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: isKeyboardVisible ? 0 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacing(24),
              _recentPlayedMusics(),
              const VerticalSpacing(40),
              _mostPlayed(),
            ],
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Container(
      height: 400,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(KColors.white),
      ),
    );
  }

  Widget _recentPlayedMusics() {
    return Container(
      height: 230,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (_, __) => const HorizontalSpacing(8),
        itemBuilder: (context, index) {
          return RecentPlayedMusicItem(
            imagePath: '',
            musicName: 'Making A Fire',
            bandName: 'Foo Fighter',
            onLongPressed: () {
              print('called');
            },
          );
        },
      ),
    );
  }

  Widget _mostPlayed() {
    final itemCount = 4;

    final sizeOfXAxisMultipliedByItemSize =
        ((itemCount / 2.0).roundToDouble() * 188);
    final sizeOfItemSpacingMultipliedByMainAxisSpacing =
        ((itemCount + 1 / 2.0) * 16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Played',
            style: TextStyles.medium(),
          ),
          const VerticalSpacing(24),
          Container(
            height: sizeOfXAxisMultipliedByItemSize +
                sizeOfItemSpacingMultipliedByMainAxisSpacing,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 160 / 188,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
              ),
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return MostPlayedMusicItem(
                  bandName: "Ain't Fun",
                  musicName: " Paramore",
                );
              },
            ),
          ),
          const VerticalSpacing(24),
        ],
      ),
    );
  }

  Widget _footerPositionedBoxShadow() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: const FooterBoxShadow(
        heigth: 160,
        colors: [
          Colors.transparent,
          KColors.lightBlack,
        ],
      ),
    );
  }
}
