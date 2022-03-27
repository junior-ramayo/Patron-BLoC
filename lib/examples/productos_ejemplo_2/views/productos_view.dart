import 'package:flutter/material.dart';
import 'package:flutter_bloc_ejemplos/examples/productos_ejemplo_2/bloc/productos_bloc.dart';

 class ProductosView extends StatelessWidget {
  
  ProductosView({Key? key}) : super(key: key);
  final productosBloc = ProductosBloc();
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
     title: StreamBuilder(
      stream: productosBloc.getProductosContador,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
       return Text('Productos (${snapshot.data ?? 0})');
      },
     ),
    ),
    body: StreamBuilder(
     stream: productosBloc.getProducts,
     builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
      final productos = snapshot.data ?? []; //si el snapshot.data es null me regresas un array vacio.
      return ListView.builder(
       itemCount: productos.length,
       itemBuilder: (context, index){
        return ListTile(
         title: Text(productos[index]),
        );
       }
      );
     },
    ),
   );
  }
 }