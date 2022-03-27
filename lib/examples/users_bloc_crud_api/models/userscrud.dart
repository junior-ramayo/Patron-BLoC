import 'dart:convert';

class Usercrud {
    Usercrud({
        this.id,
        this.fname,
        this.lname,
        this.username,
        this.email,
        this.avatar,
    });

    int? id;
    String? fname;
    String? lname;
    String? username;
    String? email;
    String? avatar;

    factory Usercrud.fromJson(String str) => Usercrud.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usercrud.fromMap(Map<String, dynamic> json) => Usercrud(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "username": username,
        "email": email,
        "avatar": avatar,
    };

    Usercrud copyWith({
     int? id,
     String? fname,
     String? lname,
     String? username,
     String? email,
     String? avatar,
    })=> Usercrud(
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar
    );

}