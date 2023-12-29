import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> nameProducts = ["Nike", "Adidas", "Jordan", "Puma", "Reebok"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Row(
                children: [
                  Text(
                    "Discover",
                    style: AppFonts.s36w700.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    width: 130.w,
                  ),
                  CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.circleColor,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                          ))),
                  SizedBox(
                    width: 6.6.w,
                  ),
                  CircleAvatar(
                    radius: 19.r,
                    backgroundColor: AppColors.circleColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: nameProducts.length, itemBuilder: (context, index){
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ChoiceChip(
                    backgroundColor: Colors.white,
                    selectedColor: Colors.transparent,
                    
                    label: Text(nameProducts[index], style: AppFonts.s20w700,),
                    selectedShadowColor: Colors.grey,
                    selected: selectedIndex == index,
                    onSelected: (value) {
                      selectedIndex = index;
                      setState(() {
                        
                      });
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
