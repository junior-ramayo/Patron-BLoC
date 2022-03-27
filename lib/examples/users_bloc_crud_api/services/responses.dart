import 'dart:convert';

import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/models/userscrud.dart';

class Responses {
    Responses({
     required this.status,
     required this.message,
        this.user,
    });

    String status;
    String message;
    Usercrud? user;

    factory Responses.fromJson(String str) => Responses.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Responses.fromMap(Map<String, dynamic> json) => Responses(
        status: json["status"],
        message: json["message"],
        user: json["user"] != null ? Usercrud.fromMap(json["user"]) : null,
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "user": user?.toMap(),
    };
}