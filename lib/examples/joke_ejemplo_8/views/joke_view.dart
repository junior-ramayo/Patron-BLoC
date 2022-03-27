import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/bloc/joke_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/models/joke.dart';
import 'package:flutter_bloc_ejemplos/examples/joke_ejemplo_8/services/joke_repository.dart';

class JokeView extends StatelessWidget {
  
  const JokeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
    create: (context) => JokeBloc(RepositoryProvider.of<JokeRepository>(context))..add(GetJokeEvent()),
    child: Scaffold(
     appBar: AppBar(
      title: const Text('The Joke App'),
     ),
     body: BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
       if (state is JokeLoadingState) {
        return const Center(child: CircularProgressIndicator());
       } else if (state is JokeFailedState) {
        return const Center(child: Text('Algo Salio mal'));
       } else if (state is JokeLoadedState) {
        return _buildBody(context, state.joke);
       } else {
        return Container();
       }
      },
     )
    ),
   );
  }

  Widget _buildBody(BuildContext context, JokeModel joke) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ExpansionTile(
            title: Text(
              joke.setup,
              textAlign: TextAlign.center,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  joke.delivery,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<JokeBloc>(context).add(GetJokeEvent());
            },
            child: const Text('Load New Joke'),
          ),
        ],
      ),
    );
  }
}
