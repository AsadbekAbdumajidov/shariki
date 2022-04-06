
import 'package:flutter/widgets.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class TextState extends HomeState{
  TextState();
}