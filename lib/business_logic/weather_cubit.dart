import 'package:alogoriza_task/data/models/searchedCityWeather.dart';
import 'package:alogoriza_task/data/repository/weather_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/Location.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {



  final WeatherRepository weatherRepository;
  List<dynamic> weatherInfo=[];
  List<SearchedCityWeather> weatherInfo2=[];



  WeatherCubit(this.weatherRepository) : super(WeatherInitial());


  List<dynamic> getHereWeather(){
    weatherRepository.getWeatherWithLanAndlon().then((weatherInfo){

      emit(WeatherInfoLoaded(weatherInfo));
      //print(weatherInfo);

    });

    return  weatherInfo;


  }

  List<dynamic> getWeatherWithCityName(String CityName){

   // print(CityName);
    //print(lon);
    weatherRepository.getWeatherWithCityName(CityName).then((weatherInfo){

      emit(WeatherInfoLoaded3(weatherInfo));

    });

    return  weatherInfo;
  }






  List<dynamic> getAllCityName(){
    weatherInfo2= weatherRepository.getAllCityNameForSearch();

    emit(WeatherInfoLoaded2(weatherInfo2));

    return  weatherInfo2;
  }




void ActiveFirstState1(){

  emit(WeatherInfoLoaded(weatherInfo2));


}
  void ActiveFirstState2(){

    emit(WeatherInfoLoaded2(weatherInfo2));


  }
  void ActiveFirstState3(){

    emit(WeatherInfoLoaded3(weatherInfo2));


  }













}
