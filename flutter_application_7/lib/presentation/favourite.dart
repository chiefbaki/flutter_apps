import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritePage extends StatefulWidget {
  final List<String> jokes;
  const FavouritePage({super.key, required this.jokes});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          FutureBuilder<List<String>>(
            future: localJoke(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator.adaptive();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Check if the snapshot.data is not null before accessing it
                List<String>? jokes = snapshot.data;

                if (jokes != null && jokes.isNotEmpty) {
                  return Column(
                    children: jokes.map((joke) => Text(joke)).toList(),
                  );
                } else {
                  return Text('No jokes found.');
                }
              }
            },
          )
        ]
            //   widget.jokes.map((e) => Text(e.toString(), style: const TextStyle(fontSize: 15),)).toList(),
            ),
      ),
    );
  }

  Future<List<String>> localJoke() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("joke") ?? ["error"];
  }
}
