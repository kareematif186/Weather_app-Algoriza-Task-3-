import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/data/repository/weather_repository.dart';
import 'package:alogoriza_task/data/web_service/weather_web_services.dart';
import 'package:alogoriza_task/persentation/screens/get_weather.dart';
import 'package:alogoriza_task/persentation/screens/weather_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter{
  late WeatherRepository weatherRepository;
  late WeatherCubit WeathersCubit;



  AppRouter(){

    weatherRepository =WeatherRepository(WeatherWebServices());
    WeathersCubit=WeatherCubit(weatherRepository);

  }

  // Route? generateRoute(RouteSettings settings){
  //   switch(settings.name){
  //     case weatherScreen:
  //       return MaterialPageRoute(
  //
  //           builder: (_)=>  BlocProvider(
  //
  //             create: (BuildContext context)=> WeathersCubit,
  //
  //             child: Weather_Screen(),
  //
  //           ),
  //
  //
  //
  //
  //       );
  //
  //     case weatherScreen2:
  //       return MaterialPageRoute(
  //
  //         builder: (_)=>  BlocProvider(
  //
  //           create: (BuildContext context)=> WeathersCubit,
  //
  //           child: Get_Weather(),
  //
  //         ),
  //
  //
  //
  //       );
  //
  //
  //
  //
  //
  //   }
  //
  //
  // }




}