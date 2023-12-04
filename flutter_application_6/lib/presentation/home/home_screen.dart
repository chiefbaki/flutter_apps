import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/home/profile_screen.dart';
import 'package:flutter_application_6/presentation/home/search_screen.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 4);

  final List<Widget> _screens = const [
    SearchScreen(), // Доктора
    Scaffold(
      body: Center(child: Text("Статьи")),
    ),
    Scaffold(
      body: Center(child: Text("Вызов")),
    ),
    Scaffold(
      body: Center(child: Text("Мои доктора")),
    ),
    ProfilePage(), // Профиль
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),//SvgPicture.asset(AppImg.userPlus,),
          title: ("Доктора"),
          textStyle: AppFonts.s10w500),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.article), //SvgPicture.asset(AppImg.spreadsheet),
          title: ("Статьи"),
          textStyle: AppFonts.s10w500),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.car_crash), //SvgPicture.asset(AppImg.ambulance,),
          title: ("Вызов"),
          textStyle: AppFonts.s10w500),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite),//SvgPicture.asset(AppImg.favorite),
          title: ("Мои доктора"),
          textStyle: AppFonts.s10w500),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.update_disabled_rounded), //SvgPicture.asset(AppImg.user),
          title: ("Профиль"),
          textStyle: AppFonts.s10w500),
    ];
  }
}
