import 'package:alogoriza_task/data/models/Degree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysChart extends StatelessWidget {
   DaysChart({
    Key? key,


    required this.weatherInfo,
  }) : super(key: key);

 // final List<String> days;
//  final List<String> degree1;
 // final List<String> degree2;
  final List weatherInfo;




  @override
  Widget build(BuildContext context) {
    List<String> comparingDays=[];
    bool value=true;


    return Container(

      child: ListView.builder(
         scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 39, //numberofcontainers[index],
        itemBuilder: (BuildContext context, int index2) {



          // DateTime dateTime=DateTime.parse(weatherInfo[index2]["time"]);
          //
          // String timeFormat = DateFormat('EEEE').format(dateTime);
          //
          // comparingDays.add(timeFormat);
          //
          // print(comparingDays);
          // print(index2);
          //
          //
          // if(index2>0 &&comparingDays[index2-1]==comparingDays[index2]){
          //
          //   int index3=index2+1;
          //
          //
          //   DateTime dateTime=DateTime.parse(weatherInfo[index2]["time"]);
          //
          //   timeFormat = DateFormat('EEEE').format(dateTime);
          //   print(index2);
          //
          //
          // }
          //

//      if(index2>0&& weatherInfo[index2-1]["id"]==weatherInfo[index2]["id"]) {


          if(
          index2>0 && weatherInfo[index2-1]["id"]==weatherInfo[index2]["id"]

            ||weatherInfo[index2]["clock"].substring(0,5) != "12:00"




          ) {




           // print( weatherInfo[index2]["clock"].substring(0,5));
            //print(weatherInfo[index2]);

          return Container(

          );


        }

        else {
           // print(weatherInfo[index2+1]["id"]);
           // print(weatherInfo[index2+4]);
            //print(weatherInfo[index2]);
           // print("____________________________________");
           // print(weatherInfo[index2]);
           // print(weatherInfo[index2+4]);
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,

                      child: Column(
                        children: [
                          Row(
                            children: [

                              Text(
                                '${ weatherInfo[index2+1]["id"]}',
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.bold),
                              ),

                              //Image.asset("assets/img/person.jpeg")
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        //SizedBox(height: 10,),

                        Row(
                          children: [
                            Container(
                              child: Image.asset(
                                  "assets/img/water.png"),
                              width: 22,
                              height: 40,
                            ),

                            const Text(
                              ' 0%',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white),
                            ),

                            //Image.asset("assets/img/person.jpeg")
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        //SizedBox(height: 10,),

                        Container(
                            height: 40,
                            child: Image.asset(
                                "assets/img/sun.png")),

                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        //SizedBox(height: 10,),

                        Container(
                            height: 40,
                            child: Image.asset(
                                "assets/img/moon2.png")),

                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                             // '${weatherInfo[index2+4]["degree"]}',
                              '${weatherInfo[index2+4]["degree"]}',
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white),
                            ),

                            //Image.asset("assets/img/person.jpeg")
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${weatherInfo[index2]["degree"]}',
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white),
                              ),

                              //Image.asset("assets/img/person.jpeg")
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
       }



        },
      ),
    );
  }
}
