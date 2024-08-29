class OpenWeatherMap {
  final Main main;
  final List<Weather> weather;

  OpenWeatherMap({required this.main, required this.weather});

  factory OpenWeatherMap.fromJson(Map<String, dynamic> json) {
    return OpenWeatherMap(
      main: Main.fromJson(json['main']),
      weather: List<Weather>.from(json['weather'].map((data) => Weather.fromJson(data))),
    );
  }
}

class Main {
  final double temp;
  final double tempMin;
  final double tempMax;
  final int humidity;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      humidity: json['humidity'],
    );
  }
}

class Weather {
  final String description;
  final String icon;

  Weather({required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'],
      icon: json['icon'],
    );
  }
}
