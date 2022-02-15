import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/models/weather.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/services/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
   
  final _weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherInitial()) {
  
    on<GetWeatherCity>((event, emit) async {

      emit(WeatherLoadInprogress());

      try {
       final weatherResponse = await _weatherRepository.getWeather(event.city);
       emit(WeatherLoadSuccess(weather: weatherResponse));
      } catch (e) {
       emit(WeatherLoadFailure(error: e.toString()));
      }
     
    });
  }
}
