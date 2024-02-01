import 'package:flutter/material.dart';
import 'package:flutter_application_15/data/model/movie_model.dart';
import 'package:flutter_application_15/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String year;
  final String language;
  final String runtime;
  final String plot;
  final String country;
  final String boxOffice;
  final String genre;
  final String awards;

  const CustomListTile(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.year,
      required this.language,
      required this.runtime,
      required this.plot,
      required this.country,
      required this.boxOffice,
      required this.genre,
      required this.awards});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FavouriteProvider>(context);
    MovieModel model = MovieModel(
        poster: widget.img,
        year: widget.year,
        language: widget.language,
        title: widget.title,
        plot: widget.plot,
        runtime: widget.runtime,
        genre: widget.genre,
        awards: widget.awards,
        boxOffice: widget.boxOffice);
    return GestureDetector(
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 650,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              widget.img,
                              width: 60,
                              height: 60,
                            ),
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              widget.language,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.runtime,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plot,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {
                              vm.changeIcon();
                              vm.addMovie(model);
                              print(vm.favourites);
                              print(vm.isSelected);
                            },
                            icon: Icon(vm.isSelected ? Icons.favorite_border : Icons.favorite_border_rounded))
                      ],
                    ),
                  ),
                ),
              );
            });
        debugPrint("work");
      },
      child: ListTile(
        leading: Image.network(
          widget.img,
          width: 60,
          height: 60,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          widget.subTitle,
          style: const TextStyle(fontSize: 20),
        ),
        trailing: Text(
          widget.year,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
