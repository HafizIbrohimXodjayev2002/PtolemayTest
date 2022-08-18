part of 'weather_repository.dart';

class WeatherRepositoryImplementation implements WeatherRepository {
  final WeatherApiClient weatherApiClient;

  const WeatherRepositoryImplementation(this.weatherApiClient);

  @override
  Future<Either<Failure, WeatherModel>> getWeatherStatus(double lat, double lon) async {
    try {
      final response = await weatherApiClient.getWeatherStatus(lat, lon);
      return Right(response);
    }  on DioError catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return const Left(Failure("Something went wrong"));
    } on Exception catch (_) {
      return const Left(Failure("Something went wrong"));
    }
  }
}