import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void getApi() async {
    Dio dio = Dio();
    Response response = await dio.get("https://cat-fact.herokuapp.com/facts/random");
    print(response.data);
    print(response);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: getApi, child: Text("Cat's fact")),
            ],
          ),
        ),
      ),
    );
  }
}

