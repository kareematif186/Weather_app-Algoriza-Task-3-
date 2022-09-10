import 'package:alogoriza_task/data/models/Degree.dart';

final List<Degree> data = [];



List<Degree> WeatherUsedDataMethod(List weatherInfo) {

  data.clear();


  for (int i = 0; i <= 39; i++) {
    double degreeno = weatherInfo[i]["degree"].toDouble();

    String time = weatherInfo[i]["time"];

    Degree degree= Degree(degree: degreeno, time: time);


    data.add(degree);

  }

  //print(data);

  //print(data.length);
  return data;
}
