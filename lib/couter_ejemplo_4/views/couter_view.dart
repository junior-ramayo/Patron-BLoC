import 'package:flutter/material.dart';
import 'package:flutter_bloc_ejemplos/couter_ejemplo_4/bloc/counter_bloc.dart';

 class CounterView extends StatefulWidget {

  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  
  final counterBloc = CounterBloc();

  @override
  void dispose() {
   super.dispose();
   counterBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: StreamBuilder(
     stream: counterBloc.counterStream,
     builder: (BuildContext context, AsyncSnapshot<int> snapshot){
      final numero = snapshot.data ?? 0;
      return Center(child: Text(numero.toString()));
     }
    ),
    floatingActionButton: _floatingActionsButtons()
   );
  }

  Widget _floatingActionsButtons(){
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       FloatingActionButton(
        heroTag: 'btn1',
        child: const Icon(Icons.add),
        onPressed: (){
         counterBloc.sendEvents.add(IncrementCounter());
        }
       ),
       FloatingActionButton(
        heroTag: 'btn2',
        child: const Icon(Icons.exposure_zero),
        onPressed: (){
         counterBloc.sendEvents.add(ClearCounter());
        }
       ),
     ],
    );
  }



}