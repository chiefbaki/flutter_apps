import 'package:flutter/material.dart';

void main() => runApp(const MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen of My app!", style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 147, 255),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 224, 245),
        body: Container(
          child: const Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: FirstBox(),
              ),
              Padding(padding:EdgeInsets.only(left: 10, bottom: 50), 
                child: SecondBox(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 65),
                child: ThirdLess(),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
} 


class FirstBox extends StatelessWidget {
  const FirstBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                Container(
                  alignment: Alignment.center,
                  child: Text("1"),
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("2"),
                  width: 95,
                  height: 95,
                  color: Colors.yellow,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("3"),
                  width: 115,
                  height: 115,
                  color: Colors.green,
                ),
              ],
      ),
    );
  }
}


class SecondBox extends StatelessWidget {
  const SecondBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("1"),
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("2"),
                  width: 95,
                  height: 95,
                  color: Colors.yellow,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("3"),
                  width: 115,
                  height: 115,
                  color: Colors.green,
                ),
              ],
      ),
    );
  }
}


class ThirdLess extends StatelessWidget {
  const ThirdLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("1"),
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("2"),
                  width: 95,
                  height: 95,
                  color: Colors.yellow,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("3"),
                  width: 115,
                  height: 115,
                  color: Colors.green,
                ),
              ],
      ),
    );
  }
}