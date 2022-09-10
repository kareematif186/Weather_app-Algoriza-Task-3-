

import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/data/models/themeClass.dart';
import 'package:alogoriza_task/data/repository/weather_repository.dart';
import 'package:alogoriza_task/data/web_service/weather_web_services.dart';
import 'package:alogoriza_task/persentation/screens/get_weather.dart';
import 'package:alogoriza_task/persentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';




void main()async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:
    Colors.transparent,
    //darkGreyClr, // navigation bar color
    statusBarColor:
    Colors.transparent,
    //darkGreyClr, // status bar color
  ));

  WidgetsFlutterBinding.ensureInitialized();

  runApp( WeatherApp(appRouter: AppRouter(),));
  //
  // NotifyHelper().intializationNotification();
}

class WeatherApp extends StatelessWidget {

  final AppRouter appRouter;


   const WeatherApp({


    Key? key, required this.appRouter



  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final  weatherRepository =WeatherRepository(WeatherWebServices());
    final WeathersCubit=WeatherCubit(weatherRepository);


    return MultiBlocProvider(

      providers: [
      BlocProvider(

                   create: (BuildContext context)=> WeathersCubit,

                   child: Weather_Screen(),

                 ),
        BlocProvider(

          create: (BuildContext context)=> WeathersCubit,

          child: Get_Weather(),

        ),


      ],

      child: MaterialApp(


         theme: ThemeData(

          primarySwatch: Colors.blue,

          fontFamily: 'OpenSans',
           unselectedWidgetColor: Colors.white, // You
        ),





        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

       // onGenerateRoute: appRouter.generateRoute ,


        themeMode:ThemeMode.system,

        darkTheme: ThemeClass.darkTheme,

        home: Weather_Screen() ,
        









      ),
    );

  }
}
