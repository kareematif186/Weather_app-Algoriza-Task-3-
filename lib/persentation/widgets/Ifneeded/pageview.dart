// import 'package:flutter/cupertino.dart';
//
// Container(
// height: 2000,
// child:
//
//
//
// PageView.builder(
// onPageChanged: (value) {
//
// //BlocProvider.of<WeatherCubit>(context).getHereWeather();
//
// // BlocProvider.of<WeatherCubit>(context).getHereWeather();
//
//
// },
// // physics: AlwaysScrollableScrollPhysics(),
// //physics: const NeverScrollableScrollPhysics(),
// allowImplicitScrolling: true,
// controller: controller,
// pageSnapping: true,
// itemCount: 2,
//
// itemBuilder: (context, index) =>  Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding:  const EdgeInsets.only(left: 50),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "${weatherInfo[0]["degree"]}\u00B0",
// style: const TextStyle(fontSize: 150, color: white , fontWeight: FontWeight.bold),
// ),
// // Container(
// //     height: 150, child: Image.asset("assets/img/sun.png")),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(right: 8.0),
// child: Text(
// "${weatherInfo[0]["clear"]}",
// style: const TextStyle(fontSize: 40, color: white),
// ),
// ),
//
// const SizedBox(
// height: 90,
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(18),
// child: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.transparent,
// borderRadius: const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: Colors.transparent,
// style: BorderStyle.solid,
// ),
// ),
// child: Column(
// children: [
// Column(
//
// children: [
// const SizedBox(
// height: 30,
// ),
// SizedBox(
// height: 350,
//
// child: TimeAndsun(weatherInfo: weatherInfo),
// ),
//
// ],
// ),
// ],
// ),
// ),
// ),
//
//
// Padding(
// padding: const EdgeInsets.all(18),
// child: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: const Color(0xff8cbaec),
// borderRadius: const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: const Color(0xff8cbaec),
// style: BorderStyle.solid,
// ),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
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
// style: TextStyle(fontSize: 28, color: Colors.white),
// )),
// const SizedBox(
// height: 60,
// ),
// ],
// ),
// ),
// ),
//
// const SizedBox(
// height: 20,
// ),
// Container(
// width: double.infinity,
// //height: 400,
// decoration: BoxDecoration(
// color: const Color(0xff8cbaec),
// borderRadius: const BorderRadius.all(
// Radius.circular(50),
// ),
// border: Border.all(
// width: 0,
// color: const Color(0xff8cbaec),
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
// child:
// DaysChart(weatherInfo: weatherInfo),
// ),
//
//
// // Container(height: 70,)
// ],
// ),
// ),
//
// const SizedBox(
// height: 100,
// ),
//
//
//
//
//
// ],
// ),
// ),
// ),