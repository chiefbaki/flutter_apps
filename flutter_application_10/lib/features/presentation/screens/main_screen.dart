import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/model/dio_settings.dart';
import 'package:flutter_application_10/data/model/movie_model.dart';
import 'package:flutter_application_10/data/network/network.dart';
import 'package:flutter_application_10/features/presentation/theme/app_colors.dart';
import 'package:flutter_application_10/features/presentation/theme/app_fonts.dart';
import 'package:flutter_application_10/features/presentation/widgets/expandable_text.dart';
import 'package:flutter_application_10/features/presentation/widgets/search_widget.dart';
import 'package:flutter_application_10/utils/consts/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // GetMovie().getMovie();
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final List<String> comments = [];
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: FutureBuilder(
        future: getMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final MovieModel model = snapshot.data ?? MovieModel();
            SharedPreferences prefs;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: searchController,
                        onSubmitted: (value) {
                          getMovie();
                          setState(() {
                            
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.fieldColor,
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.fieldTextColor,
                            ),
                            hintText: "Search Malls or Branch",
                            hintStyle: AppFonts.s13w400.copyWith(
                              color: AppColors.fieldTextColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(color: AppColors.fieldColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.fieldColor),
                                borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 578,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(model.poster ?? ""))),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  const Color(0xff000000).withOpacity(0.3),
                                  Color(0xff1E1F27),
                                ]),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 34,
                          top: 200,
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
                                        Text(model.genre ?? "error",
                                            style: AppFonts.s13w500
                                                .copyWith(color: Colors.white)),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                model.title ?? "error title",
                                style: AppFonts.s18w500
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ExpandableTextWidget(
                                text: model.plot ?? "error",
                              )
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${comments.length} Comments",
                          style: AppFonts.s12w500.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.circleAvatarColor,
                              child: Text(
                                "KC",
                                style: AppFonts.s15w500
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 253,
                              child: TextField(
                                controller: controller,
                                style: AppFonts.s11w300
                                    .copyWith(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Add a comment...",
                                    hintStyle: AppFonts.s11w300.copyWith(
                                        color: AppColors.commentColor),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.commentColor))),
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  comments.add(controller.text);
                                  prefs = await SharedPreferences.getInstance();
                                  prefs.setStringList("comment", comments);
                                  setState(() {
                                    comments.length;
                                  });
                                },
                                icon: Icon(
                                  Icons.send,
                                  color: AppColors.commentColor,
                                )),
                          ],
                        ),
                        FutureBuilder(
                            future: getComment(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text(
                                    "ERROR",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.red),
                                  ),
                                );
                              } else {
                                final List<String>? getComm = snapshot.data;
                                return SingleChildScrollView(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: getComm?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: AppColors
                                                      .circleAvatarColor,
                                                  child: Text(
                                                    "IK",
                                                    style: AppFonts.s15w500
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 9,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Islam Kurbanov",
                                                      style: AppFonts.s13w400
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Text(
                                                      getComm![index],
                                                      style: AppFonts.s11w300
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            }))
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator.adaptive()],
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<String>> getComment() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> comments = prefs.getStringList("comment") ?? [];
    return comments;
  }

  Future<dynamic> getMovie() async {
    final String? name = searchController.text;
    final Dio dio = DioSettings().dio;
    try {
      final Response response = await dio.get(
          "http://www.omdbapi.com/?apikey=${Consts.apiKey}&t=${name}&plot=full");

      if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      } else {
        debugPrint("Error ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
