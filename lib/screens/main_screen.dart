import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/search_screen.dart';

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
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: mainColorLighter,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_home.png'),
              activeIcon: Image.asset('images/icon_active_home.png'),
              label: 'Item1',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_search_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_search_navigation_active.png'),
              label: 'Item2',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_add_navigation.png'),
              activeIcon: Image.asset('images/icon_add_navigation_active.png'),
              label: 'Item3',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_activity_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_activity_navigation_active.png'),
              label: 'Item4',
            ),
            BottomNavigationBarItem(
              icon: _getIconProfile(gray),
              activeIcon: _getIconProfile(pink),
              label: 'Item5',
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _getLayout(),
      ),
    );
  }

  Widget _getIconProfile(Color borderColor) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddScreen(),
      ActivityScreen(),
      ProfileScreen(),
    ];
  }
}
