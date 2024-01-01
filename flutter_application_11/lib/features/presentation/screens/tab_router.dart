import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/routes/app_router.gr.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/resources/resources.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        FavouriteRoute(),
        LocationRoute(),
        BagRoute(),
        UserRoute()
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xffE7EDF0),
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(color: AppColors.pinkColor),
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Images.home2,
                      colorFilter: currentIndex == 0
                          ? ColorFilter.mode(
                              AppColors.pinkColor, BlendMode.srcIn)
                          : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.heart, colorFilter: currentIndex == 1
                          ? ColorFilter.mode(
                              AppColors.pinkColor, BlendMode.srcIn)
                          : const ColorFilter.mode(Colors.black, BlendMode.srcIn),), label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.location), label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.shoppingcart), label: ""),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(Images.user), label: ""),
              ],
            ));
      },
    );
  }
}
