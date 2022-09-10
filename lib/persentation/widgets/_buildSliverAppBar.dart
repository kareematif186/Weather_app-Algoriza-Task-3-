import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/constants/colors.dart';
import 'package:alogoriza_task/persentation/widgets/Dayschart.dart';
import 'package:alogoriza_task/persentation/widgets/TimeandSun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class BuildSliverAppBar extends StatelessWidget {
  List<dynamic> weatherInfo = [];
  WeatherState state;

  BuildSliverAppBar({Key? key,

    required this.weatherInfo,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Container(
















      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



             Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 20 , right: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 0,
                          color: Colors.white10,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 300,
                                child: TimeAndsun(weatherInfo: weatherInfo),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 0,
                          color: Colors.white10,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [

                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Today Temperature",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),

                          Text(
                            "Expect the same as yesterday ",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20 , right: 20),

                    child: Container(
                      width: double.infinity,
//height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 0,
                          color: Colors.white10,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            height: 300,
                            child: DaysChart(weatherInfo: weatherInfo),
                          ),

// Container(height: 70,)
                        ],
                      ),
                    ),
                  ),


                  Padding(
                    padding:  const EdgeInsets.all(18),
                    child: Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius:  const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 0,
                          color: Colors.white10,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [

                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Sunrise",
                                style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "05:34 AM",
                                style: const TextStyle(fontSize: 25, color: Colors.white
                                ,fontWeight: FontWeight.bold
                                )
                                ,
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "🌤️ ",
                                style: const TextStyle(fontSize: 80, color: Colors.white
                                        ,fontWeight: FontWeight.bold
                                )
                                ,
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              // const SizedBox(
                              //   height: 15,
                              // ),
                            ],
                          ),

                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [

                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Sunset",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "06:05 PM",
                                style: const TextStyle(fontSize: 25, color: Colors.white
                                    ,fontWeight: FontWeight.bold
                                )
                                ,
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "⛅ ",
                                style: const TextStyle(fontSize: 80, color: Colors.white
                                    ,fontWeight: FontWeight.bold
                                )
                                ,
                              ),

                              const SizedBox(
                                height: 15,
                              ),





                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );

    ;
  }
}
