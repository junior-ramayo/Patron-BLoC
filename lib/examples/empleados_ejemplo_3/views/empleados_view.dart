import 'package:flutter/material.dart';
import 'package:flutter_bloc_ejemplos/examples/empleados_ejemplo_3/bloc/empleados_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/empleados_ejemplo_3/models/empleado.dart';


 class EmpleadosView extends StatefulWidget {
  const EmpleadosView({Key? key}) : super(key: key);

  @override
  State<EmpleadosView> createState() => _EmpleadosViewState();
}

class _EmpleadosViewState extends State<EmpleadosView> {

  final empleadoBloc = EmpleadosBloc();

  @override
  void dispose() {
    super.dispose();
    empleadoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: StreamBuilder(
     stream: empleadoBloc.getEmpleadoListStream,
     builder: (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot){ 
      final empleados = snapshot.data ?? [];
      return ListView.builder(
       itemCount: empleados.length,
       itemBuilder: (BuildContext context,index){
        return Container(
         margin: const EdgeInsets.all(15),
         width: double.infinity,
         child: Column(
          children: [
           Text('ID: ${empleados[index].getId}'),
           Text('Nombre: ${empleados[index].getNombre}'),
           Text('Salario: ${empleados[index].getSalario}'),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: (){
                empleadoBloc.empleadoSalarioIncrement.add(empleados[index]);
              }
             ),
             IconButton(
              icon: const Icon(Icons.thumb_down),
              onPressed: (){
                empleadoBloc.empleadoSalarioDecrement.add(empleados[index]);
              }
             ),
             ],
           ),
          ],
         ),
        );
       }
      );
     }, 
    ),
   );
  }
}