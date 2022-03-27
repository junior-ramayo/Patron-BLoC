import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/models/userscrud.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/services/usercrud_services.dart';
import 'package:meta/meta.dart';
part 'userscrud_event.dart';
part 'userscrud_state.dart';

class UserscrudBloc extends Bloc<UserscrudEvent, UserscrudState> {

  UserscrudBloc() : super(UserscrudInitial()) {

    final UsersCrudService userService = UsersCrudService();

    // Get Users
    on<GetUsers>((event, emit) async {
      
      try {

        emit(UserscrudInitial());
        List<Usercrud> resp = await userService.getUsersDio();
        emit(UserLoaded(usuarios: resp));
        
      } catch (err) {
        emit(UsersError(error: 'Hubo un problema al traer los users'));
      }
    });
  
    // Post User
    on<CreateUser>((event, emit) async {
    
      try {

        Usercrud newUser = await userService.postUsersDio(event.user);
        final resp = [...state.users!, newUser];
        emit(UserLoaded(usuarios: resp));

      } catch (err) {
        // print(err);
      }
    });

    // Put User
    on<UpdateUser>((event, emit) async {
     
     try {

      await userService.putUsersDio(event.user);
      List<Usercrud> lista = state.users!;
      final index = lista.indexWhere((i) => i.id == event.user.id);
      lista[index] = event.user;
      emit(UserLoaded(usuarios: lista));

       
     } catch (err) {
      //  print(err);
     }
    });

    // Delete user
    on<DeleteUser>((event, emit) async {
     
      try {

        await userService.deleteUsersDio(event.user);
        List<Usercrud> lista = state.users!;
        final index = lista.indexWhere((i) => i.id == event.user.id);
        lista.removeAt(index);

        emit(UserLoaded(usuarios: lista));
        
      } catch (err) {
        // print(err);
      }
    });

  }
}
