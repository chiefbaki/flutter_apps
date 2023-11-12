import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 141, 187, 224),
          appBar: AppBar(
            title: const Text("First Screen of My App"),
            centerTitle: true,
          ),
          body: const Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SetOfBlocks(
                    position: MainAxisAlignment.start,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100, left: 15),
                    child: SetOfBlocks(
                      position: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100, left: 15),
                    child: SetOfBlocks(
                      position: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class SetOfBlocks extends StatelessWidget {
  final MainAxisAlignment position;

  const SetOfBlocks({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: position,
        children: const [
          Block(width: 70, height: 75, num: "1"),
          Block(width: 90, height: 90, num: "2", color: Colors.yellow,),
          Block(width: 110, height: 110, num: "1", color: Colors.green,),
        ],
      ),
    );
  }
}

class Block extends StatelessWidget {
  final String num;
  final Color color;
  final double width, height;

  const Block(
      {super.key,
      required this.width,
      required this.height,
      required this.num,
      this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color),
      child: Center(
          child: Text(
        num,
        textAlign: TextAlign.center,
      )),
    );
  }
}
