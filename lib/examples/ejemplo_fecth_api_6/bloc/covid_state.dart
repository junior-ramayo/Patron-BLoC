part of 'covid_bloc.dart';

@immutable
abstract class CovidState extends Equatable {

  const CovidState();

  @override
  List<Object?> get props => [];
}

class CovidInitial extends CovidState {}

class CovidLoading extends CovidState {}

class CovidLoaded extends CovidState {

  final CovidModel covidModel;
  final String? pruebaState;
  const CovidLoaded(this.covidModel, this.pruebaState);
}

class CovidError extends CovidState {
  final String? message;
  const CovidError(this.message);
}
