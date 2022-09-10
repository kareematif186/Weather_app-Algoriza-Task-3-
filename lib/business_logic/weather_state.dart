part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}


class WeatherInfoLoaded extends WeatherState{
  final List<dynamic> weatherInfo ;


  WeatherInfoLoaded(this.weatherInfo);

}


class WeatherInfoLoaded2 extends WeatherState{
  final List<dynamic> weatherInfo ;


  WeatherInfoLoaded2(this.weatherInfo);

}


class WeatherInfoLoaded3 extends WeatherState{
final List<dynamic> weatherInfo ;


WeatherInfoLoaded3(this.weatherInfo);

}
