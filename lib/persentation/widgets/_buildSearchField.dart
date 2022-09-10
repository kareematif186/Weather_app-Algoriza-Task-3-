import 'package:alogoriza_task/business_logic/weather_cubit.dart';
import 'package:alogoriza_task/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildSearchField extends StatelessWidget {
  TextEditingController searchTextController2;
  List<String> strs;
  Function selectedCityLatAndLon;
  Function GetListOFCityesName;
  Function addSearchedFOrItemsToSearchedList;
  Function selectedCityNameForPrediction2;
  BuildContext mainPagecontext;  // cuz it cuz an error

  BuildSearchField(
      {Key? key,
      required this.strs,
      required this.searchTextController2,
      required this.selectedCityLatAndLon,
      required this.addSearchedFOrItemsToSearchedList,
      required this.GetListOFCityesName,
        required this.selectedCityNameForPrediction2,
        required this.mainPagecontext


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? CityName2;

    return Autocomplete(optionsBuilder: (_searchTextController2) async {
      if (_searchTextController2.text == '') {
        print("emptyyyyy");
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
    },

        onSelected: (selectedString) {
      selectedCityLatAndLon(selectedString.toString());

      String? CityName2 = selectedCityNameForPrediction2(selectedString);
      print(CityName2);
      print("hererererererererere");


          BlocProvider.of<WeatherCubit>(mainPagecontext)
          .getWeatherWithCityName(CityName2!);


    }, fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
      this.searchTextController2 = controller;

      return TextField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        cursorColor: MyColors.myWhite2,
        focusNode: focusNode,
        decoration: const InputDecoration(
          hintText: 'Search for a city...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.myWhite2, fontSize: 18),
        ),
        style: const TextStyle(color: MyColors.myWhite2, fontSize: 18),
        onChanged: (searchedCharacter) {
          addSearchedFOrItemsToSearchedList(searchedCharacter);
        },
      );
    });
  }
}
