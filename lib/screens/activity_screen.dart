import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/model/enum/activity_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 68,
            color: mianColor,
            child: TabBar(
              labelStyle: themeData.textTheme.headline4,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 18),
              indicatorColor: secoundColor,
              controller: _controller,
              tabs: const [
                Tab(
                  text: 'You',
                ),
                Tab(
                  text: 'Fallowing',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                CustomScrollView(
                  physics: defultScroll,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Text(
                          'New',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(themeData, ActivityStatus.fallowBack);
                      }, childCount: 2),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Text(
                          'Tody',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(themeData, ActivityStatus.liked);
                      }, childCount: 8),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Text(
                          'This week',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(themeData, ActivityStatus.massage);
                      }, childCount: 3),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(themeData, ActivityStatus.liked);
                      }, childCount: 100),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _getRow(ThemeData themeData, ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
                color: secoundColor, shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 7,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Assets.img.profile.image(height: 40, width: 40),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'amirahmadadibii',
                    style:
                        themeData.textTheme.headline4!.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Started following',
                      style: themeData.textTheme.subtitle1),
                ],
              ),
              Row(
                children: [
                  Text('You', style: themeData.textTheme.subtitle1),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('3min', style: themeData.textTheme.subtitle1),
                ],
              ),
            ],
          ),
          const Spacer(),
          getAction(status, themeData)
        ],
      ),
    );
  }

  /// this method show Activity Satrus
  Widget getAction(ActivityStatus status, ThemeData themeData) {
    switch (status) {
      case ActivityStatus.massage:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: secoundryTextColor),
          ),
          onPressed: () {},
          child: Text('Massage',
              style: themeData.textTheme.headline4!.copyWith(fontSize: 12)),
        );
      case ActivityStatus.fallowBack:
        return ElevatedButton(
          onPressed: () {},
          child: const Text('Follow'),
        );
      case ActivityStatus.liked:
        return Assets.img.item7.image(height: 40, width: 40);
      default:
        return Assets.img.item7.image(height: 40, width: 40);
    }
  }
}
