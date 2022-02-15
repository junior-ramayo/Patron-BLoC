import 'package:flutter_bloc_ejemplos/joke_ejemplo_8/models/joke.dart';
import 'package:http/http.dart' as http;


class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jokeModelFromJson(response.body);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}