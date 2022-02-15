import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_ejemplos/models/user.dart';
import 'package:meta/meta.dart'; //<---- esta es la importacion de @inmutable
part 'user_event.dart';
part 'user_state.dart';

 class UserBloc extends Bloc<UserEvent, UserState>{
  
  UserBloc() : super(const UserInitialState()){

   //este es un evento, Este evento sirve para establecer un usuario
   on<ActivateUser>((event, emit){
    emit(UserSetState(event.user));
   });

   //Evento para agregar una edad
   on<ChangeUserAge>((event, emit){
    if(!state.existeUser) return;
    emit(UserSetState(state.user!.copyWith(edad: event.age)));
   });

   //Evento agregar una profesion
   on<AddUserProfesion>((event, emit){
    if(!state.existeUser) return;
    final profesiones = [...state.user!.profesiones, event.profesion];
    emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
   });

   //Evento eliminar un usuario.
   on<DeleteUser>((event, emit) => emit(const UserInitialState()));

  }
 }