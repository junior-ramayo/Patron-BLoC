part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {

  

  const MoviesState();
  
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final List<Movie> resp;

  const MoviesLoadedState(this.resp);
}

class MoviesErrorState extends MoviesState {
  final String text;

  const MoviesErrorState(this.text);
}
