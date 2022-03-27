import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/user_home/bloc/user_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/user_home/models/user.dart';


class UserView2 extends StatelessWidget {
  
  const UserView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {

                final newUser = User(
                 name: 'Junior',
                 edad: '25',
                 profesiones: ['Flutter developer']
                );

                userBloc.add(ActivateUser(newUser));

              }
            ),

            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
               userBloc.add(ChangeUserAge('116'));
              }
            ),

            MaterialButton(
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
               userBloc.add(AddUserProfesion('Back-End Developer'));
              }
            ),

          ],
        )
     ),
   );
  }
}