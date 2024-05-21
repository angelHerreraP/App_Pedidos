import 'package:flutter/material.dart';
import 'package:pedidos_app/custom_app_basr.dart';

class SeleccionPastel extends StatefulWidget {
  @override
  _SeleccionPastelState createState() => _SeleccionPastelState();
}

class _SeleccionPastelState extends State<SeleccionPastel> {
  String dropdownValue = 'Opciones'; // Valor inicial del dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        // Para permitir el scroll si el contenido es muy largo
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Padding alrededor del contenido
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen grande
              Container(
                width: double.infinity, // Ancho completo
                height: 250.0, // Altura fija de la imagen
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/pastel.jpg'), // Reemplaza con tu imagen
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(10.0), // Bordes redondeados
                ),
              ),
              SizedBox(
                  height: 20.0), // Espacio entre la imagen y la descripción

              // Descripción
              Text(
                'Pastel de Guayaba',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: 10.0), // Espacio entre el título y la descripción
              Text(
                'Este pastel es perfecto para cualquier ocasión. Está hecho con los ingredientes más frescos y tiene un sabor inigualable.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                  height: 30.0), // Espacio entre la descripción y el dropdown

              // Dropdown y su descripción
              Center(
                child: Column(
                  children: [
                    Text(
                      'Elige una Sucursal',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: 10.0), // Espacio entre el texto y el dropdown
                    Container(
                      width: 200.0, // Establece el ancho deseado
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue != null) {
                                dropdownValue = newValue;
                              }
                            });
                          },
                          items: <String>[
                            'Opciones',
                            'Ojocaliente',
                            'Agostadero',
                            'Jardines',
                            'Central de Autobuses',
                            'Colosio',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0), // Espacio entre el dropdown y el botón

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
