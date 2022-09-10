import 'package:alogoriza_task/data/models/searchedCityWeather.dart';
import 'package:alogoriza_task/data/models/weather.dart';
import 'package:alogoriza_task/data/web_service/weather_web_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Location.dart';
import 'package:alogoriza_task/constants/cities.dart';


class WeatherRepository {
  final WeatherWebServices weatherWebServices;





  WeatherRepository(this.weatherWebServices);

  Future<List<Map>> getWeatherWithLanAndlon() async {
    Map All = {};
    List<Map> list = [];
    List<Map> list2 = [];

    Location location = Location();
    await location.getcurrentLocation();

    final weather = await weatherWebServices.getWeatherWithLanAndlon(location.latitude
        , location.longitude);


    for (int i = 0; i <= 39; i++) {

      All = MapWeatherVALUES(weather, i, All);

      list.add(All);
    }


    return list;
  }





  Future<List<Map>> getWeatherWithCityName(String CityName) async {

    Map All = {};
    List<Map> list = [];
    List<Map> list2 = [];

    // Location location = Location();
    // await location.getcurrentLocation();

    final weather = await weatherWebServices.getWeatherWithCityName(CityName);



    //print(weather['city']["name"]);
    list2.clear();
   // print(list2);


    for (int i = 0; i <= 39; i++) {
    //  print("asdasd");
      All = MapWeatherVALUES(weather, i, All);
      list2.add(All);


    }




    //print(list2);




    return list2;
  }




  Map<dynamic, dynamic> MapWeatherVALUES(Map<dynamic, dynamic> weather, int i, Map<dynamic, dynamic> All) {
      String City = weather['city']["name"];
    int celsius = (weather['list'][i]["main"]["temp"] - 273.15).toInt();
    String clear = weather['list'][i]["weather"][0]["main"].toString();
    int celsius1 = (weather['list'][i]["main"]["feels_like"] - 273.15).toInt();
    int celsius2 = (weather['list'][i]["main"]["temp_max"] - 273.15).toInt();
    int celsius3 = (weather['list'][i]["main"]["temp_min"] - 273.15).toInt();
    int sunrise = (weather['city']["sunrise"]- 273.15).toInt();
    int sunset = (weather['city']["sunset"]- 273.15).toInt();
    String time = weather['list'][i]["dt_txt"];
    DateTime dateTime=DateTime.parse(time);
    String dayFormat = DateFormat('EEEE').format(dateTime);
    String timeFormat = DateFormat('hh:mm a').format(dateTime);
    int humidity = (weather['list'][i]["main"]["humidity"] ).toInt();

    All = {
      "id": dayFormat,
      "clock" :timeFormat,
      "city": City,
      "degree": celsius,
      "feelslike": celsius1,
      "time": time,
      "temp_max":celsius2,
      "temp_min":celsius3,
      "clear":clear,
      "humidity":humidity


    };
    return All;
  }







  List<SearchedCityWeather> getAllCityNameForSearch()   {
    final characters =  weatherWebServices.getAllCityNameForSearch();
    return characters.map((SearchedCityWeathere) => SearchedCityWeather.fromJson(SearchedCityWeathere)).toList();
  }






}


