import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> names = [
    "Артимологи",
    "Кардиологи",
    "Кардиохирурги",
    "Отолорингологи",
    "Стоматологи"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Мой профиль",
          style: AppFonts.s34w700.copyWith(color: AppColors.fontColor),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(AppImg.bell),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 266.w,
                  height: 36.h,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.searchFieldColors,
                        ),
                        hintText: "Поиск врача",
                        hintStyle: AppFonts.s17w400,
                        filled: true,
                        fillColor:
                            AppColors.searchFieldColors.withOpacity(0.12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                TextButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    child: Text(
                      "Очистить",
                      style: AppFonts.s14w600
                          .copyWith(color: AppColors.docLabelColor),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  itemBuilder: ((context, index) {
                    return Choice(
                      name: names[index],
                      isSelected: selectedIndex == index,
                      onSelected: (val) {
                        selectedIndex = index;
                        setState(() {});
                      },
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class Choice extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Function(bool) onSelected;
  const Choice(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: ChoiceChip(
        showCheckmark: false,
        onSelected: onSelected,
        backgroundColor: Colors.white,
        selectedColor: AppColors.btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.black)
        ),
        label: Text(
          name,
          style: isSelected ? AppFonts.s15w400.copyWith(color: Colors.white) : AppFonts.s15w400.copyWith(color: Colors.black) ,
        ),
        disabledColor: AppColors.circleAvatar,
        selected: isSelected,
      ),
    );
  }
}
