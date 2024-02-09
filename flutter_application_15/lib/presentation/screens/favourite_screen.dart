import 'package:flutter/material.dart';
import 'package:flutter_application_15/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(),
        body: ListView.builder(
            itemCount: vm.favourites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(vm.favourites[index].poster ?? "", width: 50, height: 50,),
                      Column(
                        children: [
                          Text(
                            vm.favourites[index].title ?? "",
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(vm.favourites[index].boxOffice ?? "",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(vm.favourites[index].awards ?? "",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(vm.favourites[index].genre ?? "",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
