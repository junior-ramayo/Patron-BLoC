import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ejemplos/examples/ejemplo_fecth_api_6/models/covid_model.dart';
import 'package:flutter_bloc_ejemplos/examples/ejemplo_fecth_api_6/services/api_repository.dart';
import 'package:meta/meta.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    
   final ApiRepository _apiRepository = ApiRepository();

   on<GetCovidList>((event, emit) async {
    try {

      emit(CovidLoading());
      final mList = await _apiRepository.getCovidList();
      emit(CovidLoaded(mList, null));
      if(mList.error != null){
       emit(CovidError(mList.error));
      }

    } on NetworkError {
     emit(const CovidError("Failed to fetch data. is your device online?"));
    }
   });
  
  
  }
}
