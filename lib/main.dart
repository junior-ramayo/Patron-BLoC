import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/movies_bloc/bloc/movies_bloc.dart';
import 'package:flutter_bloc_ejemplos/routes/routes.dart';
import 'package:flutter_bloc_ejemplos/user_home/bloc/user_bloc.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/bloc/weather_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
 @override
 Widget build(BuildContext context) {
  return MultiBlocProvider(
   providers: [
    BlocProvider(create: (_) => UserBloc()), //<--- Aqui colocamos la instancia de manera global para que el estado este en todas las pantallas.
    BlocProvider(lazy: false, create: (_) => WeatherBloc()..add(const GetWeatherCity(city: 'merida'))),
    BlocProvider(create: (_) => MoviesBloc()..add(GetMovies()))
   ],
   child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material App',
    initialRoute: 'movie_view',
    routes: RoutesApp().getRoutes()
   ),
  );
 }
}
