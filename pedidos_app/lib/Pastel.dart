import 'package:flutter/material.dart';
import 'package:pedidos_app/custom_app_basr.dart';

class SeleccionPastel extends StatefulWidget {
  final String nombrePastel;
  final int idCategoria;

  SeleccionPastel({required this.nombrePastel, required this.idCategoria});

  @override
  _SeleccionPastelState createState() => _SeleccionPastelState();
}

class _SeleccionPastelState extends State<SeleccionPastel> {
  int _cantidad = 1; // Valor inicial de la cantidad

  void _incrementarCantidad() {
    setState(() {
      _cantidad++;
    });
  }

  void _decrementarCantidad() {
    setState(() {
      if (_cantidad > 1) {
        _cantidad--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen grande
              Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/Images/Betun.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: 20.0),
              // Descripción
              Text(
                'Pastel de Guayaba',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Este pastel es perfecto para cualquier ocasión. Está hecho con los ingredientes más frescos y tiene un sabor inigualable.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30.0),

              // Selector de cantidad
              Center(
                child: Column(
                  children: [
                    Text(
                      '¿Cuántos desea?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrementarCantidad,
                        ),
                        Text(
                          '$_cantidad',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _incrementarCantidad,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),

              // ElevatedButton
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acciones del botón
                  },
                  child: const Text(
                    'Agregar a Carrito',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    backgroundColor: Color.fromARGB(255, 60, 119, 63),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
