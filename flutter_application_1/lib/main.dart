import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.architecture,
            size: 50,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("wd"),
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.yellow,
                      shadowColor: Colors.transparent,
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("hello");
                    },
                    icon: Icon(Icons.abc),
                    iconSize: 100,
                  ),
                  TextButton(
                      onLongPress: () {
                        print("long press");
                      },
                      onPressed: () {
                        print("press");
                      },
                      child: Text(
                        "Press",
                        style: TextStyle(fontSize: 50),
                      )),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    size: 50,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
