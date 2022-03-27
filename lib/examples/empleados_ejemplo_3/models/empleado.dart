

 class Empleado {

  int _id;
  String _nombre;
  double _salario;

  Empleado(
    this._id,
    this._nombre,
    this._salario
  );

  //setters
  set id(int id){
   _id = id;
  }

  set nombre(String nombre){
   _nombre = nombre;
  }

  set salario(double salario){
    _salario = salario;
  }

  //getters
  int get getId => _id;
  String get getNombre => _nombre;
  double get getSalario => _salario;

 }