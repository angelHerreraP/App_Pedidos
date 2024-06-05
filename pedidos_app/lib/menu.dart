import 'package:flutter/material.dart';
import 'package:pedidos_app/Pasteles.dart';
import 'package:pedidos_app/custom_app_basr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Menu_Obelie extends StatelessWidget {
  int _eleccionPastel = 0;

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Container(
        color: Color.fromARGB(
            255, 255, 255, 255), // Set the background color of the page
        child: FutureBuilder<void>(
          future: _initializeSupabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return StreamBuilder<dynamic>(
                stream: supabase.from('categorias').stream(primaryKey: ['id']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                    return Center(child: Text('No hay categorías disponibles'));
                  }

                  final categorias = snapshot.data as List<dynamic>;
                  final filteredCategorias = categorias
                      .where((categoria) =>
                          categoria['nombre'] != 'Chamucos' &&
                          categoria['nombre'] != 'Pasteles' &&
                          categoria['nombre'] != 'Pan Casero' &&
                          categoria['nombre'] != 'Gelatina' &&
                          categoria['nombre'] != 'Velas')
                      .toList();

                  return ListView(
                    children: [
                      const SizedBox(height: 30), // Espacio entre elementos

                      // Botones manuales con nombres unificados
                      _Button(
                        imageAssetPath: 'Assets/Images/Betun.jpeg',
                        text: 'Pasteles con Betun',
                        onPressed: () {
                          _eleccionPastel = 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel)),
                          );
                        },
                      ),
                      _Button(
                        imageAssetPath: 'Assets/Images/Caseros.webp',
                        text: 'Pasteles Caseros',
                        onPressed: () {
                          _eleccionPastel = 5;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel)),
                          );
                        },
                      ),
                      _Button(
                        imageAssetPath: 'Assets/Images/Gelatina.jpeg',
                        text: 'Otros',
                        onPressed: () {
                          _eleccionPastel = 4;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel)),
                          );
                        },
                      ),
                      _Button(
                        imageAssetPath: 'Assets/Images/Extras.jpeg',
                        text: 'Todo Para tu Pastel',
                        onPressed: () {
                          _eleccionPastel = 2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel)),
                          );
                        },
                      ),
                      _Button(
                        imageAssetPath: 'Assets/Images/Crear.jpeg',
                        text: 'Crea tu Pastel',
                        onPressed: () {
                          _eleccionPastel = 0; // Dejar libre por ahora
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel)),
                          );
                        },
                      ),

                      // Botones dinámicos desde Supabase, excluyendo las categorías duplicadas
                      ...filteredCategorias.map((categoria) {
                        return _Button(
                          imageAssetPath:
                              'Assets/Images/${categoria['nombre']}.jpeg',
                          text: categoria['nombre'],
                          onPressed: () async {
                            _eleccionPastel = categoria['id'];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pasteles(eleccionPastel: _eleccionPastel),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _initializeSupabase() async {
    // Inicialización de Supabase (dejar vacío si ya está inicializado)
  }
}

class _Button extends StatelessWidget {
  final String imageAssetPath;
  final String text;
  final VoidCallback onPressed;

  _Button({
    required this.imageAssetPath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imageAssetPath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!, // Adjust shadow color as needed
                offset: Offset(0, 5), // Offset to create a bottom shadow
                blurRadius: 10.0, // Spread of the shadow
                spreadRadius: 2.0, // Size of the shadow relative to button
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.10),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align text to end
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Spacer(), // Pushes text to the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
