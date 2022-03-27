import 'package:flutter_bloc_ejemplos/examples/movies_bloc/models/resp.dart';
import 'package:http/http.dart' as http;

 class MoviesService {

  final String _url = 'https://api.themoviedb.org/3/movie';
  final String apiKey = '510a78982406ca8038c1cd6e9584939c';

  getMovies() async {

   final url = Uri.parse('$_url/popular?api_key=$apiKey&language=es-ES&page=1');
   final resp = await http.get(url);
   final instancia = Resp.fromJson(resp.body);
   return instancia.results;

  }

 }

 class CustomError extends Error {
   
 }