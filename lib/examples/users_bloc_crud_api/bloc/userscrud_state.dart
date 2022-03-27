part of 'userscrud_bloc.dart';

 @immutable
 class UserscrudState{

  List<Usercrud>? users;
  Usercrud? usuario;

  UserscrudState({
    this.users = const [],
   this.usuario,
  });

  // @override
  // List<Object> get props => [];
}

class UserscrudInitial extends UserscrudState {}

class UserLoaded extends UserscrudState {
  List<Usercrud> usuarios;
  UserLoaded({required this.usuarios}) : super(users: usuarios, usuario: null);
}

class UserSetState extends UserscrudState {
  Usercrud user;
  UserSetState({required this.user}) : super(usuario: user);
}

class UsersError extends UserscrudState {
  final String error;
  UsersError({required this.error});
}




/*
List<Usercrud>? users;

  UserscrudState({
    this.users = const []
  });

  UserscrudState copyWith({
    List<Usercrud>? users,
  }){
    return UserscrudState(
      users: users ?? this.users
    );
  }

  @override
  List<Object> get props => [users!];

 */