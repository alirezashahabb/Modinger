import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/fonts.gen.dart';

import '../gen/assets.gen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        physics: defultScroll,
        slivers: [
          SliverToBoxAdapter(
            child: _getSearchBox(themeData),
          ),
          SliverToBoxAdapter(
            child: _getCatagoryList(themeData),
          ),
          // creat Grid for Explore Page
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                // margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/img/item$index.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }, childCount: 10),
            gridDelegate: SliverQuiltedGridDelegate(
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                pattern: [
                  const QuiltedGridTile(2, 1),
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                ]),
          )
        ],
      )),
    );
  }

  /// this method Creat CatagoryList
  Widget _getCatagoryList(ThemeData themeData) {
    return Container(
      height: 30,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 23),
      child: ListView.builder(
        physics: defultScroll,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xff272B40),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              'Technology $index',
              textAlign: TextAlign.center,
              style: themeData.textTheme.headline4!
                  .copyWith(fontFamily: FontFamily.gm, fontSize: 10),
            ),
          );
        },
      ),
    );
  }

  /// thsi method creat Search Box
  Widget _getSearchBox(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.fromLTRB(17, 20, 17, 20),
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xff272B40),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Assets.img.iconSearch.image(height: 20, width: 20),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle:
                      themeData.textTheme.headline4!.copyWith(fontSize: 12),
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Assets.img.iconScan.image(height: 20, width: 20),
          ),
        ],
      ),
    );
  }
}
