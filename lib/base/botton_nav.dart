import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:freshy_food/colors.dart';
import 'package:freshy_food/screens/favorites_screen.dart';
import 'package:freshy_food/screens/home_screen.dart';
import 'package:freshy_food/screens/info_screen.dart';
import 'package:freshy_food/screens/my_list.dart';
import 'package:freshy_food/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final appScreens = [
    HomeScreen(),
    FavoritesScreen(),
    MyListScreen(),
    InfoScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.primaryGreen,
        selectedItemColor: CustomColors.darkGreen,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_star_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_star_regular),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_text_edit_style_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_text_edit_style_regular),
            label: "Recipes"
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_info_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_info_regular),
            label: "Info"
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            label: "Profile"
          ),
        ]
      ),
    );
  }
}