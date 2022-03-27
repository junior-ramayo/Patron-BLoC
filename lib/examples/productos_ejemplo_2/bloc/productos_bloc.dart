import 'dart:async';

 const PRODUCTOS = ['Microfono', 'Camara', 'Radio', 'Teclado'];

 class ProductosBloc {

  final StreamController<int> _productosContador = StreamController<int>();

  ProductosBloc(){
   getProducts.listen((productosList) {
    return _productosContador.add(productosList.length);
   });
  }

  //el async* me regresa un stream, y el async sin el asterisco me regresa un Future.
  Stream<List<String>> get getProducts async* {
   List<String> productos = [];
   for (var i in PRODUCTOS) { //Este es un For in.
    await Future.delayed(const Duration(seconds: 2));
    productos.add(i);
    //En lugar de usar return para regresar la lista usamos yield, esto por que estamos usando el async*
    yield productos;
   }
  }

  Stream<int> get getProductosContador{
    return _productosContador.stream;
  }

  //Cerramos el Stream
  dispose(){
    _productosContador.close();
  }


  }