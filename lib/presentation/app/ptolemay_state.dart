part of 'ptolemay_cubit.dart';

abstract class PtolemayState extends Equatable {
  const PtolemayState();

  @override
  List<Object> get props => [];
}

class PtolemayInitial extends PtolemayState {}

class PtolemyChangeThemeState extends PtolemayState {
  final ThemeMode theme;

  const PtolemyChangeThemeState(this.theme);

  @override
  List<Object> get props => [theme];
}