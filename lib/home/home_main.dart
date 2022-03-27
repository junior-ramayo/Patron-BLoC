import 'package:flutter/material.dart';

 class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: ListView(
     padding: const EdgeInsets.symmetric(horizontal: 30),
     children: [

      _card('productos_view', 'Productos', context),
      _card('userscrud_view', 'CRUD Api BLoC', context),
      _card('empleados_view', 'Empleados', context),
      _card('user_home', 'Users', context),
      _card('counter_view', 'Counter', context),
      _card('covid_view', 'Covid', context),
      _card('weather_view', 'Weather', context),
      _card('joke_view', 'Joker', context),
      _card('movie_view', 'Movies', context),
            
     ],
    ),
   );
  }

  Widget _card(String route, String title, context){
   return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, route);
    },
    child: Container(
     padding: const EdgeInsets.symmetric(vertical: 25),
     margin: const EdgeInsets.symmetric(vertical: 15),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
       gradient: const LinearGradient(
	      colors: [Colors.red, Colors.blue],
	      begin: FractionalOffset.centerLeft,
	      end: FractionalOffset.centerRight,
	     ),
     ), 
     child: Center(
       child: Text(
         title,
         style: const TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
           letterSpacing: 1.0,
           fontSize: 17
         ),
       ),
     )
    ),
   );
  }

 }