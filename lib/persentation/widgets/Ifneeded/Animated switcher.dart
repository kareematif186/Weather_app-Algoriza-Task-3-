// AnimatedBackground(
// // vsync uses singleTicketProvider state mixin.
// vsync: this,
// behaviour: RandomParticleBehaviour(options: particles),
// child: CustomScrollView(
// shrinkWrap: true,
// slivers: [
// Container(
// child: SliverAppBar(
// // foregroundColor: Colors.black,
// floating: true,
// expandedHeight: 1000,
// pinned: false,
// stretch: false,
// elevation: 0,
// snap: true,
// backgroundColor: Color.fromARGB(100, 22, 44, 33),
// flexibleSpace: FlexibleSpaceBar(
// centerTitle: false,
//
// //title: Icon(UniconsLine.info),
//
// background: SingleChildScrollView(
// child: BuildSliverAppBar(
// weatherInfo: weatherInfo, state: state),
// ),
// )),
// ),
//
// //WeatherBg(weatherType: _weatherType,width: _width,height: _height,)
// //BuildSliverAppBar(weatherInfo: weatherInfo),
// SliverList(
// delegate: SliverChildListDelegate(
// [
// Stack(
// children: [
// Container(
// color: Colors.black,
// child: Column(
// children: [
// Container(
// padding: EdgeInsets.all(8),
// color: Colors.black,
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// SizedBox(
// height: 40,
// ),
// AppBar(
// backgroundColor: Colors.black,
// leading: _isSearching
// ? const BackButton(
// color:
// MyColors.myWhite2,
// )
// : Container(),
// title: _isSearching
// ? BuildSearchField(
// mainPagecontext: context,
// selectedCityNameForPrediction2:selectedCityNameForPrediction2 ,
// strs: strs,
// searchTextController2:
// _searchTextController2,
// GetListOFCityesName:
// GetListOFCityesName,
// selectedCityLatAndLon:
// selectedCityNameForPrediction,
// addSearchedFOrItemsToSearchedList:
// addSearchedFOrItemsToSearchedList,
// )
// : BuildAppBarTitle(),
//
// actions: _buildAppBarActions(),
//
// //   [
// //   BuildAppBarActions(
// //
// //   isSearching: _isSearching ,
// //   searchTextController2: _searchTextController2,
// //   // selectedCityLat: selectedCityLat ,
// //   // selectedCityLon: selectedCityLon,
// //    // Bloc1: print(_isSearching)
// //
// //   ),
// // ]
// //
//
// //search icon
// ),
// Row(
// children: [
// Container(
// padding:
// const EdgeInsets.only(
// left: 10),
// child: const Icon(
// UniconsLine.list_ui_alt,
// color: Colors.white,
// size: 60,
// ),
// ),
// SizedBox(
// width: 50,
// ),
// Text(
// "${weatherInfo[0]["city"]}",
// style: const TextStyle(
// fontSize: 40,
// color: white),
// ),
// SizedBox(
// width: 10,
// ),
// const Icon(
// UniconsLine
//     .map_marker_shield,
// color: white,
// size: 35,
// ),
// ],
// ),
// const SizedBox(
// height: 90,
// ),
// Padding(
// padding: const EdgeInsets.only(
// left: 40, right: 40),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// children: [
// Text(
// "${weatherInfo[0]["degree"]}",
// style: const TextStyle(
// fontSize: 100,
// color: white,
// //fontWeight: FontWeight.bold
// ),
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .center,
// children: [
// Text(
// "${weatherInfo[0]["degree"]} / "
// "${weatherInfo[3]["degree"]}  "
// "Feels like ${weatherInfo[0]["feelslike"]} ",
// style: const TextStyle(
// fontSize: 22,
// color: white,
// fontWeight:
// FontWeight
//     .bold),
// ),
// Text(
// "${weatherInfo[0]["id"].substring(0, 3)}, ${weatherInfo[0]["clock"]} ",
// style: TextStyle(
// fontSize: 22,
// color: white,
// fontWeight:
// FontWeight
//     .bold),
// ),
// ],
// ),
// Container(
// height: 120,
// child: Image.asset(
// "assets/img/sun.png")),
// ],
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding:
// const EdgeInsets.all(8.0),
// child: Container(
// //  padding: const EdgeInsets.all(8.0),
// width: double.infinity,
// height: 350,
// decoration: BoxDecoration(
// color: blacklight,
// borderRadius:
// const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: blacklight,
// style: BorderStyle.solid,
// ),
// ),
// child: Column(
// children: [
// const SizedBox(
// height: 30,
// ),
//
// SizedBox(
// height: 300,
// child: DaysChart(
// weatherInfo:
// weatherInfo),
// ),
//
// // Container(height: 70,)
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// Container(
// padding: const EdgeInsets.all(18),
// width: double.infinity,
// decoration: BoxDecoration(
// color: blacklight,
// borderRadius: const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: blacklight,
// style: BorderStyle.solid,
// ),
// ),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// const SizedBox(
// height: 60,
// ),
// const Text(
// "Today Temperature",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 28,
// color: Colors.white),
// ),
// const SizedBox(
// height: 15,
// ),
// Container(
// //height: 170,
// child: const Text(
// "Expect the same as yesterday ",
// style: TextStyle(
// fontSize: 28,
// color: Colors.white),
// )),
// const SizedBox(
// height: 60,
// ),
// ],
// ),
// ),
// Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: blacklight,
// borderRadius: const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: blacklight,
// style: BorderStyle.solid,
// ),
// ),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// children: [
// const SizedBox(
// height: 60,
// ),
// const Text(
// "Today Temperature",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 28,
// color: Colors.white),
// ),
// const SizedBox(
// height: 15,
// ),
// Container(
// //height: 170,
// child: const Text(
// "Expect the same as yesterday ",
// style: TextStyle(
// fontSize: 28,
// color: Colors.white),
// )),
// const SizedBox(
// height: 60,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// );