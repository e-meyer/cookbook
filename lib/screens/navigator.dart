import 'package:cookbook/helpers/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/screens/home_view.dart';
import 'package:cookbook/screens/search_view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int i) {
    _pageController.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.lightGrey,
      // body: _screens[_selectedIndex],
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CustomNavigationBar(
          isFloating: true,
          elevation: 4,
          iconSize: 30,
          borderRadius: Radius.circular(20),
          strokeColor: ColorPallete.darkPurple,
          selectedColor: ColorPallete.darkPurple,
          unSelectedColor: ColorPallete.primaryText,
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: _selectedIndex == 0
                    ? ColorPallete.darkPurple
                    : ColorPallete.primaryText,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                color: _selectedIndex == 1
                    ? ColorPallete.darkPurple
                    : ColorPallete.primaryText,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/favourite.svg',
                color: _selectedIndex == 2
                    ? ColorPallete.darkPurple
                    : ColorPallete.primaryText,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/page-flip.svg',
                color: _selectedIndex == 3
                    ? ColorPallete.darkPurple
                    : ColorPallete.primaryText,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: _selectedIndex == 4
                    ? ColorPallete.darkPurple
                    : ColorPallete.primaryText,
              ),
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
