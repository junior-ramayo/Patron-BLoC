part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();
  
  @override
  List<Object> get props => [];
}

class JokeInitialState extends JokeState {}

class JokeLoadingState extends JokeState {}

class JokeLoadedState extends JokeState {
  final JokeModel joke;
  const JokeLoadedState({required this.joke});
}

class JokeFailedState extends JokeState {
  final String error;
  const JokeFailedState({required this.error});
}