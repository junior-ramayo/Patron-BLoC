import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/bloc/movies_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/models/resp.dart';



 class HomeMovies extends StatefulWidget {
   HomeMovies({Key? key}) : super(key: key);
 
   @override
   State<HomeMovies> createState() => _HomeMoviesState();
 }
 
 class _HomeMoviesState extends State<HomeMovies> {


   @override
   Widget build(BuildContext context) {
    return Scaffold(
     body: BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state){
        if(state is MoviesLoading){
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoviesLoadedState){
          return movies(state.resp);
        } else if(state is MoviesErrorState){
          return Text(state.text);
        } else {
          return const Text('404');
        }
      }
     )
    );
   }

   Widget movies(List<Movie> movies){
    return ListView.builder(
     itemCount: movies.length, 
     itemBuilder: (context, index){
       return Text(movies[index].title);
     }
    );
   }

 }