import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());

  bool start = true;
  int random = 0;
  int natija = 0;
  int timeCount = 5;
  List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.brown
  ];
  List<String> names = ["Yashil", "Qizil", "Sariq", "Ko'k", "Jigarang"];

  void rangTanla(index) {
    if (index == random) {
      emit(TextState());
      random = Random().nextInt(5);
      natija += 1;
      timeCount = 5;
      // timeGame();
    } else {
      start = true;
      emit(TextState());
    }
  }

  void startGame() {
    start = false;
    natija = 0;
    emit(TextState());
  }
  startTimer() async {
    for (var i = timeCount; i > 0; i--) {
      Future.delayed(
        Duration(seconds: i),
      ).then(
        (value) {
          timeCount -= 1;
          if (timeCount == 0) {
            emit(TextState());
          }
          emit(TextState());
        },
      );
    }
  }

  // timeGame() {
  //   for (var i = 0; i < 5; i++) {
  //     Future.delayed(const Duration(seconds: 10)).then((value) {
  //       timeCount--;
  //       emit(TextState());
  //     });
  //   }
  // }
}
