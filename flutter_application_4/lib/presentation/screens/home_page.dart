import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/model/user_model.dart';
import 'package:flutter_application_4/presentation/widgets/appbar_button.dart';
import 'package:flutter_application_4/presentation/widgets/button.dart';
import 'package:flutter_application_4/presentation/widgets/field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetModel().getUser();
  }

  @override
  Widget build(BuildContext context) {
    Future<Position> getPosition() async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error("Location service is disabled");
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error("Location permissions are denied");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location permission are permanently denied");
      }
      return Geolocator.getCurrentPosition();
    }

    // void _liveLocation() {
    //   LocationSettings locationSettings = const LocationSettings(
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 100,
    //   );

    //   Geolocator.getPositionStream(locationSettings: locationSettings)
    //       .listen((Position position) {
    //         lat = position.latitude.toString();
    //         lon = position.longitude.toString();
    //       });
    // }

    Future<void> _openMap(String lat, String long) async {
      String googleUrl =
          "https://www.google.com/maps/search/?api=1&query=$lat,$long";
      await canLaunchUrlString(googleUrl)
          ? await launchUrlString(googleUrl)
          : throw "Coulnt find $googleUrl";
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: FutureBuilder(
                future: GetModel().getUser(),
                builder: (context, snapshot) {
                  final UserModel model = snapshot.data ?? UserModel();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      AppBarButton(
                        onPressed: () {
                          print("work");
                          GetModel().getUser();
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Container(
                          height: 148.h,
                          width: 148.w,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffC7CDC9),
                                Color(0xff222419)
                              ]),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                                radius: 74.r,
                                child: Image.network(model
                                        .results?[0].picture!.large ??
                                    "https://randomuser.me/api/portraits/med/men/85.jpg")),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      DataField(
                        title: "Name",
                        initialText:
                            model.results?[0].name?.first.toString() ?? "error",
                        keyboardType: TextInputType.name,
                      ),
                      DataField(
                        title: "Username",
                        initialText:
                            model.results?[0].login?.username ?? "username",
                      ),
                      DataField(
                        initialText: model.results?[0].phone ?? "phone",
                        title: "phone number",
                        keyboardType: TextInputType.phone,
                      ),
                      DataField(
                        initialText: model.results?[0].email ?? "email",
                        title: "Gmail",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 110.h,
                      ),
                      Button(onPressed: () {
                        print(model.results?.first.name?.first.toString());
                        print(model.results?[0].login?.username ?? "username");
                        print(model.results?[0].phone ?? "phone");
                        _openMap(
                            model.results?[0].location?.coordinates?.latitude ??
                                "",
                            model.results?[0].location?.coordinates
                                    ?.longitude ??
                                "");
                      })
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
