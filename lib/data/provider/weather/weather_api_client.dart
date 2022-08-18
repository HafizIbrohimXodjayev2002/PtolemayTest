import 'package:ptolemay/core/constants.dart';
import 'package:ptolemay/data/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'weather_api_client.g.dart';

@RestApi()
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio) {
    return _WeatherApiClient(dio);
  }

  @GET("weather?lat={lat}&lon={lon}&appid=${Constants.apiKey}")
  Future<WeatherModel> getWeatherStatus(@Path() double lat, @Path() double lon);
}
