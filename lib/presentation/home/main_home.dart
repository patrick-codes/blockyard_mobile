import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../utils/constants/color constants/colors.dart';
import 'home.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({
    super.key,
  });

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String? usernew;
  int _selectedIndex = 0;

  List<Widget> pages = [
    MyHomePage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  int initPage = 0;
  onPageClick(index) {
    setState(() {
      initPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor2,
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: primaryContainerShade,
            ),
          ),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: whiteColor,
            hoverColor: secondaryColor,
            activeColor: primaryColor,
            iconSize: 25,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            duration: const Duration(milliseconds: 300),
            color: Colors.black45,
            curve: Curves.bounceIn,
            style: GnavStyle.oldSchool,
            tabBorderRadius: 100.0,
            tabMargin: EdgeInsets.all(5),
            textSize: 8,
            gap: 0,
            tabs: const [
              GButton(
                icon: MingCute.home_5_line,
                text: 'Home',
              ),
              GButton(
                icon: MingCute.search_3_line,
                text: 'Catalog',
              ),
              GButton(
                icon: MingCute.shopping_cart_2_line,
                text: 'Cart',
              ),
              GButton(
                icon: MingCute.heart_line,
                text: 'Favorite',
              ),
              GButton(
                icon: MingCute.user_4_line,
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: pages.elementAt(_selectedIndex));
  }
}
