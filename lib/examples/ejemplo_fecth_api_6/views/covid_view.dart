import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/ejemplo_fecth_api_6/bloc/covid_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/ejemplo_fecth_api_6/models/covid_model.dart';

 class CovidView extends StatefulWidget {
  
  const CovidView({Key? key}) : super(key: key);

  @override
  State<CovidView> createState() => _CovidViewState();
}

class _CovidViewState extends State<CovidView> {

  final CovidBloc _covidBloc = CovidBloc();

  @override
  void initState() {
   super.initState();
   _covidBloc.add(GetCovidList());
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: _buildListCovid()
   );
  }

  Widget _buildListCovid() {
   return Container(
    margin: const EdgeInsets.all(8.0),
    child: BlocProvider(
     create: (_) => _covidBloc,
     child: BlocListener<CovidBloc, CovidState>(
      listener: (context, state) {
       if (state is CovidError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!)));
       }
      },
      child: BlocBuilder<CovidBloc, CovidState>(
       builder: (context, state) {
        if (state is CovidInitial) {
         return _buildLoading();
        } else if (state is CovidLoading) {
         return _buildLoading();
        } else if (state is CovidLoaded) {
         return _buildCard(context, state.covidModel);
        } else if (state is CovidError) {
          return Container();
        } else {
         return Container();
        }
       },
      ),
     ),
    ),
   );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
   return ListView.builder(
    itemCount: model.countries!.length,
    itemBuilder: (context, index) {
     return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
       child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
         children: <Widget>[
          Text("Country: ${model.countries![index].country}"),
          Text("Total Confirmed: ${model.countries![index].totalConfirmed}"),
          Text("Total Deaths: ${model.countries![index].totalDeaths}"),
          Text("Total Recovered: ${model.countries![index].totalRecovered}"),
         ],
        ),
       ),
      ),
     );
    },
   );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());


}