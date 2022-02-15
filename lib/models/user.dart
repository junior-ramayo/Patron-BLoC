
 class User {

   String name;
   String edad;
   List<String> profesiones;

   User({
    required this.name,
    required this.edad,
    required this.profesiones,
   });

   /*
    
    * La logica del copyWith es si le pasan el nombre se lo asignan
      y si no se lo pasan le asignas el anterior o el que ya estaba this.name

    * El tipo de dato de retorno por defecto del copyWith es dynamic, 
      pero en este caso se lo asignamos como User.

    */

   User copyWith({
     String? nombre,
     String? edad,
     List<String>? profesiones,
   }) => User(
     name: nombre ?? name, 
     edad: edad ?? this.edad,
     profesiones: profesiones ?? this.profesiones
   );

 }