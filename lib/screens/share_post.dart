import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';

class SharePostScreen extends StatelessWidget {
  const SharePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            physics: defultScroll,
            slivers: [
              SliverToBoxAdapter(
                child: _getHeader(themeData),
              ),
              SliverToBoxAdapter(child: _getMoon()),
              SliverPadding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      height: 128,
                      width: 128,
                      child: Image.asset('assets/img/post$index.png'),
                    );
                  }, childCount: 9),
                  gridDelegate: SliverQuiltedGridDelegate(
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      pattern: [
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ]),
                ),
              )
            ],
          ),
          _gretFotter(themeData),
        ],
      )),
    );
  }

  /// this method creat footer
  Widget _gretFotter(ThemeData themeData) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Color(0xff272B40),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 10, 17, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Draft',
              style:
                  themeData.textTheme.headline4!.copyWith(color: secoundColor),
            ),
            Text('Gallery', style: themeData.textTheme.headline4),
            Text('Take', style: themeData.textTheme.headline4)
          ],
        ),
      ),
    );
  }

  /// this method creat moon photo
  Widget _getMoon() {
    return Container(
      margin: const EdgeInsets.fromLTRB(17, 0, 17, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Assets.img.moon.image(),
      ),
    );
  }

  /// this method creat post and next icon on Header
  Widget _getHeader(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 20, 17, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Post',
                style: themeData.textTheme.headline4,
              ),
              const SizedBox(
                width: 15,
              ),
              Assets.img.iconArrowDown.image(),
            ],
          ),
          Row(
            children: [
              Text(
                'Next',
                style: themeData.textTheme.headline4,
              ),
              const SizedBox(
                width: 15,
              ),
              Assets.img.iconArrowRightBox.image(),
            ],
          ),
        ],
      ),
    );
  }
}
