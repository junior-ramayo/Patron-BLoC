import 'package:flutter_bloc_ejemplos/ejemplo_fecth_api_6/models/covid_model.dart';
import 'package:flutter_bloc_ejemplos/ejemplo_fecth_api_6/services/api_provider.dart';

class ApiRepository {

  final _provider = ApiProvider();

  Future<CovidModel> getCovidList(){
    return _provider.fetchCovidList();
  }

}

class NetworkError extends Error {}