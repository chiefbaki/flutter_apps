import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/routes/app_router.dart';
import 'package:flutter_application_11/features/providers/shoppingcard_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) =>
            ShoppingCardProvider(),
          
          child: MaterialApp.router(
            routerConfig: AppRouter().config(),
            theme: ThemeData(
              fontFamily: "Sansation"
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
