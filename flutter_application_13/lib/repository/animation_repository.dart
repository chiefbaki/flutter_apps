import 'dart:math';

import 'package:flutter/material.dart';

class AnimationRepository{
  Random random = Random();
  List<double> changeSize(){
    double widthBox = random.nextDouble()*500;
    double heightBox = random.nextDouble()*500;
    return [widthBox, heightBox];
  }

  Color changeColor(){
    Color boxColor = Color.fromRGBO(random.nextInt(150), random.nextInt(150), random.nextInt(150), 1);
    return boxColor;
  }

  BorderRadius changeRadius(){
    BorderRadius boxRadius = BorderRadius.circular(random.nextDouble() * 800);
    return boxRadius;
  }
}