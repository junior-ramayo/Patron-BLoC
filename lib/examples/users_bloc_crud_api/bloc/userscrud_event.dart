part of 'userscrud_bloc.dart';

abstract class UserscrudEvent extends Equatable {
  const UserscrudEvent();

  @override
  List<Object> get props => [];
}

 class GetUsers extends UserscrudEvent {}

 class CreateUser extends UserscrudEvent {
   Usercrud user;
   CreateUser({required this.user});
 }

 class UpdateUser extends UserscrudEvent {
   Usercrud user;
   UpdateUser({required this.user});
 }

 class DeleteUser extends UserscrudEvent {
   Usercrud user;
   DeleteUser({required this.user});
 }
