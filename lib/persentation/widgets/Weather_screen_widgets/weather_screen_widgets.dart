// import 'package:alogoriza_task/business_logic/weather_cubit.dart';
// import 'package:alogoriza_task/constants/colors.dart';
// import 'package:alogoriza_task/persentation/widgets/Dayschart.dart';
// import 'package:alogoriza_task/persentation/widgets/TimeandSun.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:unicons/unicons.dart';
//
//
// Widget forkimo(){return Container();}
//
// Widget buildSliverAppBar(List weatherInfo) {
//   return SliverAppBar(
//     foregroundColor: Colors.black,
//     floating: true,
//     expandedHeight: 1000,
//     pinned: false,
//     stretch: false,
//     snap: true,
//     backgroundColor: blueaccent,
//     flexibleSpace: FlexibleSpaceBar(
//       centerTitle: false,
//
//       //title: Icon(UniconsLine.info),
//
//       background: Hero(
//         tag: 1,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: const Icon(
//                   UniconsLine.list_ui_alt,
//                   color: Colors.white,
//                   size: 80,
//                 ),
//               ),
//               const SizedBox(
//                 height: 90,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 70, right: 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${weatherInfo[0]["degree"]}\u2103",
//                       style: const TextStyle(fontSize: 150, color: white),
//                     ),
//                     Container(
//                         height: 150,
//                         child: Image.asset("assets/img/sun.png")),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 80),
//                 child: Row(
//                   children: [
//                     Text(
//                       "${weatherInfo[0]["city"]}",
//                       style: const TextStyle(fontSize: 40, color: white),
//                     ),
//                     const Icon(
//                       UniconsLine.location_point,
//                       color: white,
//                       size: 40,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 90,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 70),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${weatherInfo[3]["degree"]} \u2103 "
//                           "${weatherInfo[0]["degree"]}\u2103  "
//                           "Feels like ${weatherInfo[3]["feelslike"]}\u2103 ",
//                       style: const TextStyle(
//                           fontSize: 25,
//                           color: white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Sun, ${""}",
//                       style: TextStyle(
//                           fontSize: 25,
//                           color: white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(18),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff8cbaec),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(50),
//                     ),
//                     border: Border.all(
//                       width: 0,
//                       color: const Color(0xff8cbaec),
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           SizedBox(
//                             height: 350,
//                             child: TimeAndsun(weatherInfo: weatherInfo),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(18),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff8cbaec),
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(50),
//                     ),
//                     border: Border.all(
//                       width: 0,
//                       color: const Color(0xff8cbaec),
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(
//                         height: 60,
//                       ),
//                       const Text(
//                         "Today Temperature",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 28,
//                             color: Colors.white),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         //height: 170,
//                           child: const Text(
//                             "Expect the same as yesterday ",
//                             style: TextStyle(fontSize: 28, color: Colors.white),
//                           )),
//                       const SizedBox(
//                         height: 60,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: double.infinity,
//                 //height: 400,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff8cbaec),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(50),
//                   ),
//                   border: Border.all(
//                     width: 0,
//                     color: const Color(0xff8cbaec),
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//
//                     SizedBox(
//                       height: 300,
//                       child: DaysChart(weatherInfo: weatherInfo),
//                     ),
//
//                     // Container(height: 70,)
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 width: double.infinity,
//                 //height: 400,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff8cbaec),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(50),
//                   ),
//                   border: Border.all(
//                     width: 0,
//                     color: const Color(0xff8cbaec),
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//                 child: Container(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget _buildSearchField3(strs , getListOFCityesName() ,  selectedCityLatAndLon ,
//     addSearchedFOrItemsToSearchedList , this1  ) {
//   return Autocomplete(optionsBuilder: (_searchTextController2) async {
//     if (_searchTextController2.text == '') {
//       print("emptyyyyy");
//       return Iterable<String>.empty();
//     } else {
//       List<String> matches = <String>[];
//
//       strs = getListOFCityesName();
//
//       matches.addAll(strs);
//
//       matches.retainWhere((s) {
//         return s
//             .toLowerCase()
//             .contains(_searchTextController2.text.toLowerCase());
//       });
//
//       //  strs.clear();
//
//       // print(strs);
//
//       return matches;
//     }
//   },
//       // onSelected: (String selection) {
//       //   print('You just selected $selection');
//       // },
//
//       // optionsViewBuilder:
//       //     (context, Function(String) onSelected, options) {
//       //   return Material(
//       //     elevation: 4,
//       //     child: ListView.separated(
//       //       padding: EdgeInsets.zero,
//       //       itemBuilder: (context, index) {
//       //         final option = options.elementAt(index);
//       //
//       //         return ListTile(
//       //           // title: Text(option.toString()),
//       //           // title: SubstringHighlight(
//       //           //   text: option.toString(),
//       //           //   term: controller.text,
//       //           //   textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
//       //           // ),
//       //           subtitle: Text("This is subtitle"),
//       //           onTap: () {
//       //             onSelected(option.toString());
//       //           },
//       //         );
//       //       },
//       //       separatorBuilder: (context, index) => Divider(color: Colors.white),
//       //       itemCount: options.length,
//       //     ),
//       //   );
//       // },
//       onSelected: (selectedString) {
//         selectedCityLatAndLon(selectedString.toString());
//       }, fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
//         this1._searchTextController2 = controller;
//
//         return TextField(
//           controller: controller,
//           onEditingComplete: onEditingComplete,
//           cursorColor: MyColors.myWhite2,
//           focusNode: focusNode,
//           decoration: const InputDecoration(
//             hintText: 'Search for a city...',
//             border: InputBorder.none,
//             hintStyle: TextStyle(color: MyColors.myWhite2, fontSize: 18),
//           ),
//           style: const TextStyle(color: MyColors.myWhite2, fontSize: 18),
//           onChanged: (searchedCharacter) {
//             addSearchedFOrItemsToSearchedList(searchedCharacter);
//           },
//         );
//       });
// }
//
//
//
// List<Widget> _buildAppBarActions(_isSearching , _clearSearch() , context , selectedCityLat ,
//     selectedCityLon , _startSearch ) {
//   if (_isSearching) {
//     return [
//       Row(
//         children: [
//           IconButton(
//             onPressed: () {
//               _clearSearch();
//               Navigator.pop(context); //get out of the context to back
//             },
//             icon: const Icon(Icons.clear, color: MyColors.myWhite2),
//           ),
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<WeatherCubit>(context)
//                   .getWeatherWithCityName(selectedCityLat, selectedCityLon);
//
//               // BlocProvider.of<WeatherCubit>(context).getAllWeather( 40.7127837, -74.0059413);
//             },
//             icon: const Icon(UniconsLine.arrow_right,
//                 size: 30, color: MyColors.myWhite2),
//           ),
//         ],
//       ),
//     ];
//   } else {
//     return [
//       IconButton(
//         onPressed: _startSearch,
//         icon: const Icon(
//           UniconsLine.search,
//           size: 30,
//           color: MyColors.myWhite2,
//         ),
//       ),
//     ];
//   }
// }
//
// Widget _buildAppBarTitle() {
//   return const Text(
//     '',
//     style: TextStyle(color: MyColors.myWhite2, fontSize: 28),
//   );
// }
//
//
//
//
