import 'package:ptolemay/presentation/app/ptolemay_cubit.dart';
import 'package:ptolemay/ui/themes/app_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay/routes/app_pages.dart';
import 'package:flutter/material.dart';

class PtolemayApp extends StatelessWidget {
  const PtolemayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PtolemayCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<PtolemayCubit, PtolemayState>(
            buildWhen: (perv, cur) => cur is PtolemyChangeThemeState,
            builder: (context, state) {
              ThemeMode themeMode = ThemeMode.system;
              if (state is PtolemyChangeThemeState) {
                themeMode = state.theme;
              }
              return MaterialApp.router(
                key: PtolemayApp.globalKey,
                title: 'Ptolemay app',
                themeMode: themeMode,
                theme: Themes.lightTheme,
                darkTheme: Themes.darkTheme,
                debugShowCheckedModeBanner: false,
                routerDelegate: AppPages.router.routerDelegate,
                routeInformationParser: AppPages.router.routeInformationParser,
              );
            },
          );
        }
      ),
    );
  }

  static final globalKey = GlobalKey();
}
