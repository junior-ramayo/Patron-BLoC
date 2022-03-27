import 'dart:async';

/*
 Con el Stream escuchamos eventos.
 Con el Sink insertamos eventos.
 */

class CounterBloc {

  int _num = 0;

  final StreamController<CounterEvents> _input = StreamController();
  final StreamController<int> _output = StreamController<int>();

  CounterBloc(){
    _input.stream.listen(_onEvent);
  }

  //getters
  Stream<int> get counterStream => _output.stream; //Esto nos devuelve el nuevo valor de _num.
  StreamSink<CounterEvents> get sendEvents => _input.sink; //Aqui mandamos un nuevo evento.

  void _onEvent(CounterEvents event){
   if(event is IncrementCounter){
    _num++;
   } else {
    _num = 0;
   }
   
   _output.add(_num); //Aqui mandamos el nuevo valor de _num.
  }


  /*
   Los streamController tiene manejo de recursos,
   por lo que en algun momento tenemos que liberar esos recursos,
   y para eso esta el metodo dispose.
   */
  void dispose(){
    _input.close();
    _output.close();
  }


}

 //Eventos.
 class CounterEvents {}

 class IncrementCounter extends CounterEvents {}

 class ClearCounter extends CounterEvents {}