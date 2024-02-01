import 'package:flutter/material.dart';
import 'package:flutter_application_15/cubit/search_cubit/search_cubit.dart';
import 'package:flutter_application_15/cubit/search_cubit/search_state.dart';
import 'package:flutter_application_15/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController year = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Column(
            children: [
              TextField(
                controller: name,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Name",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: year,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Year",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SearchCubit>(context)
                        .searchMovie(name: name.text, year: year.text);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Search",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (state is SearchSuccess) {
                    return CustomListTile(
                        img: state.result.poster ?? "error",
                        title: state.result.title ?? "",
                        subTitle: state.result.year ?? "",
                        rated: state.result.rated ?? "");
                  } else if (state is SearchError) {
                    return Text(
                      state.error,
                      style: const TextStyle(fontSize: 20),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(
                height: 100,
              ),
              Image.asset("assets/imgs/fashion_1.png")
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final String rated;

  const CustomListTile(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.rated});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("work");
      },
      child: ListTile(
        leading: Image.network(
          img,
          width: 40,
          height: 40,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 10),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 10),
        ),
        trailing: Text(
          rated,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
