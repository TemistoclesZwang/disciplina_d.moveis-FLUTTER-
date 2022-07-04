import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/weather.dart';
import 'weather_state.dart'; //!
import 'weather_event.dart';
// part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()); //!

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      emit(WeatherLoading());
      try {
      final weather = await _fetchWeatherFromFakeApi(event.cityName);
        emit (WeatherLoaded(weather));
      } catch (_) {
        emit (WeatherInitial());
      }
    }
  }
  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
        );
      },
    );
  }

  void dispose() {}

  void dispatch(GetWeather getWeather) {}
}
