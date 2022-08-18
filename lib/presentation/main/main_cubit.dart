import 'package:ptolemay/data/repository/weather/weather_repository.dart';
import 'package:ptolemay/data/models/weather_model.dart';
import 'package:ptolemay/di/injection_extansion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  /// I would prefer check it with shared Preference
  MainCubit() : super(MainInitial());

  // Weather Repository injection
  final weatherRepo = inject<WeatherRepository>();

  int currentCount = 0;

  void incrementCount(
      AnimationController animationController, AnimationController decrementController, int themeNumber) {
    if (currentCount == 9 && themeNumber.isEven) {
      currentCount += 1;
    } else {
      themeNumber.isOdd ? currentCount += 1 : currentCount += 2;
    }
    emit(MainCountIncrementState(currentCount));
    if (currentCount >= 10) {
      animationController.forward().then((value) {
        animationController.reverse();
      });
    }

    if (decrementController.isDismissed) {
      decrementController.forward();
    }
  }

  void decrementCount(
      AnimationController animationController, AnimationController incrementController, int themeNumber) {
    if (currentCount == 1 && themeNumber.isEven) {
      currentCount -= 1;
    } else {
      themeNumber.isOdd ? currentCount -= 1 : currentCount -= 2;
    }
    emit(MainCountDecrementState(currentCount));
    if (currentCount <= 0) {
      animationController.forward().then((value) {
        animationController.reverse();
      });
    }

    if (incrementController.isDismissed) {
      incrementController.forward();
    }
  }

  void getLocation() async {
    emit(MainWeatherLoadingState());
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final result = await weatherRepo.getWeatherStatus(position.latitude, position.longitude);
    result.fold((left) {
      emit(const MainWeatherErrorState("Something went wrong"));
    }, (right) {
      emit(MainWeatherLoadedState(right));
    });
  }
}
