import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: defultScroll,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 18),
                    child: Icon(Icons.menu),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: mianColor),
                  ),
                ),
                backgroundColor: mianColor,
                expandedHeight: 250,
                flexibleSpace: Assets.img.wall.image(fit: BoxFit.cover),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(themeData),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarDaligate(TabBar(
                      labelStyle: themeData.textTheme.headline4,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 18),
                      indicatorColor: secoundColor,
                      tabs: [
                        Tab(
                          icon: Assets.img.iconTabPosts.image(),
                        ),
                        Tab(
                          icon: Assets.img.iconTabBookmark.image(),
                        ),
                      ])))
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                physics: defultScroll,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20),
                    sliver: SliverGrid(
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
                      }, childCount: 9),
                      gridDelegate: SliverQuiltedGridDelegate(
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          pattern: [
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(2, 2),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                          ]),
                    ),
                  )
                ],
              ),
              CustomScrollView(
                physics: defultScroll,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          // margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/img/post$index.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }, childCount: 9),
                      gridDelegate: SliverQuiltedGridDelegate(
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          pattern: [
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 1),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(width: 2, color: secoundColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Assets.img.alireza.image(width: 66, height: 66),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'علیرضا برنامه نویس موبایل',
                    style: themeData.textTheme.bodyText1!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('َAlirezashahabb',
                      style: themeData.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const Spacer(),
              Assets.img.iconProfileEdit.image()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('برنامه نویسی یعنی اینده و تاثیر گذاری',
              style: themeData.textTheme.bodyText1!.copyWith(fontSize: 12)),
          const SizedBox(
            height: 7,
          ),
          Text('#Flutter_developer',
              style: themeData.textTheme.bodyText1!.copyWith(fontSize: 12)),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Assets.img.develop.image(),
              const SizedBox(
                width: 5,
              ),
              Text(
                'developer',
                style: themeData.textTheme.subtitle1,
              ),
              const SizedBox(
                width: 15,
              ),
              Assets.img.loction.image(),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Rafsanjan',
                style: themeData.textTheme.subtitle1,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '10',
                    style: themeData.textTheme.headline4,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Posts',
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '10K',
                    style: themeData.textTheme.headline4,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Fallower',
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '280',
                    style: themeData.textTheme.headline4,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Fallowing',
                    style: themeData.textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          Center(
            child: SizedBox(
              height: 46,
              width: 346,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 2, color: secoundryTextColor)),
                  onPressed: () {},
                  child: Text(
                    'Insights',
                    style: themeData.textTheme.headline4,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class TabBarDaligate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  TabBarDaligate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: mianColor, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
