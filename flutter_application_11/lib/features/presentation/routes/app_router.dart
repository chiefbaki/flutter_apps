import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()      
class AppRouter extends $AppRouter {      
    
  
 @override      
 List<AutoRoute> get routes => [      
    AutoRoute(page: DashboardRoute.page, initial: true, children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: FavouriteRoute.page),
      AutoRoute(page: LocationRoute.page),
      AutoRoute(page: BagRoute.page, maintainState: false,  initial: true),
      AutoRoute(page: UserRoute.page)
    ]),
  ];    

}

