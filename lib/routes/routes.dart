import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/couter_ejemplo_4/views/couter_view.dart';
import 'package:flutter_bloc_ejemplos/ejemplo_fecth_api_6/views/covid_view.dart';
import 'package:flutter_bloc_ejemplos/empleados_ejemplo_3/views/empleados_view.dart';
import 'package:flutter_bloc_ejemplos/joke_ejemplo_8/services/joke_repository.dart';
import 'package:flutter_bloc_ejemplos/joke_ejemplo_8/views/joke_view.dart';
import 'package:flutter_bloc_ejemplos/productos_ejemplo_2/views/productos_view.dart';
import 'package:flutter_bloc_ejemplos/user_home/user_view.dart';
import 'package:flutter_bloc_ejemplos/user_home/user_view2.dart';
import 'package:flutter_bloc_ejemplos/weather_app_7/views/weather_view.dart';


 class RoutesApp {
  getRoutes(){
   return {
    'user_home': (BuildContext context) => const UserView(),
    'pagina2': (BuildContext context) => const UserView2(),
    'productos_view': (BuildContext context) => ProductosView(),
    'empleados_view': (BuildContext context) => const EmpleadosView(),
    'counter_view': (BuildContext context) => const CounterView(),
    'covid_view': (BuildContext context) => const CovidView(),
    'weather_view': (BuildContext context) => WeatherView(),
    'joke_view': (BuildContext context) => RepositoryProvider(
                                            create: (context) => JokeRepository(),
                                            child: JokeView(),
                                           ),
   };
  }
 }