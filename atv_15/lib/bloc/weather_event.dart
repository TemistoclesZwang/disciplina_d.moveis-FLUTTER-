import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const <dynamic>[]])
      : super();//!

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  final String cityName;
  GetWeather({required this.cityName}) : super([cityName]);
  

  // Equatable allows for a simple value equality in Dart.
  // All you need to do is to pass the class fields to the super constructor.
  // GetWeather(this.cityName) : super([cityName]);
}