import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/models/joke.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/services/joke_repository.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeInitialState()) {
    
    on<GetJokeEvent>((event, emit) async {
     emit(JokeLoadingState());
     try {
      final joke = await _jokeRepository.getJoke();
      emit(JokeLoadedState(joke: joke));
     } catch (e) {
      emit(JokeFailedState(error: e.toString()));
     }
    });

  }
}
