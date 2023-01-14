import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/screens/activity_screen.dart';
import 'package:instageram/screens/home_screens.dart';
import 'package:instageram/screens/profile_screen.dart';
import 'package:instageram/screens/search_screens.dart';
import 'package:instageram/screens/share_post.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
            backgroundColor: mianColor,
            items: [
              BottomNavigationBarItem(
                  icon: Assets.img.iconHome.image(height: 25, width: 25),
                  activeIcon:
                      Assets.img.iconActiveHome.image(height: 25, width: 25),
                  label: 'item1'),
              BottomNavigationBarItem(
                  icon: Assets.img.iconSearch.image(height: 25, width: 25),
                  activeIcon: Assets.img.iconSearchNavigationActive
                      .image(height: 25, width: 25),
                  label: 'item1'),
              BottomNavigationBarItem(
                  icon:
                      Assets.img.iconAddNavigation.image(height: 25, width: 25),
                  activeIcon: Assets.img.iconAddNavigationActive
                      .image(height: 25, width: 25),
                  label: 'item1'),
              BottomNavigationBarItem(
                  icon: Assets.img.iconActivityNavigation
                      .image(height: 25, width: 25),
                  activeIcon: Assets.img.iconActivityNavigationActive
                      .image(height: 25, width: 25),
                  label: 'item1'),
              BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: secoundryTextColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Assets.img.alireza.image(width: 66, height: 66),
                    ),
                  ),
                  activeIcon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: secoundColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Assets.img.alireza.image(width: 66, height: 66),
                    ),
                  ),
                  label: 'item1'),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _getListWidget(),
      ),
    );
  }

  List<Widget> _getListWidget() {
    return <Widget>[
      const HomswScreens(),
      const SearchScreen(),
      const SharePostScreen(),
      const ActivityScreen(),
      const ProfileScreen()
    ];
  }
}
