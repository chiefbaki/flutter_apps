import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_9/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter_application_9/presentation/screens/main_screen.dart';
part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MainRoute.page,
            initial: true,
            ),
        AutoRoute(page: BottomNavBarRoute.page)
      ];
}
