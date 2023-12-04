import 'package:flutter/material.dart';
import 'package:flutter_application_6/presentation/theme/app_colors.dart';
import 'package:flutter_application_6/presentation/theme/app_fonts.dart';
import 'package:flutter_application_6/presentation/widgets/choice_chip.dart';
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

  final List<Map<String, dynamic>> employee = [
    {
      "title": "Кардиолог",
      "subtitle": "Айбек Сатыбалдиев",
      "leading": AppImg.maskGroup
    },
    {
      "title": "Кардиолог",
      "subtitle": "Чынгыз Акылбеков",
      "leading": AppImg.maskGroup1
    },
    {
      "title": "Кардиолог",
      "subtitle": "Рафаэль Шабутдинов",
      "leading": AppImg.maskGroup2
    },
    {
      "title": "Кардиолог",
      "subtitle": "Рината Сафиуллина",
      "leading": AppImg.maskGroup3
    },
    {
      "title": "Кардиолог",
      "subtitle": "Алексей Захаренко",
      "leading": AppImg.maskGroup3
    },
    {
      "title": "Кардиолог",
      "subtitle": "Алексей Захаренко",
      "leading": AppImg.maskGroup3
    },
    {
      "title": "Кардиолог",
      "subtitle": "Алексей Захаренко",
      "leading": AppImg.maskGroup3
    },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      fillColor: AppColors.searchFieldColors.withOpacity(0.12),
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
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppImg.group)),
                const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Сортировка:",
                    style: AppFonts.s14w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    "имя А-Я",
                    style: AppFonts.s14w600
                        .copyWith(color: const Color(0xff2376F6)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.listTileBackground // Background color for the Container
            ),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 74,
                  color: Colors.white, // Background color for the ListTile
                  child: ListTile(
                    leading: Image.asset(AppImg.maskGroup),
                    title: Text(employee[index]["title"]),
                    subtitle: Text(employee[index]["subtitle"]),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star_border),
                            SizedBox(
                              height: 5,
                            ),
                            Text("5.0")
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Column(
                          children: [
                            Icon(Icons.comment),
                            SizedBox(
                              height: 5,
                            ),
                            Text("12")
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: employee.length,
            ),
          ),
        ],
      ),
    );
  }
}
