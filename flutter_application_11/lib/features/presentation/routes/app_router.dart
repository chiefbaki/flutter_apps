import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: FavouriteRoute.page),
          AutoRoute(page: LocationRoute.page),
          AutoRoute(
            page: BagRoute.page,
          ),
          AutoRoute(page: UserRoute.page)
        ]),
      ];
}
