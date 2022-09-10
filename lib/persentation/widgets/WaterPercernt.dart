import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterPercernt extends StatelessWidget {

  final List weatherInfo;
  const WaterPercernt({
    Key? key, required this.weatherInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 39, //numberofcontainers[index],
      itemBuilder: (BuildContext context, int index2) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Container(
              child: SizedBox(
                width: 57,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                          "assets/img/water.png"),
                      width: 22,
                    ),


                     Text(
                      "${weatherInfo[0]["humidity"]} %" ,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white),
                    ),

                    //Image.asset("assets/img/person.jpeg")
                  ],
                ),
              ),
              //SizedBox(width: 55,)
            ),
          ),
        );
      },
    );
  }
}
