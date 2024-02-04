import 'package:flutter/material.dart';
import 'package:flutter_application_15/cubit/search_cubit/search_cubit.dart';
import 'package:flutter_application_15/cubit/search_cubit/search_state.dart';
import 'package:flutter_application_15/presentation/screens/favourite_screen.dart';
import 'package:flutter_application_15/presentation/widgets/customtile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController year = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavouriteScreen()));
              },
              child: const Text(
                "Favourites",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 150),
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
                        genre: state.result.genre ?? "",
                        awards: state.result.awards ?? "",
                        plot: state.result.plot ?? "",
                        language: state.result.language ?? "",
                        runtime: state.result.runtime ?? "",
                        img: state.result.poster ?? "error",
                        title: state.result.title ?? "",
                        subTitle: state.result.year ?? "",
                        year: state.result.year ?? "",
                        boxOffice: state.result.boxOffice ?? "",
                        country: state.result.country ?? "");
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
            ],
          ),
        ),
      ),
    );
  }
}
