import 'dart:convert';

import 'package:alogoriza_task/constants/cities.dart';
import 'package:alogoriza_task/data/models/weather.dart';
import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import 'package:http/http.dart' as http;



class WeatherWebServices {

  Future getWeather(var lat , var lon) async {
    http.Response response= await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=33b4a09bd5b3f58a7a85933a314acb57'
    ));

    try{

      return response.body;

      // jsonDecode(data)['coord']['lon'];
    }
    catch(e) {
      print(response.statusCode);
    }

    //print(response.body);


  }



  late Dio dio;

  WeatherWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<Map> getWeatherWithLanAndlon(var lat , var lon) async {
    try {
      Response response = await dio.get('forecast?lat=${lat}&lon=${lon}&appid=33b4a09bd5b3f58a7a85933a314acb57');
     // print(response.data.runtimeType);



      return response.data;



    } catch (e) {
      print(e.toString());
      return {};
    }

  }


  List<dynamic> getAllCityNameForSearch()  {
    try {

      return cities;

    } catch (e) {
      print(e.toString());
      return [];
    }

  }


  Future<Map> getWeatherWithCityName(String City) async {
    try {
      Response response = await dio.get(
          'forecast?q=${City}&appid=33b4a09bd5b3f58a7a85933a314acb57');
      //print(response.data.runtimeType);



      return response.data;



    } catch (e) {
      print(e.toString());
      return {};
    }

  }










  // Future<List<Weather1>> getAllWeather2(var lat , var lon) async {
  //   try {
  //     Response response = await dio.get('forecast?lat=${lat}&lon=${lon}&appid=33b4a09bd5b3f58a7a85933a314acb57');
  //     print(response.data.runtimeType);
  //
  //
  //     // print(data);
  //     return response.data;
  //
  //
  //
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  //
  // }







}





