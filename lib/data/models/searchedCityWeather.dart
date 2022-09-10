class SearchedCityWeather {
  String? city;
  String? growthFrom2000To2013;
  double? latitude;
  double? longitude;
  String? population;
  String? rank;
  String? state;

  SearchedCityWeather(
      {this.city,
        this.growthFrom2000To2013,
        this.latitude,
        this.longitude,
        this.population,
        this.rank,
        this.state});

  SearchedCityWeather.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    growthFrom2000To2013 = json['growth_from_2000_to_2013'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    population = json['population'];
    rank = json['rank'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['growth_from_2000_to_2013'] = this.growthFrom2000To2013;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['population'] = this.population;
    data['rank'] = this.rank;
    data['state'] = this.state;
    return data;
  }
}