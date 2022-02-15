import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/models/user.dart';
import 'package:flutter_bloc_ejemplos/user_home/bloc/user_bloc.dart';

 class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

 
  @override
  State<UserView> createState() => _UserViewState();
 }
 
 class _UserViewState extends State<UserView> {
   
  @override
  Widget build(BuildContext context) {
   final userBloc = BlocProvider.of<UserBloc>(context);
   return Scaffold(
    appBar: AppBar(
     title: const Text('Flutter BLoc'),
     actions: [
       IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          userBloc.add(DeleteUser());
        }
       ),
     ],
    ),
    body: BlocBuilder<UserBloc, UserState>(
     builder: (context, state) {
      return state.existeUser
       ? InformacionUsuario(user: state.user!)
       : const Center(child:Text('No hay usuario'));
     },
    ),
    floatingActionButton: FloatingActionButton(
     child: const Icon( Icons.accessibility_new ),
     onPressed: () => Navigator.pushNamed(context, 'pagina2')
    ),
   );
  }
 }

 class InformacionUsuario extends StatelessWidget {

  final User user;
  
  const InformacionUsuario({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
    width: double.infinity,
    height: double.infinity,
    padding: const EdgeInsets.all(20.0),
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [

      const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
      const Divider(),

      ListTile( title: Text('Nombre: ${user.name}')),
      ListTile( title: Text('Edad: ${user.edad}')),

      const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
      const Divider(),

      ...user.profesiones.map((i) => ListTile(title: Text(i))).toList()


     ],
    ),
   );
  }

}


