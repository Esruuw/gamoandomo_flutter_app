class Main {
  double temp;
  int humidity;
  double tempMin;
  double tempMax;
  double seaLevel;
  double grndLevel;

  Main({
    required this.temp,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
    required this.seaLevel,
    required this.grndLevel,
  });

  Main.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        humidity = json['humidity'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'],
        seaLevel = json['sea_level'] ?? 0.0, // Provide a default value if sea_level is missing
        grndLevel = json['grnd_level'] ?? 0.0; // Provide a default value if grnd_level is missing

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}
