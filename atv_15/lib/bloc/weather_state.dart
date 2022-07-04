import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

import '../model/weather.dart';

import 'weather_bloc.dart';

// part 'weather_bloc.dart'; //!

abstract class WeatherState extends Equatable {
    const WeatherState([List props = const <dynamic>[]])
      : super();//!

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {

  final Weather weather;
  WeatherLoaded(this.weather) : super([weather]);
}
