import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:ptolemay/data/failure.dart';
import 'package:ptolemay/data/models/weather_model.dart';
import 'package:ptolemay/data/provider/weather/weather_api_client.dart';

part 'weather_repository_imp.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeatherStatus(double lat, double lon);
}