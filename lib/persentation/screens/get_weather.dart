import 'dart:convert';

import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/constants/colors.dart';
import 'package:alogoriza_task/constants/strings.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';
import 'package:alogoriza_task/data/models/searchedCityWeather.dart';
import 'package:alogoriza_task/persentation/screens/Weather_screen2.dart';
import 'package:alogoriza_task/persentation/screens/weather_screen.dart';
import 'package:alogoriza_task/persentation/widgets/Dayschart.dart';
import 'package:alogoriza_task/persentation/widgets/_buildAppBarTitle.dart';
import 'package:alogoriza_task/persentation/widgets/_buildSearchField.dart';
import 'package:alogoriza_task/persentation/widgets/_buildSliverAppBar.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import 'package:alogoriza_task/data/models/checkbox_state.dart';


import '../../data/models/Location.dart';

import 'package:http/http.dart' as http;

import '../../data/models/checkbox_state.dart';
import '../../data/models/checkbox_state.dart';
import '../../data/models/checkbox_state.dart';
import '../../data/models/checkbox_state.dart';

class Get_Weather extends StatefulWidget {
  Get_Weather({
    Key? key,

    // required  this.searchTextController2,
    //  required this.buildAppBarActions,
    //  required this.strs,
    //  required this.GetListOFCityesName,
    //  required this.selectedCityLatAndLon,
    //   required this.addSearchedFOrItemsToSearchedList,
    //   required this.selectedCityNameForPrediction2,
    //   required this.mainPagecontext,
  }) : super(key: key);

  //  List<String> strs;
  //
  // TextEditingController searchTextController2;
  // Function GetListOFCityesName;
  // Function selectedCityLatAndLon;
  // Function buildAppBarActions;
  // Function addSearchedFOrItemsToSearchedList;
  // Function selectedCityNameForPrediction2;
  //  BuildContext mainPagecontext;
  @override
  State<Get_Weather> createState() => _Get_WeatherState();
}




