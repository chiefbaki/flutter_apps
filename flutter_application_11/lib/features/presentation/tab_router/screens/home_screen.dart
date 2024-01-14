import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/data/model/product_model.dart';
import 'package:flutter_application_11/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_11/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_11/features/presentation/widgets/cards/card.dart';
import 'package:flutter_application_11/features/presentation/widgets/cards/more_card.dart';
import 'package:flutter_application_11/features/presentation/widgets/buttons/rotated_btn.dart';
import 'package:flutter_application_11/features/providers/changetheme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> nameProducts = ["Nike", "Adidas", "Jordan", "Puma", "Reebok"];
  int selectedIndex = 0;
  String selectedElement = '';
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChangeThemeProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(children: [
        Container(
          height: 500.h,
          decoration: BoxDecoration(
            color: vm.changeTheme()
          ),
        ),
        Transform.scale(
          scale: 1.6,
          child: CircleAvatar(
            backgroundColor: vm.changeTheme(),
            radius: 750,
          ),
        ),
        SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 78.h,
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        vm.isDarkTheme();
                        setState(() {
                          
                        });
                      }, child: Text(
                        "Discover",
                        style: AppFonts.s36w700.copyWith(color: Colors.black),
                      ),),
                      SizedBox(
                        width: 130.w,
                      ),
                      CircleAvatar(
                          radius: 18.r,
                          backgroundColor: AppColors.circleColor,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
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
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: nameProducts.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                            onPressed: () {
                              selectedElement = nameProducts[index];
                              setState(() {});
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                nameProducts[index],
                                style: AppFonts.s20w700.copyWith(
                                    color:
                                        selectedElement == nameProducts[index]
                                            ? Colors.black
                                            : Colors.grey),
                              ),
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 40.w,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          RotatedBtn(onPressed: () {}, text: "Upcoming"),
                          SizedBox(
                            height: 43.h,
                          ),
                          RotatedBtn(onPressed: () {}, text: "Featured"),
                          SizedBox(
                            height: 43.h,
                          ),
                          RotatedBtn(onPressed: () {}, text: "New")
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Expanded(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: ProductModelList().models.length,
                              itemBuilder: (context, index) {
                                return Cards(
                                  currentIndexList:
                                      ProductModelList().models.length,
                                      id: ProductModelList().models[index].id,
                                  name: ProductModelList().models[index].name,
                                  model: ProductModelList().models[index].model,
                                  price: ProductModelList().models[index].price,
                                  img: ProductModelList().models[index].img,
                                  color: AppColors.cardColors[index],
                                );
                              },
                            )),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "More",
                        style: AppFonts.s20w700.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          MoreCard(
                            name:
                                "${ProductModelList().modelsMore[0].name + " " + ProductModelList().modelsMore[0].model}",
                            img: ProductModelList().modelsMore[0].img,
                            price: ProductModelList().models[0].price,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          MoreCard(
                            name:
                                "${ProductModelList().modelsMore[1].name + " " + ProductModelList().modelsMore[1].model}",
                            img: ProductModelList().modelsMore[1].img,
                            price: ProductModelList().modelsMore[1].price,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
