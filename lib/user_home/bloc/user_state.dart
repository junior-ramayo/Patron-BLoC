part of 'user_bloc.dart';

 @immutable
 abstract class UserState {
  
   final bool existeUser;
   final User? user;

   const UserState({
    this.existeUser = false,
    this.user
   });
 }

 class UserInitialState extends UserState {
   const UserInitialState() : super(existeUser: false, user: null);
 }

 class UserSetState extends UserState {
  final User newUser;
  const UserSetState(this.newUser) : super(existeUser: true, user: newUser);
 }

