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
                height: 300.0, // Altura fija de la imagen
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

              // Dropdown
              Text(
                'Elige una Sucursal',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0), // Espacio entre el texto y el dropdown
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  // Cambiado a String?
                  setState(() {
                    if (newValue != null) {
                      // Verificar si newValue no es null
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
            ],
          ),
        ),
      ),
    );
  }
}
