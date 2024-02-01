import 'package:flutter/material.dart';
import 'package:flutter_application_15/data/model/movie_model.dart';

class FavouriteProvider extends ChangeNotifier{
  List<MovieModel> favourites = [];
  bool isSelected = false;

  void changeIcon(){
    isSelected = !isSelected;
  
  }

  IconData updateIcon(){
    return isSelected ? Icons.add_a_photo : Icons.favorite_outline;
  }

  void addMovie(MovieModel model){
    favourites.add(model);
  }
  void update(){
    notifyListeners();
  }
}