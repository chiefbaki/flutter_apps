import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/api_key/api_key.dart';
import 'package:flutter_application_7/model/api_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String temp = "";
  
  Future<void> getApi(String cityName) async {
    const _url = "https://api.openweathermap.org/data/2.5/forecast";
    final Dio dio = Dio();
    Map<String, dynamic> query = {"q": cityName.toLowerCase(), "appid": Apikey.key, "units": "metric"};
    
    try {
      final Response response = await dio.get(_url, queryParameters: query);
       setState(() {});
     WeatherModel model = WeatherModel.fromJson(response.data);

     temp = model.list?.first.main?.temp.toString()?? '';
      
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getApi("bishkek");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(temp, style: TextStyle(fontSize: 40),),
          ],
        ),
      ),
    );
  }
}