class _Get_WeatherState extends State<Get_Weather> with TickerProviderStateMixin {
  ParticleOptions particles = ParticleOptions(
    baseColor: Colors.white,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 4.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 1.0,
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
  static ScrollController _scrollController = ScrollController();

  static bool _bigBox = false;
  static late Color backgroundColor = Colors.transparent;
  static bool isCollapsed = true;
  static bool isCollapsed2 = false;

   late TextEditingController _searchTextController2 = TextEditingController();
  static final _searchTextController = TextEditingController();
  static late List<dynamic> searchedForCharacters;
  static final PageController controller = PageController();
  static final PageController _controller = PageController(initialPage: 0);

  static  List WeatherList = [];
  static CheckBoxState checkbox = CheckBoxState();
  static List<String> dayArray = [];
  static List<String> degreeArray = [];
  static List<CheckBoxState> generatedList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<WeatherCubit>(context).getAllCityName();
    print("lengthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh11");
     print(WeatherList.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();




    //Navigator.pushNamed(context, weatherScreen);
  }

  // cuz it cuz an error
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.all(
          //   Radius.circular(50),
          // ),
          border: Border.all(
            width: 0,
            color: Colors.white10,
            style: BorderStyle.solid,
          ),

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black,Colors.blue[900]!, ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(
              color: MyColors.myWhite2,
            ),
          ),
          body:
              BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {

                if (state is WeatherInfoLoaded) {
                  //weatherInfo2 = state.weatherInfo;


                 print( "weatherstateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11");



                  return Manage_Cities();


                }

                if (state is WeatherInfoLoaded2) {
              weatherInfo2 = state.weatherInfo;

              print( "weatherstateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee22");



              return Manage_Cities();


            }


            else if (state is WeatherInfoLoaded3) {
              weatherInfo = state.weatherInfo;

              print("newwwwwwwwwwwwwwwwwwwwwwwwww");
              print(generatedList.length);
              print(dayArray);

              if (WeatherList.contains(weatherInfo)) {
                print("contains");
              }

              else {
                WeatherList.add(weatherInfo);
                generatedList.add(CheckBoxState(value: false));
                dayArray.add(weatherInfo[0]["city"]);
                degreeArray.add(weatherInfo[0]["degree"].toString());


                // generatedList =  List<CheckBoxState>.generate(WeatherList.length, (i) {
                //   return CheckBoxState(
                //       value: false
                //   );});



                print("adddddddddddddddddddddddddddddddddddddded");
                print("lengthhhhhhhhhhhhhhhhhhhhh WeatherList");

                print(WeatherList.length);

                print("lengthhhhhhhhhhhhhhhhhhhhh WeatherList generatedList");

                print(generatedList.length);
              };

              return Manage_Cities();
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }




  Padding Manage_Cities() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedBackground(
        //vsync uses singleTicketProvider state mixin.
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Manage Cities ",
                    style: TextStyle(
                        fontSize: 50, color: Colors.white.withOpacity(0.7))),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BuildSearchBar(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: WeatherList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

                        //BlocProvider.of<WeatherCubit>(context).getHereWeather();



                        BlocProvider.of<WeatherCubit>(context).getWeatherWithCityName(WeatherList[index][0]["city"]);

                        //BlocProvider.of<WeatherCubit>(context).ActiveFirstState1();

                        // Navigator.of(context).push(
                        //   MaterialPageRoute<WeatherCubit>(
                        //     builder: (_) {
                        //       return BlocProvider.value(
                        //         value: BlocProvider.of<WeatherCubit>(context),
                        //         child: Weather_Screen2(),
                        //       );
                        //     },
                        //   ),
                        // );


                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                // color: Colors.white10,

                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Colors.blue[900]!,
                                      Colors.white10,
                                      Colors.white10
                                    ]),

                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  width: 0,
                                  color: Colors.white10,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              width: double.infinity,
                              height: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${WeatherList[index][0]["city"]}",
                                              style: const TextStyle(
                                                fontSize: 30,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${WeatherList[index][0]["id"].substring(0, 3)}, ${WeatherList[index][0]["clock"]} ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Spacer(),

                                  Expanded(
                                    child: Container(
                                        height: 60,
                                        child: Image.asset("assets/img/moon.png")),
                                  ),

                                  VerticalDivider(
                                    color: Colors.white12,
                                    thickness: 0,
                                    width: 10,
                                  ),

                                  Expanded(child: buildSingleCheckBox(index)),

                                  Text(
                                    "${WeatherList[index][0]["degree"]}\u00B0",
                                    style: const TextStyle(
                                        fontSize: 50,
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Transform buildSingleCheckBox(int index) {
    return Transform.scale(
      scale: 2.0,
      child: Checkbox(
        value:generatedList.length==0? false : generatedList[index].value, //_bigBox,
        activeColor: Colors.transparent,
        checkColor: Colors.white,

//Simply add this line
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //splashRadius: 40,
        onChanged: (value) {
          //   _bigBox = value!;
          setState(() {});



          if(generatedList.length!=0) {
            generatedList[index].value = value!;
          }
          if(generatedList[index].value==false) {
              print("onherrrrrrrrrrrrreeeeeeeeeeeeeeeeeeee");
              BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();

              WeatherList.removeAt(index);
              generatedList.removeAt(index);
              dayArray.removeAt(index);
              degreeArray.removeAt(index);


          }


          SelectedCityNameList.Cities=dayArray;
          SelectedCityNameList.degrees=degreeArray;

           BlocProvider.of<WeatherCubit>(context)
               .getHereWeather();

          // BlocProvider.of<WeatherCubit>(context)
          //     .ActiveFirstState2();


          // BlocProvider.of<WeatherCubit>(context)
          //     .getHereWeather();


          // if (WeatherList.contains(weatherInfo)==false) {
          //   if (tempArray.contains(WeatherList[index][0]["city"])) {
          //     tempArray.remove(WeatherList[index][0]["city"]);
          //
          //     generatedList.removeAt(index);
          //   }
          //   else {
          //     tempArray.add(WeatherList[index][0]["city"]);
          //
          //     generatedList.length == tempArray.length ? print(
          //         " equalllllllllllllllllllllll") :
          //     generatedList.add(CheckBoxState(value: false));
          //   }




          // if(generatedList[index].value==false){
          //
          //
          //
          //
          //
          // }





          print("genertated list on check box");

          print(generatedList.length);
          print(dayArray);

          print("bloc provider");


         //remove everything also on textfield and emptyyyyyyyyyyyy
         //  for (int i = 0; i < WeatherList.length; i++) {
         //    BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();
         //    if (generatedList[i].value == false) {
         //      print("bloc provider2");
         //
         //
         //      if (tempArray.length == 0) {
         //        print("bloc provider3");
         //
         //        WeatherList.clear();
         //        generatedList.clear();
         //      } else {
         //
         //        print("bloc provider4");
         //
         //
         //
         //        for (int i = 0; i < WeatherList.length; i++) {
         //          print("bloc provider5");
         //
         //          if (tempArray.contains(WeatherList[i][0]["city"])) {
         //            print("bloc provider6");
         //
         //
         //
         //            for (int i2 = 0; i2 < tempArray.length; i2++) {
         //              if (tempArray[i2] != WeatherList[i][0]["city"]) {
         //
         //
         //              }
         //              else{
         //
         //                print("bloc provider7");
         //
         //                tempArray.removeAt(i2);
         //                generatedList.removeAt(i2);
         //
         //                print("gneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
         //                print(generatedList.length);
         //                print(tempArray);
         //
         //              }
         //            }
         //
         //
         //
         //          } else {
         //
         //
         //
         //
         //            print("bloc provider8");
         //
         //
         //            WeatherList.removeAt(i);
         //          }
         //        }
         //      }
         //    } else {}
         //  }




        },
      ),
    );
  }

  Widget BuildSearchBar() {
    return Autocomplete(optionsBuilder: (_searchTextController2) async {
      if (_searchTextController2.text == '') {


        print("emptyyyyy");

        //remove everything also on textfield and emptyyyyyyyyyyyy
        //remove everything also on textfield and emptyyyyyyyyyyyy



        // if(WeatherList.length!=0){
        for(int i=0 ; i<WeatherList.length;i++) {
          if (generatedList[i].value == false) {
            print("onherrrrrrrrrrrrreeeeeeeeeeeeeeeeeeee");
            BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();

            WeatherList.removeAt(i);
            generatedList.removeAt(i);
            dayArray.removeAt(i);
            degreeArray.removeAt(i);

          }


          SelectedCityNameList.Cities=dayArray;
          SelectedCityNameList.degrees=degreeArray;

          BlocProvider.of<WeatherCubit>(context)
              .getHereWeather();

        }
        // }



        return Iterable<String>.empty();
      } else {
        List<String> matches = <String>[];

        strs = GetListOFCityesName();

        matches.addAll(strs);

        matches.retainWhere((s) {
          return s
              .toLowerCase()
              .contains(_searchTextController2.text.toLowerCase());
        });

        //  strs.clear();

        // print(strs);

        return matches;
      }
    }, onSelected: (selectedString) {
      selectedCityNameForPrediction(selectedString.toString());

      String? CityName2 =
          selectedCityNameForPrediction2(selectedString.toString());
      print(CityName2);
      print("hererererererererere");



      if(dayArray.contains(CityName2)){


      }
      else{
        BlocProvider.of<WeatherCubit>
          (context).getWeatherWithCityName(CityName2);




         // tempArray.add(CityName2.toString());



      }

      //BlocProvider.of<WeatherCubit>(context).getWeatherWithCityName(CityName2);





    }, fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
      this._searchTextController2 = controller;

      return Container(
        //color: Colors.red,
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

        child: TextField(
          controller: controller,
          onEditingComplete: onEditingComplete,
          cursorColor: MyColors.myWhite2,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                UniconsLine.search,
                size: 30,
                color: Colors.white.withOpacity(0.4),
              ),
            ),

            //contentPadding:  const EdgeInsets.only(left: 5 ),

            hintText: 'Search for a city...',
            border: InputBorder.none,
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 25),
          ),
          style: const TextStyle(color: MyColors.myWhite2, fontSize: 18),
          // onTap: () {
          //   print("bloc provider");
          //
          //   //print(generatedList[0].value);
          //   //print(WeatherList.length );
          //
          //   for (int i = 0; i < WeatherList.length; i++) {
          //     //print("valuuuuuuuuuuuuuuues");
          //     //print(generatedList[i].value);
          //
          //     BlocProvider.of<WeatherCubit>(context).ActiveFirstState2();
          //
          //     if (generatedList[i].value == false) {
          //       print("bloc provider2");
          //
          //       // WeatherList.clear();
          //
          //       // WeatherList.removeAt(1);
          //       // generatedList.removeAt(1);
          //       //
          //       // // setState(() {
          //       // //
          //       // // });
          //       //
          //       // WeatherList.length;
          //
          //       if (tempArray.length == 0) {
          //         WeatherList.clear();
          //         generatedList.clear();
          //       } else {
          //
          //
          //         for (int i = 0; i < WeatherList.length; i++) {
          //           if (tempArray.contains(WeatherList[i][0]["city"])) {
          //           } else {
          //             for (int i2 = 0; i2 < tempArray.length; i2++) {
          //               if (tempArray[i2] == WeatherList[i][0]["city"]) {
          //                 tempArray.removeAt(i2);
          //               }
          //             }
          //
          //             WeatherList.removeAt(i);
          //           }
          //         }
          //       }
          //     } else {}
          //   }
          // },
          onChanged: (searchedCharacter) {
            addSearchedFOrItemsToSearchedList(searchedCharacter);
          },
        ),
      );
    });
  }

  List<String> GetListOFCityesName() {
    final SearchedCityWeather SearchedCityWeather3 = weatherInfo2[1];
   // print(weatherInfo2[0]);
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

                if(dayArray.contains(CityName)){


                }
                else{
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherWithCityName(CityName!);

                }




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

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    // print(searchedCharacter);

    selectedCityNameForPrediction(searchedCharacter);

    // searchedForCharacters = cities
    //     .where((character) =>
    //     character[0].startsWith(searchedCharacter)).toList();
    //  setState(() {});
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

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove: _stopSearching)); // going to new route with new back_button

    BlocProvider.of<WeatherCubit>(context).getAllCityName();

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
}
