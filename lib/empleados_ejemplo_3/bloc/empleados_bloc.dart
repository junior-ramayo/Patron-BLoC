import 'dart:async';
import 'package:flutter_bloc_ejemplos/empleados_ejemplo_3/models/empleado.dart';


 class EmpleadosBloc {

  List<Empleado> empleados = [
   Empleado(1, 'Vannessa Monsreal', 25000),
   Empleado(2, 'Mariana Ochoa', 5000),
   Empleado(3, 'Barbara boyance', 20000),
   Empleado(4, 'Nicole Nacif', 10000),
   Empleado(5, 'Domenica Duch', 15000),
  ];
  
  final _empleadoListStreamController = StreamController<List<Empleado>>();
  final _empleadoIncrementSalarioStreamController = StreamController<Empleado>();
  final _empleadoDecrementSalarioStreamController = StreamController<Empleado>();

  EmpleadosBloc(){
   _empleadoListStreamController.add(empleados);
   _empleadoIncrementSalarioStreamController.stream.listen(_incrementSalario);
   _empleadoDecrementSalarioStreamController.stream.listen(_decrementSalario);
  }


  //getters y sinks
  Stream<List<Empleado>> get getEmpleadoListStream{
   return _empleadoListStreamController.stream;
  }
  StreamSink<List<Empleado>> get empleadoListSink{
    return _empleadoListStreamController.sink;
  }

  StreamSink<Empleado> get empleadoSalarioIncrement{
    return _empleadoIncrementSalarioStreamController.sink;
  }

  StreamSink<Empleado> get empleadoSalarioDecrement{
    return _empleadoDecrementSalarioStreamController.sink;
  }

  _incrementSalario(Empleado empleado){
   double salarioActual = empleado.getSalario;
   double salarioIncrement = salarioActual * 20/100;
   empleados[empleado.getId - 1].salario = salarioActual + salarioIncrement;
   empleadoListSink.add(empleados);
  }

  _decrementSalario(Empleado empleado){
   double salarioActual = empleado.getSalario;
   double salarioIncrement = salarioActual * 20/100; //aqui sacamos el 20% del salario actual y se lo aumentamos al salario actual.
   empleados[empleado.getId - 1].salario = salarioActual - salarioIncrement;
   empleadoListSink.add(empleados);
  }

  void dispose(){
   _empleadoListStreamController.close();
   _empleadoIncrementSalarioStreamController.close();
   _empleadoDecrementSalarioStreamController.close();
  }

 }