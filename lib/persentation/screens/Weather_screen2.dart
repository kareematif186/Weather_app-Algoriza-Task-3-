import 'dart:convert';

import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/constants/cities.dart';
import 'package:alogoriza_task/constants/strings.dart';
import 'package:alogoriza_task/data/models/searchedCityWeather.dart';
import 'package:alogoriza_task/data/web_service/weather_web_services.dart';
import 'package:alogoriza_task/persentation/screens/get_weather.dart';
import 'package:alogoriza_task/persentation/widgets/Ifneeded/_buildSliverAppBar2.dart';
import 'package:alogoriza_task/persentation/widgets/WaterPercernt.dart';
import 'package:alogoriza_task/persentation/widgets/_buildAppBarActions.dart';
import 'package:alogoriza_task/persentation/widgets/_buildAppBarTitle.dart';
import 'package:alogoriza_task/persentation/widgets/_buildSearchField.dart';
import 'package:alogoriza_task/persentation/widgets/_buildSliverAppBar.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';
import '../../data/models/Location.dart';
import 'package:http/http.dart' as http;

import '../../data/repository/weather_repository.dart';
import '../widgets/Dayschart.dart';
import '../widgets/SFCartesianChart.dart';
import '../widgets/TimeandSun.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class Weather_Screen2 extends StatefulWidget {
  const Weather_Screen2({Key? key}) : super(key: key);
  @override
  _Weather_Screen2State createState() => _Weather_Screen2State();
}

