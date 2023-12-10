import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/model.dart';
import 'package:flutter_application_7/presentation/favourite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String joke = "";
  bool isSelected = false;
  List<String> jokes = [];

    @override
  void initState() {
    super.initState();
    getJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chak Norris"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getJoke();
          isSelected = false;
          setState(() {
            
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              joke == ""
                  ? const CircularProgressIndicator.adaptive()
                  : Flexible(
                      child: Text(
                      joke,
                      style: const TextStyle(fontSize: 20),
                    )),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  IconButton(
                      onPressed: () async {
                        isSelected = !isSelected;
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        isSelected
                            ? prefs.setStringList("joke", <String>[joke])
                            : debugPrint("not selected");
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isSelected ? Colors.red : Colors.white,
                      )),ElevatedButton(
                      onPressed: () {
                        
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavouritePage(jokes: jokes,)), 
                              );
                      },
                      child: const Text("Favourites")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            translate(joke, "en", "ru");
                            setState(() {});
                          },
                          child: const Text(
                            "ru",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            translate(joke, "ru", "en");
                            setState(() {});
                          },
                          child: const Text(
                            "en",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getJoke() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://api.chucknorris.io/jokes/random?json");
    debugPrint(response.data["value"]);
    JokeModel model = JokeModel.fromJson(response.data);
    joke = model.value ?? "";
    setState(() {});
  }

  Future<void> translate(String input, String fromLang, String toLang) async {
    final translator = GoogleTranslator();
    var translation = translator.translate(input, from: fromLang, to: toLang);
    debugPrint(translation.toString());
    await translation.then((value) => joke = value.toString());
    setState(() {});
  }
}

class SharedPrefs{
  SharedPrefs(){
    initShare();
  }

  SharedPreferences? prefs;
  Future<void> initShare() async{ 
    prefs =  await SharedPreferences.getInstance();
  }

}
