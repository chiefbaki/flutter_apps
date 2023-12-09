import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/model.dart';
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
  
  @override
  void initState() {
    super.initState();
    getJoke();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences? prefs;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chak Norris"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getJoke,
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
                        prefs = await SharedPreferences.getInstance();
                        isSelected
                            ? prefs?.setString("joke", joke)
                            : debugPrint("not selected");
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isSelected ? Colors.red : Colors.white,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavotirePage(
                                      prefs: prefs!,
                                    )));
                      },
                      child: const Text(
                        "Favourite jokes",
                        style: TextStyle(fontSize: 25),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            translate(joke, "en", "ru");
                            setState(() {});
                          },
                          child: const Text(
                            "ru",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          )),
                      TextButton(
                          onPressed: () {
                            translate(joke, "ru", "en");
                            setState(() {});
                          },
                          child: const Text(
                            "en",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
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

class FavotirePage extends StatelessWidget {
  final SharedPreferences prefs;
  const FavotirePage({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(itemBuilder: (context, index) {
              String text = prefs.getString("joke") ?? "";
              return Text(text.toString());
            })
          ],
        ),
      ),
    );
  }
}
