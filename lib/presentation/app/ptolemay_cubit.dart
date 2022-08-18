import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'ptolemay_state.dart';

class PtolemayCubit extends Cubit<PtolemayState> {
  PtolemayCubit() : super(PtolemayInitial());

  int themeNumber = 1;

  void changeTheme(ThemeMode theme) {
    emit(PtolemyChangeThemeState(theme));
    themeNumber += 1;
  }
}