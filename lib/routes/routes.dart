import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/couter_ejemplo_4/views/couter_view.dart';
import 'package:flutter_bloc_ejemplos/examples/ejemplo_fecth_api_6/views/covid_view.dart';
import 'package:flutter_bloc_ejemplos/examples/empleados_ejemplo_3/views/empleados_view.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/services/joke_repository.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/views/joke_view.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/views/home_movie.dart';
import 'package:flutter_bloc_ejemplos/examples/productos_ejemplo_2/views/productos_view.dart';
import 'package:flutter_bloc_ejemplos/examples/user_home/user_view.dart';
import 'package:flutter_bloc_ejemplos/examples/user_home/user_view2.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/views/userscrud_home.dart';
import 'package:flutter_bloc_ejemplos/examples/weather_app_7/views/weather_view.dart';
import 'package:flutter_bloc_ejemplos/home/home_main.dart';


 class RoutesApp {
  getRoutes(){
   return {
    'home_main': (BuildContext context) => const HomeMain(),
    'user_home': (BuildContext context) => const UserView(),
    'pagina2': (BuildContext context) => const UserView2(),
    'productos_view': (BuildContext context) => ProductosView(),
    'empleados_view': (BuildContext context) => const EmpleadosView(),
    'counter_view': (BuildContext context) => const CounterView(),
    'covid_view': (BuildContext context) => const CovidView(),
    'weather_view': (BuildContext context) => const WeatherView(),
    'joke_view': (BuildContext context) => RepositoryProvider(
                                            create: (context) => JokeRepository(),
                                            child: const JokeView(),
                                           ),
    'movie_view': (BuildContext context) => HomeMovies(),
    'userscrud_view': (BuildContext context) => const UsersCrudHome()
   };
  }
 }