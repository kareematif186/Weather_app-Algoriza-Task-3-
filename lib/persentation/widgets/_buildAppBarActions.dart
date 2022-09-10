import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class BuildAppBarActions extends StatefulWidget {

  bool isSearching ;
 // Function clearSearch;
  //Function startSearch;
  TextEditingController searchTextController2;
  //List<dynamic> Bloc1;
  //List<dynamic> Bloc2;

  //late double selectedCityLat;
  //late double selectedCityLon;

   BuildAppBarActions({Key? key,
     //required this.Bloc1,
    required this.searchTextController2,
  required this.isSearching,
     //required this.startSearch,
     //required this.selectedCityLon,
    // required this.clearSearch,
    // required this.selectedCityLat,



  }) : super(key: key);

  @override
  State<BuildAppBarActions> createState() => _BuildAppBarActionsState();
}

class _BuildAppBarActionsState extends State<BuildAppBarActions> {


  @override
  Widget build(BuildContext context) {


    print(widget.isSearching);


    if (widget.isSearching) {
      return
        Row(
          children: [


            IconButton(
              onPressed: () {

                print("clearrrrrrrrrrrr");
                _clearSearch();
                Navigator.pop(context);   //get out of the context to back
              },
              icon: const Icon(Icons.clear,

                  color: MyColors.myWhite2),
            ),

            // IconButton(
            //   onPressed: () {
            //
            //
            //
            //
            //
            //     BlocProvider.of<WeatherCubit>(context).getAllWeather(
            //         34.0522342,  -118.2436849);
            //
            //     weatherInfo2.clear();
            //
            //     print(selectedCityLat);
            //     print(selectedCityLon);
            //
            //     setState(() {
            //
            //     });
            //
            //
            //    // BlocProvider.of<WeatherCubit>(context).getAllWeather( 40.7127837, -74.0059413);
            //
            //
            //                            // 34.0522342
            //                         // ( 4471): -118.2436849
            //
            //   },
            //   icon: const Icon(UniconsLine.arrow_right,
            //       size: 30,
            //       color: MyColors.myWhite2),
            // ),

            IconButton(
              color: Colors.red,
              onPressed: () {


                //Bloc1;

               // BlocProvider.of<WeatherCubit>(context).getAllWeather( selectedCityLat, selectedCityLon);

                //BlocProvider.of<WeatherCubit>(context).weatherInfo2;


                //print(selectedCityLat);
                //print(selectedCityLon);

                //  BlocProvider.of<WeatherCubit>(context).getAllWeather( 40.7127837, -74.0059413);

                // BlocProvider.of<WeatherCubit>(context).getHereWeather();


                // 34.0522342
                // ( 4471): -118.2436849

              },
              icon: const Icon(UniconsLine.arrow_right,
                  size: 30,
                  color: MyColors.myWhite2),
            ),





          ],
        );

    }


    else {
      return
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            UniconsLine.search,
            size: 30,
            color: MyColors.myWhite2,
          ),
        );


    }

  }



  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));    // going to new route with new back_button

    BlocProvider.of<WeatherCubit>(context).getAllCityName();

    widget.isSearching = true;

    setState(() {
      print("changinggggggggggggggggggggg");
      widget.isSearching = true;

      print(widget.isSearching);
    });
  }
  void _stopSearching() {
    _clearSearch();

    setState(() {
      widget.isSearching = false;
    });
  }
  void _clearSearch() {
    setState(() {
      widget.searchTextController2.clear();
    });
  }


}


