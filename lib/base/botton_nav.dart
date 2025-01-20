import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freshy_food/styles/colors.dart';
import 'package:freshy_food/screens/favorites_screen.dart';
import 'package:freshy_food/screens/home_screen.dart';
import 'package:freshy_food/screens/info_screen.dart';
import 'package:freshy_food/screens/recipes_screen.dart';
import 'package:freshy_food/screens/profile_screen.dart';
import 'package:freshy_food/styles/path/image_path.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final appScreens = [
    HomeScreen(),
    FavoritesScreen(),
    RecipesScreen(),
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
            icon: SvgPicture.asset(ImagePath.homeNav, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 24,),
            activeIcon: SvgPicture.asset(ImagePath.homeNav, colorFilter: ColorFilter.mode(CustomColors.darkGreen, BlendMode.srcIn), height: 24,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImagePath.starNav, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 24,),
            activeIcon: SvgPicture.asset(ImagePath.starFilledNav, colorFilter: ColorFilter.mode(CustomColors.darkGreen, BlendMode.srcIn), height: 24,),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImagePath.recipeNav, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 24,),
            activeIcon: SvgPicture.asset(ImagePath.recipeNav, colorFilter: ColorFilter.mode(CustomColors.darkGreen, BlendMode.srcIn), height: 24,),
            label: "Recipes"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImagePath.infoNav, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 24,),
            activeIcon: SvgPicture.asset(ImagePath.infoNav, colorFilter: ColorFilter.mode(CustomColors.darkGreen, BlendMode.srcIn), height: 24,),
            label: "Info"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImagePath.profileNav, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), height: 24,),
            activeIcon: SvgPicture.asset(ImagePath.profileNav, colorFilter: ColorFilter.mode(CustomColors.darkGreen, BlendMode.srcIn), height: 24,),
            label: "Profile"
          ),
        ]
      ),
    );
  }
}