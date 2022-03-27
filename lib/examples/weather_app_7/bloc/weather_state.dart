part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInprogress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  const WeatherLoadSuccess({required this.weather});
}

class WeatherLoadFailure extends WeatherState {
  final String error;
  const WeatherLoadFailure({required this.error});
}


