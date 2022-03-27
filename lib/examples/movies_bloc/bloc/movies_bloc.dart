import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/models/resp.dart';
import 'package:flutter_bloc_ejemplos/examples/movies_bloc/services/movies_service.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
   
   final MoviesService moviesService = MoviesService();
   
    on<GetMovies>((event, emit) async{
      try {

        emit(MoviesLoading());
        final resp = await moviesService.getMovies();
        emit(MoviesLoadedState(resp));
        
      } on CustomError {
        emit(const MoviesErrorState('Algo Ha salido mal'));
      }
    });
 
 
  }

}
