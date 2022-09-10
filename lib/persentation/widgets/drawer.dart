import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';
import 'package:alogoriza_task/persentation/screens/get_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class AnimatedDrawer extends StatefulWidget {
  final List<dynamic> weatherInfo;


  const AnimatedDrawer({
    Key? key, required this.weatherInfo

  }) : super(key: key);

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              //color: Colors.red,
              width: 128.0,
              height: 0.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              // clipBehavior: Clip.antiAlias,
              // decoration: BoxDecoration(
              //   color: Colors.black26,
              //   shape: BoxShape.circle,
              // ),
              // child: Image.asset(
              //   'assets/images/flutter_logo.png',
              // ),
            ),

            ListTile(
              onTap: () {},
              trailing: const Icon(UniconsLine.setting , size: 35,),


            ),

            Spacer(flex: 3,),





            ListTile(
              onTap: () {},
              leading: const Icon(UniconsLine.favorite , size: 35,),
              title: const Text('Favorite location', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                //color: Colors.white54,
              ),),

            ),


            Spacer(flex: 1,),



            ListTile(
              onTap: () {},
             // leading: const Icon(UniconsLine.location_point ,size: 20),


              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,


                children: [


                  Spacer(flex: 1,),


                  Expanded(
                      flex: 1,
                      child: Icon(UniconsLine.location_point ,size: 20 , color: Colors.white,)),
                  //Spacer(flex: 1,),


                  Expanded(

                    flex: 6,
                    child:  Text("${widget.weatherInfo[0]["city"]}", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,

                      //color: Colors.white54,
                    ),),
                  ),


                  Spacer(flex: 1),

                  Expanded(
                  flex: 1,
                  child: Image.asset('assets/img/moon.png',)),


                  Spacer(flex: 1),


                   Expanded(
                    flex: 2,
                    child: Text("${widget.weatherInfo[0]["degree"]}", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,

                      //color: Colors.white54,
                    ),),
                  ),
                  //Spacer(flex: 1),
                ],
              ),
              contentPadding:const EdgeInsets.only(left: 0) ,

            ),


            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 60,
                child: ElevatedButton(



                  child: const Text(
                    'Current location ',
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () {


                    print("drawerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");


                    BlocProvider.of<WeatherCubit>(context)
                        .getHereWeather();


                  },

                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),
                ),
              ),
            ),




            const Divider(

              thickness: 1, // thickness of the line
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              color: Colors.white, // The color to use when painting the line.
              height: 40, // The divider's height extent.
            ),



            ListTile(
              onTap: () {},
              leading: const Icon(Icons.location_on_outlined,  size: 35,),
              title: const Text('Other Locations', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                //color: Colors.white54,
              ),),

            ),



            Spacer(flex: 1,),



            ListView.builder(
              shrinkWrap: true,
              itemCount: SelectedCityNameList.Cities.length,
              itemBuilder: (BuildContext Context, int index){

                return   ListTile(
                  onTap: () {

                    BlocProvider.of<WeatherCubit>(context)
                        .getWeatherWithCityName(SelectedCityNameList.Cities[index]);


                    print("pressssssssed");



                  },
                  // leading: const Icon(UniconsLine.location_point ,size: 20),


                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,


                    children: [


                      Spacer(flex: 2,),



                      //Spacer(flex: 1,),


                      Expanded(

                        flex: 6,
                        child:  Text("${SelectedCityNameList.Cities[index]}", style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,

                          //color: Colors.white54,
                        ),),
                      ),


                      Spacer(flex: 1),

                      Expanded(
                          flex: 1,
                          child: Image.asset('assets/img/moon.png',)),


                      Spacer(flex: 1),


                       Expanded(
                        flex: 2,
                        child: Text("${SelectedCityNameList.degrees[index]}", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,

                          //color: Colors.white54,
                        ),),
                      ),
                      //Spacer(flex: 1),
                    ],
                  ),
                  contentPadding:const EdgeInsets.only(left: 0) ,

                );

              } ,

            ),









        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 60,
            child: ElevatedButton(


              child: const Text(
                'Manage Location',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {


                print("drawerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

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


              },

              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
              ),
      ),
          ),
        ),




            const Divider(

              thickness: 1, // thickness of the line
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              color: Colors.white, // The color to use when painting the line.
              height: 20, // The divider's height extent.
            ),








            ListTile(
              onTap: () {},
              leading: const Icon(UniconsLine.bug ,size: 30,),
              title:  const Text(
              'Report a bug',
              style: TextStyle(fontSize: 22),
            ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(UniconsLine.calling , size: 30,),
              title:  const Text(
                'Contact us',
                style: TextStyle(fontSize: 22),
              ),
            ),
            const Spacer(flex: 15,),

          ],
        ),
      ),
    );
  }
}
