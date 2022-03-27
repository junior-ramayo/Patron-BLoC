part of 'user_bloc.dart';

 @immutable
 abstract class UserEvent {}


 //este es mi primer evento.
 class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
 }

 class ChangeUserAge extends UserEvent {
  final String age;
  ChangeUserAge(this.age);
 }

 class AddUserProfesion extends UserEvent {
  final String profesion;
  AddUserProfesion(this.profesion);
 }

 class DeleteUser extends UserEvent {}


