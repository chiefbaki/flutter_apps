import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  static const List<Widget> _widgetOptions = [
    Text("текст1"),
    Text("текс2"),
    Text("текс3")
  ];

  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom navbar"),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(currentIndex: _selectedIndex, onTap: (val){
        setState(() {
          _selectedIndex = val;
        });
      }, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.feedback), label: "Feedback"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
    );
  }
}
