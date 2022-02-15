import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/bloc/weather_bloc.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/models/weather.dart';

class WeatherView extends StatefulWidget {
  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {

  final TextEditingController _inputCity = TextEditingController();
  final String imgUrl = "https://cdn-icons-png.flaticon.com/512/3845/3845731.png";

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadInprogress) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Loading")));
          }
        },
        builder: (context, state) {
          if (state is WeatherLoadInprogress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadFailure) {
            return const Center(child: Text("Something went wrong"));
          } else if (state is WeatherLoadSuccess) {
            return _buildBody(context, state.weather, _weatherBloc);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, Weather weather, WeatherBloc _weatherBloc){
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: _inputCity,
                    decoration: const InputDecoration(
                      hintText: "Enter city name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      Image.network(
                        imgUrl,
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        weather.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weather.main["temp"].toString(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_inputCity.text.isNotEmpty) {
                      
                        _weatherBloc.add(GetWeatherCity(city: _inputCity.text));
                      }
                    },
                    child: const Text("Get Weather"),
                  )
                ],
              ),
            );
  }

 
}
