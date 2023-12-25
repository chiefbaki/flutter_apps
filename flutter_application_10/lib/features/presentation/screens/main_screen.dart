import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/model/movie_model.dart';
import 'package:flutter_application_10/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_10/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_10/features/presentation/widgets/search_widget.dart';
import 'package:flutter_application_10/resources/resources.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetMovie().getMovie();
    MovieModel obj = MovieModel();
    print(obj.poster);
    print(obj.director);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: FutureBuilder(
        future: GetMovie().getMovie(),
        builder: (context, snapshot) {
          final MovieModel model = snapshot.data ?? MovieModel();
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SearchWidget(),
                Stack(
                  children: [
                    Container(
                      height: 578,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Images.spidey))),
                    ),
                    Positioned(
                        left: 34,
                        top: 358,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.genreColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Text("Action",
                                          style: AppFonts.s13w500
                                              .copyWith(color: Colors.white)),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Spider-Man: No Way Home",
                              style: AppFonts.s18w500
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExpandableTextWidget(text: model.plot ?? "",)
                          ],
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      child: ExpandableText(
        widget.text,
          style: AppFonts.s12w500.copyWith(color: Colors.white),
          expandText: 'More',
          collapseText: 'Less',
          maxLines: 6,
          linkColor: Colors.orange,
      ),
    );
  }
}