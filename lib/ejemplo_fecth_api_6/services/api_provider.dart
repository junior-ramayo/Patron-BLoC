import 'package:dio/dio.dart';
import 'package:flutter_bloc_ejemplos/ejemplo_fecth_api_6/models/covid_model.dart';

class ApiProvider {

  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidList() async{
    try {

      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
      
    } catch (err) {
      return CovidModel.withError("Data not found / Connection issue");
    }
  }



 }