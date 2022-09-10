import 'package:alogoriza_task/persentation/widgets/SFCartesianChart.dart';
import 'package:alogoriza_task/persentation/widgets/WaterPercernt.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';

class TimeAndsun extends StatelessWidget {
  const TimeAndsun({
    Key? key,
    required this.weatherInfo,
  }) : super(key: key);

  final List weatherInfo;

  @override
  Widget build(BuildContext context) {
    return
      ListView(

          scrollDirection: Axis.horizontal,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [



          Container(
            height: 90,
            //width: 3000,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 39, //numberofcontainers[index],
              itemBuilder: (BuildContext context, int index2) {

                DateTime dateTime=DateTime.parse(weatherInfo[index2]["time"]);

                String timeFormat = DateFormat('hh:mm a').format(dateTime);



                return Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: SizedBox(
                    //width: 58,

                    //width: 57,

                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,



                      children: [
                        const SizedBox(width: 12,),
                        Column(

                          children: [
                            Text(
                              '${timeFormat}',
                              style: const TextStyle(
                                  fontSize: 15, color: white
                              ,fontWeight: FontWeight.bold
                              ),


                            ),


                            const SizedBox(
                              height: 20,
                            ),
                            (timeFormat.substring(6,) == "AM")
                                ? Container(
                                height: 45,
                                child: Image.asset("assets/img/sun.png"))
                                : Container(
                              height: 45,

                              child: Image.asset(

                                  "assets/img/moon2.png"),
                                ),

                          ],
                        ),

                        const SizedBox(
                          width: 0,
                        ),










                        //Image.asset("assets/img/person.jpeg")
                      ],
                    ),
                  ),
                );
              },
            ),
          ),




            Container(
              height: 110,


                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(

                   width: 3000,
                    child: SFCartesianChart(weatherInfo: weatherInfo))
            ),


               SizedBox(height: 30,),


               Container(
                height: 70,
                child: WaterPercernt(weatherInfo: weatherInfo,),
              ),






          ],),
        ],
      );
  }
}