class _Weather_Screen2State extends State<Weather_Screen2>
    with SingleTickerProviderStateMixin {







  ParticleOptions particles = ParticleOptions(
    baseColor: Colors.white,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 5.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 2.0,
  );

  static late List<dynamic> weatherInfo;
  static late List<dynamic> weatherInfo2 = [];
  static bool _isSearching = false;
  static late SearchedCityWeather _searchedCityWeather;
  static List<dynamic> _searchedCityWeather2 = [];
  static List<String> strs = [];
  static double? selectedCityLat;
  static double? selectedCityLon;
  static String? CityName;
  ScrollController _scrollController= ScrollController();

  static late Color backgroundColor = Colors.transparent;
  static bool isCollapsed = true;
  static bool isCollapsed2 = false;

  late TextEditingController _searchTextController2 = TextEditingController();
  final _searchTextController = TextEditingController();
  static late List<dynamic> searchedForCharacters;
  static final PageController controller = PageController();
  static final PageController _controller = PageController(initialPage: 0);



  void initState() {
    // TODO: implement initState
    super.initState();
    //getLocation();













    //WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //BlocProvider.of<WeatherCubit>(context).getHereWeather();

    // setState(() {});
    //});





    // _scrollController.addListener(
    //       () => _isAppBarExpanded ?
    //
    //   setState(
    //         () {
    //           backgroundColor = Colors.black;
    //           isCollapsed = true;
    //           isCollapsed2 = false;
    //     },
    //   )
    //       :
    //   print("herererer")
    //
    // );




    _scrollController.addListener(() {
      // _scrollController.position.
      //print(_scrollController.position.pixels);

      // _scrollController.position.userScrollDirection==ScrollDirection.reverse;











      //  if (_scrollController.position.userScrollDirection==ScrollDirection.reverse) {
      if (_scrollController.position.pixels == _scrollController.position.minScrollExtent) {
        backgroundColor = Colors.transparent;
        isCollapsed = true;
        isCollapsed2 = false;
        setState(() {});
      }

      //if (scrollController.position.pixels > 0 &&
      // scrollController.position.pixels < 3)

      if(_scrollController.position.pixels >0 && _scrollController.position.pixels <100) {

        if(backgroundColor == Colors.black){

          print("");
        }
        else{
          backgroundColor = Colors.black;
          isCollapsed = false;
          isCollapsed2 = true;
          setState(() {});


        };


      }
      // }
    });

    //getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


    _scrollController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Colors.blue[900]!]),
        ),
        child: Scaffold(
          backgroundColor: backgroundColor,

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInfoLoaded) {
                    weatherInfo = state.weatherInfo;

                    //print(weatherInfo);
                    child:
                    return  AppBar(
                      elevation: 0.0,
                      backgroundColor:Colors.transparent,
                      excludeHeaderSemantics: false,
                      bottom: PreferredSize(
                        // Add this code
                        preferredSize: Size.fromHeight(0), // Add this code
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${weatherInfo[0]["degree"]}",
                                    style: const TextStyle(
                                      fontSize: 100, color: white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),

                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 1000),
                                    child:  isCollapsed2? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weatherInfo[0]["degree"]} / "
                                              "${weatherInfo[3]["degree"]}  "
                                              "Feels like ${weatherInfo[0]["feelslike"]} ",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ) : Container() ,
                                  ),
                                  Container(
                                      height: 120,
                                      child: Image.asset("assets/img/sun.png")),
                                ],
                              ),
                            ],
                          ),
                        ), // Add this code
                      ),
                      title: Row(
                        children: [
                          MaterialButton(

                            onPressed: (){


                              print("weatherstateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1");

                              Navigator.of(context).push(
                                MaterialPageRoute<WeatherCubit>(
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<WeatherCubit>(context),
                                      child: Get_Weather(),
                                    );
                                  },
                                ),
                              );




                              //BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();

                              //BlocProvider.of<WeatherCubit>(context).getAllCityName();



                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Get_Weather(
                              //
                              //   )),
                              // );


                              // Navigator.of(context).push(
                              //   MaterialPageRoute<WeatherCubit>(
                              //     builder: (_) {
                              //       return BlocProvider.value(
                              //         value: BlocProvider.of<WeatherCubit>(context),
                              //         child: Get_Weather(),
                              //       );
                              //     },
                              //   ),
                              // );


                              //Navigator.pushNamed(context, weatherScreen2);


                              // Navigator.push(context, CupertinoPageRoute(builder: (ctx) =>
                              //     BlocProvider.value(value: context.read<WeatherCubit>())),
                              //
                              //
                              // );



                            },

                            child: const Icon(
                              UniconsLine.list_ui_alt,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "${weatherInfo[0]["city"]}",
                            style: const TextStyle(fontSize: 40, color: white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            UniconsLine.map_marker_shield,
                            color: white,
                            size: 35,
                          ),
                        ],
                      ),
                    );
                  }

                  else if (state is WeatherInfoLoaded2){

                    return  AppBar(
                      elevation: 0.0,
                      backgroundColor:Colors.transparent,
                      excludeHeaderSemantics: false,
                      bottom: PreferredSize(
                        // Add this code
                        preferredSize: Size.fromHeight(0), // Add this code
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${weatherInfo[0]["degree"]}",
                                    style: const TextStyle(
                                      fontSize: 100, color: white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),

                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 1000),
                                    child:  isCollapsed2? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weatherInfo[0]["degree"]} / "
                                              "${weatherInfo[3]["degree"]}  "
                                              "Feels like ${weatherInfo[0]["feelslike"]} ",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ) : Container() ,
                                  ),
                                  Container(
                                      height: 120,
                                      child: Image.asset("assets/img/sun.png")),
                                ],
                              ),
                            ],
                          ),
                        ), // Add this code
                      ),
                      title: Row(
                        children: [
                          MaterialButton(

                            onPressed: (){


                              print("weatherstateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1");

                              Navigator.of(context).push(
                                MaterialPageRoute<WeatherCubit>(
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<WeatherCubit>(context),
                                      child: Get_Weather(),
                                    );
                                  },
                                ),
                              );




                              //BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();

                              //BlocProvider.of<WeatherCubit>(context).getAllCityName();



                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Get_Weather(
                              //
                              //   )),
                              // );


                              // Navigator.of(context).push(
                              //   MaterialPageRoute<WeatherCubit>(
                              //     builder: (_) {
                              //       return BlocProvider.value(
                              //         value: BlocProvider.of<WeatherCubit>(context),
                              //         child: Get_Weather(),
                              //       );
                              //     },
                              //   ),
                              // );


                              //Navigator.pushNamed(context, weatherScreen2);


                              // Navigator.push(context, CupertinoPageRoute(builder: (ctx) =>
                              //     BlocProvider.value(value: context.read<WeatherCubit>())),
                              //
                              //
                              // );



                            },

                            child: const Icon(
                              UniconsLine.list_ui_alt,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "${weatherInfo[0]["city"]}",
                            style: const TextStyle(fontSize: 40, color: white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            UniconsLine.map_marker_shield,
                            color: white,
                            size: 35,
                          ),
                        ],
                      ),
                    );

                  }

                  else if (state is WeatherInfoLoaded3){

                    return AppBar(
                      elevation: 0.0,
                      backgroundColor:Colors.transparent,
                      excludeHeaderSemantics: false,
                      bottom: PreferredSize(
                        // Add this code
                        preferredSize: Size.fromHeight(0), // Add this code
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${weatherInfo[0]["degree"]}",
                                    style: const TextStyle(
                                      fontSize: 100, color: white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),

                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 1000),
                                    child:  isCollapsed2? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weatherInfo[0]["degree"]} / "
                                              "${weatherInfo[3]["degree"]}  "
                                              "Feels like ${weatherInfo[0]["feelslike"]} ",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ) : Container() ,
                                  ),
                                  Container(
                                      height: 120,
                                      child: Image.asset("assets/img/sun.png")),
                                ],
                              ),
                            ],
                          ),
                        ), // Add this code
                      ),
                      title: Row(
                        children: [
                          MaterialButton(

                            onPressed: (){


                              print("weatherstateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1");

                              Navigator.of(context).push(
                                MaterialPageRoute<WeatherCubit>(
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<WeatherCubit>(context),
                                      child: Get_Weather(),
                                    );
                                  },
                                ),
                              );




                              //BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();

                              //BlocProvider.of<WeatherCubit>(context).getAllCityName();



                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Get_Weather(
                              //
                              //   )),
                              // );


                              // Navigator.of(context).push(
                              //   MaterialPageRoute<WeatherCubit>(
                              //     builder: (_) {
                              //       return BlocProvider.value(
                              //         value: BlocProvider.of<WeatherCubit>(context),
                              //         child: Get_Weather(),
                              //       );
                              //     },
                              //   ),
                              // );


                              //Navigator.pushNamed(context, weatherScreen2);


                              // Navigator.push(context, CupertinoPageRoute(builder: (ctx) =>
                              //     BlocProvider.value(value: context.read<WeatherCubit>())),
                              //
                              //
                              // );



                            },

                            child: const Icon(
                              UniconsLine.list_ui_alt,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "${weatherInfo[0]["city"]}",
                            style: const TextStyle(fontSize: 40, color: white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            UniconsLine.map_marker_shield,
                            color: white,
                            size: 35,
                          ),
                        ],
                      ),
                    );

                  }


                  else{
                    return Container();


                  }


                }),
          ),

          //backgroundColor: Colors.lightBlue,

          //state is WeatherInfoLoaded
          // weatherInfo = state.weatherInfo;




















          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInfoLoaded) {
                weatherInfo = state.weatherInfo;
                //print(weatherInfo);

                return Container(
                  height: 1500,
                  child: PageView(
                    onPageChanged: (int page) {


                    },


                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children:  <Widget>[
                      Center(
                        child:  CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );








































              } else if (state is WeatherInfoLoaded2) {
                weatherInfo2 = state.weatherInfo;
                //print(weatherInfo);

                return  Container(
                  height: 1500,
                  child: PageView(
                    onPageChanged: (int page) {


                    },


                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children:  <Widget>[
                      Center(
                        child:  CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }



              else if (state is WeatherInfoLoaded3) {
                weatherInfo = state.weatherInfo;

                //print(weatherInfo);

                return Container(
                  height: 1500,
                  child: PageView(
                    onPageChanged: (int page) {


                    },


                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children:  <Widget>[
                      Center(
                        child:  CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomScrollView(
                          controller: _scrollController,
                          primary: false,
                          shrinkWrap: true,


                          slivers: [
                            Container(
                              child: SliverAppBar(
                                // foregroundColor: Colors.black,

                                floating: false,
                                expandedHeight: 300,
                                pinned: false,
                                stretch: false,
                                elevation: 0,
                                snap: false,
                                primary: false,

                                // actions: _buildAppBarActions(),



                                // bottom: PreferredSize(
                                //     // Add this code
                                //     preferredSize: Size.fromHeight(0), // Add this code
                                //     child: Container() // Add this code
                                //     ),

                                //stretchTriggerOffset: 300,
                                //toolbarHeight:450,

                                //snap: true,
                                backgroundColor: backgroundColor,
                                flexibleSpace: FlexibleSpaceBar(
                                    centerTitle: true,
                                    background: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 1000),


                                        child: isCollapsed? Padding(
                                          padding: const EdgeInsets.only(left: 40),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["city"]}",
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Icon(
                                                    UniconsLine.map_marker_shield,
                                                    color: white,
                                                    size: 35,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["degree"]} / "
                                                        "${weatherInfo[3]["degree"]}  "
                                                        "Feels like ${weatherInfo[0]["feelslike"]} ",
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: white,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ) : Container()
                                    )

                                  //title: Icon(UniconsLine.info),

                                ),
                              ),
                            ),

                            //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
                            //BuildSliverAppBar(weatherInfo: weatherInfo),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SingleChildScrollView(
                                    child: BuildSliverAppBar(
                                        weatherInfo: weatherInfo, state: state),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        Row(
          children: [
            IconButton(
              onPressed: () {
                _clearSearch();
                Navigator.pop(context); //get out of the context to back
              },
              icon: const Icon(Icons.clear, color: MyColors.myWhite2),
            ),
            IconButton(
              color: Colors.red,
              onPressed: () {
                BlocProvider.of<WeatherCubit>(context)
                    .getWeatherWithCityName(CityName!);

                //BlocProvider.of<WeatherCubit>(context).getWeatherWithCityName( selectedCityLat!, selectedCityLon!);

                //  BlocProvider.of<WeatherCubit>(context).weatherInfo2;

                //print(selectedCityLat);
                //print(selectedCityLon);

                //  BlocProvider.of<WeatherCubit>(context).getAllWeather( 40.7127837, -74.0059413);

                // BlocProvider.of<WeatherCubit>(context).getHereWeather();

                // 34.0522342
                // ( 4471): -118.2436849
              },
              icon: const Icon(UniconsLine.arrow_right,
                  size: 30, color: MyColors.myWhite2),
            ),
          ],
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            UniconsLine.search,
            size: 30,
            color: MyColors.myWhite2,
          ),
        )
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove: _stopSearching)); // going to new route with new back_button

    //BlocProvider.of<WeatherCubit>(context).getAllCityName();

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    // print(searchedCharacter);

    selectedCityNameForPrediction(searchedCharacter);

    // searchedForCharacters = cities
    //     .where((character) =>
    //     character[0].startsWith(searchedCharacter)).toList();
    //  setState(() {});
  }

  void selectedCityNameForPrediction(String searchedCharacter) {
    for (int i = 0; i < weatherInfo2.length; i++) {
      //print("enterrrrrrrrrrrrrrrrrrrr1");

      _searchedCityWeather = weatherInfo2[i];

      if (searchedCharacter.toString() == _searchedCityWeather.city) {
        // print("enterrrrrrrrrrrrrrrrrrrr");

        //print(searchedCharacter);
        // print(_searchedCityWeather.latitude);

        CityName = _searchedCityWeather.city;

        //selectedCityLat=_searchedCityWeather.latitude!;

        //selectedCityLon=_searchedCityWeather.longitude!;

      }

      //print(_searchedCityWeather2);

    }
  }


  String selectedCityNameForPrediction2(String searchedCharacter) {
    for (int i = 0; i < weatherInfo2.length; i++) {
      print("enterrrrrrrrrrrrrrrrrrrr1");

      _searchedCityWeather = weatherInfo2[i];

      if (searchedCharacter.toString() == _searchedCityWeather.city) {
        print("enterrrrrrrrrrrrrrrrrrrr");

        //print(searchedCharacter);
        // print(_searchedCityWeather.latitude);

        CityName = _searchedCityWeather.city;

        //selectedCityLat=_searchedCityWeather.latitude!;

        //selectedCityLon=_searchedCityWeather.longitude!;

      }

      //print(_searchedCityWeather2);

    }

    return CityName!;
  }







  List<String> GetListOFCityesName() {
    final SearchedCityWeather SearchedCityWeather3 = weatherInfo2[1];
    print(weatherInfo2[0]);
    //print(SearchedCityWeather3.city);

    for (int i = 0; i < weatherInfo2.length; i++) {
      _searchedCityWeather = weatherInfo2[i];

      //print( _searchedCityWeather.city);

      _searchedCityWeather2.add(_searchedCityWeather.city.toString());

      //print(_searchedCityWeather2);

    }

    final List<String> strs =
    _searchedCityWeather2.map((e) => e.toString()).toList();

    _searchedCityWeather2.clear();

    //print(strs);
    //print(strs.runtimeType);
    return strs;
  }
}
