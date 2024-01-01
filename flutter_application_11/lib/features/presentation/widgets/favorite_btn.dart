import 'package:flutter/material.dart';

class FavouriteBtn extends StatefulWidget {
  const FavouriteBtn({super.key});

  @override
  State<FavouriteBtn> createState() => _FavouriteBtnState();
}

class _FavouriteBtnState extends State<FavouriteBtn> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          isSelected = !isSelected;
          setState(() {});
        },
        icon: isSelected
            ? const Icon(
                Icons.favorite_border,
                color: Colors.white,
              )
            : const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ));
  }
}
