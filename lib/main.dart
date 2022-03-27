import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/bloc/movies_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/user_home/bloc/user_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/bloc/userscrud_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/weather_app_7/bloc/weather_bloc.dart';
import 'package:flutter_bloc_ejemplos/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
 @override
 Widget build(BuildContext context) {
  return MultiBlocProvider(
   providers: [
    BlocProvider(create: (_) => UserBloc()), //<--- Aqui colocamos la instancia de manera global para que el estado este en todas las pantallas.
    BlocProvider(lazy: false, create: (_) => WeatherBloc()..add(const GetWeatherCity(city: 'merida'))),
    BlocProvider(create: (_) => MoviesBloc()..add(GetMovies())),
    BlocProvider(create: (_) => UserscrudBloc()..add(GetUsers()))
   ],
   child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material App',
    initialRoute: 'home_main',
    routes: RoutesApp().getRoutes()
   ),
  );
 }
}
