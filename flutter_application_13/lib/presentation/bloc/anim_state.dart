import 'package:flutter/material.dart';

abstract class AnimState{}

class AnimInitial extends AnimState{}

class AnimSuccess extends AnimState{
  final List<double> widthHeight;
  final Color boxColor;
  final BorderRadius boxRadius;
  AnimSuccess({required this.widthHeight, required this.boxColor, required this.boxRadius});
}

class AnimError extends AnimState{
  final String errorText;
  AnimError({required this.errorText});
}