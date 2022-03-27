import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/bloc/userscrud_bloc.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/models/userscrud.dart';


 class UsersCrudHome extends StatelessWidget {
  const UsersCrudHome({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   final userbloc = BlocProvider.of<UserscrudBloc>(context);
   return Scaffold(
    appBar: AppBar(),
    body: BlocBuilder<UserscrudBloc, UserscrudState>(
     builder: (context, state){
      if(state is UserscrudInitial){
       return const Center(child: CircularProgressIndicator());
      } else if(state is UserLoaded){
       return listview(state.usuarios, context, userbloc);
      } else if(state is UsersError){
       return Center(child: Text(state.error));
      } else {
       return Container();
      }
     },
    ),
    floatingActionButton: _botones(userbloc)
   );
  }

  
  Widget listview(List<Usercrud> users, context, UserscrudBloc userService){
   return ListView.builder(
    padding: const EdgeInsets.only(bottom: 90),
    itemCount: users.length,
    itemBuilder: (context, index){
     return GestureDetector(
       onTap: (){
        userService.state.usuario = users[index];
       },
       child: Container(
         margin: const EdgeInsets.all(7),
         width: double.infinity,
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
              Text(users[index].fname ?? ''),
              Text(users[index].lname ?? ''),
              Text(users[index].username ?? ''),
              // Text(users[index].avatar!),
           ],
         ),
       ),
     );
    }
   );
  }
   

  Widget _botones(UserscrudBloc userService){
   return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

     // Create user
     FloatingActionButton(
      heroTag: 'btn2',
      onPressed: () async {

       final user = Usercrud(
         fname: 'Nicole',
         lname: 'nacif',
         username: 'nicole.nacif@gmail.com',
         email: 'nicole.nacif@gmail.com',
         avatar: 'https://www.mecallapi.com/users/cat.png'
       );
           
       userService.add(CreateUser(user: user));
      },
      child: const Icon(Icons.add),
     ),

      //Update user
      FloatingActionButton(
       heroTag: 'btn1',
       onPressed: () async {
         final user = Usercrud(
           id: userService.state.usuario!.id,
           fname: 'michelle',
           lname: userService.state.usuario!.lname,
           username: userService.state.usuario!.username,
           avatar: userService.state.usuario!.avatar
         );

        userService.add(UpdateUser(user: user));
       },
       child: const Icon(Icons.update),
      ),

      //Delete user
      FloatingActionButton(
       heroTag: 'btn3',
       onPressed: () async {
         final user = Usercrud(
           id: 13
         );
        userService.add(DeleteUser(user: user));
       },
       child: const Icon(Icons.delete),
      )


    ],
   );
  }
 
 
 }