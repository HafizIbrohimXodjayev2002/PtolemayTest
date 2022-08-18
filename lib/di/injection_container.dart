import 'package:ptolemay/data/repository/weather/weather_repository.dart';
import 'package:ptolemay/data/provider/weather/weather_api_client.dart';
import 'package:ptolemay/routes/app_pages.dart';
import 'package:ptolemay/core/constants.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dart:io';


final getIt = GetIt.instance;

Future<void> init() async {
  await _registerSingletons();

  await getIt.allReady();
}

Future<void> _registerSingletons() async {
  getIt.registerSingleton(_createDio());

  getIt.registerLazySingleton<WeatherApiClient>(() => WeatherApiClient(getIt.get<Dio>()));

  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImplementation(
      getIt.get<WeatherApiClient>(),
    ),
  );
}

Chuck chuck = Chuck();

Dio _createDio() {
  Dio dio = Dio(
      BaseOptions(receiveTimeout: 30000, connectTimeout: 30000, followRedirects: false, baseUrl: Constants.baseUrl));

  /// Chuck interceptor
  //dio.interceptors.add(chuck.getDioInterceptor());
  chuck.setNavigatorKey(AppPages.router.routerDelegate.navigatorKey);
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, request: true));
  }

  return dio;
}
