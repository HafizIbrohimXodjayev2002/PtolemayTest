part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

abstract class MainLoadData extends MainState {
  const MainLoadData();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainCountIncrementState extends MainState {
  final int count;

  const MainCountIncrementState(this.count);

  @override
  List<Object> get props => [count];
}

class MainCountDecrementState extends MainState {
  final int count;

  const MainCountDecrementState(this.count);

  @override
  List<Object> get props => [count];
}

class MainWeatherLoadedState extends MainLoadData {
  final WeatherModel weatherModel;

  const MainWeatherLoadedState(this.weatherModel);

  @override
  List<Object> get props => [weatherModel];
}

class MainWeatherLoadingState extends MainLoadData {
  @override
  List<Object> get props => [];
}

class MainWeatherErrorState extends MainLoadData {
  final String message;

  const MainWeatherErrorState(this.message);

  @override
  List<Object> get props => [message];
}