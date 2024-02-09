import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/user_model.dart';
import 'package:flutter_application_4/ui/widgets/appbar_button.dart';
import 'package:flutter_application_4/ui/widgets/button.dart';
import 'package:flutter_application_4/ui/widgets/field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: AppBarButton(onPressed: (){
          GetModel().getUser();
          setState(() {
            
          });
        },),
        centerTitle: false,
        elevation: 0,
      ),
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
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 148.h,
                        width: 148.w,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffC7CDC9), Color(0xff222419)]),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                              radius: 74.r,
                              child: Image.network(model.results?[0].picture!.large ?? "https://randomuser.me/api/portraits/med/men/85.jpg")),
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      DataField(
                        title: "Name",
                        initialText: model.results?[0].name?.first.toString() ?? "name",
                        keyboardType: TextInputType.name,
                      ),
                      DataField(
                        title: "Username",
                        initialText: model.results?[0].login?.username ?? "username",
                      ),
                      DataField(
                        initialText: model.results?[0].phone ?? "phone",
                        title: "Phone number",
                        keyboardType: TextInputType.phone,
                      ),
                      DataField(
                        initialText: model.results?[0].email ?? "email",
                        title:  model.results?[0].email ?? "email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 110.h,
                      ),
                      Button(onPressed: () {
                        
                        print(model.results?.first.name?.first.toString());
                        print(model.results?[0].login?.username ?? "username");
                         print(model.results?[0].phone ?? "phone");


                        
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
