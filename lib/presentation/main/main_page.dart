import 'package:ptolemay/presentation/app/ptolemay_cubit.dart';
import 'package:ptolemay/presentation/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay/core/dimensions.dart';
import 'package:ptolemay/core/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController incrementController;
  late AnimationController decrementController;

  @override
  initState() {
    super.initState();
    incrementController = AnimationController(
      value: 1.0,
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      duration: Constants.animationDuration,
    );

    decrementController = AnimationController(
      value: 0.0,
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      duration: Constants.animationDuration,
    );
  }

  @override
  dispose() {
    incrementController.dispose();
    decrementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PtolemayCubit>();
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocListener<MainCubit, MainState>(
        listener: (context, state) {
          if (state is MainWeatherErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Builder(builder: (context) {
          final mainCubit = context.read<MainCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Weather Counter",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<MainCubit, MainState>(
                    buildWhen: (perv, cur) => cur is MainLoadData,
                    builder: (context, state) {
                      if (state is MainWeatherLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MainWeatherLoadedState) {
                        final weather = state.weatherModel;
                        return Text(
                          "Your current location is ${weather.name}\nWeather is ${weather.weather?[0]?.description}\nTemperature is ${weather.main?.temp?.ceil().toString().substring(0,2)} degree",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                          textAlign: TextAlign.center,
                        );
                      }
                      return Text(
                        "Press location icon",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                      );
                    },
                  ),
                  Dimensions.vSpace16,
                  Text(
                    "You have pushed the button many times: ",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                  ),
                  Dimensions.vSpace8,
                  BlocBuilder<MainCubit, MainState>(
                    buildWhen: (perv, cur) => cur is! MainLoadData,
                    builder: (context, state) {
                      return Text(
                        "${mainCubit.currentCount}",
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: Dimensions.paddingLeft30,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        onPressed: () async {
                          mainCubit.getLocation();
                        },
                        child: const Icon(
                          Icons.location_on_outlined,
                        ),
                      ),
                      Dimensions.vSpace16,
                      FloatingActionButton(
                        onPressed: () {
                          cubit.themeNumber.isOdd
                              ? cubit.changeTheme(ThemeMode.dark)
                              : cubit.changeTheme(ThemeMode.light);
                        },
                        child: const Icon(
                          Icons.light_mode,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) {
                        return ScaleTransition(
                          scale: incrementController,
                          child: FloatingActionButton(
                            onPressed: () {
                              mainCubit.currentCount == 10
                                  ? null
                                  : mainCubit.incrementCount(
                                      incrementController, decrementController, cubit.themeNumber);
                            },
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        );
                      },
                    ),
                    Dimensions.vSpace16,
                    ScaleTransition(
                      scale: decrementController,
                      child: FloatingActionButton(
                        onPressed: () {
                          mainCubit.currentCount == 0
                              ? null
                              : mainCubit.decrementCount(decrementController, incrementController, cubit.themeNumber);
                        },
                        child: const Icon(
                          Icons.horizontal_rule,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}