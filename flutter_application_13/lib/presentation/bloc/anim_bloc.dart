import 'package:flutter/material.dart';
import 'package:flutter_application_13/presentation/bloc/anim_event.dart';
import 'package:flutter_application_13/presentation/bloc/anim_state.dart';
import 'package:flutter_application_13/repository/animation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimBloc extends Bloc<AnimEvent, AnimState> {
  AnimBloc({required this.repository}) : super(AnimInitial()) {
    on<RandomEvent>((event, emit) {
      try {
        List<double> widthHeight = repository.changeSize();
        Color boxColor = repository.changeColor();
        BorderRadius boxRadius = repository.changeRadius();
        emit(AnimSuccess(widthHeight: widthHeight, boxColor: boxColor, boxRadius: boxRadius));
      } catch (e) {
        print(e); 
      }
    });
  }
  final AnimationRepository repository; 
}