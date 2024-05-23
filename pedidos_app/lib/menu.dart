import 'package:flutter/material.dart';
import 'package:pedidos_app/Pasteles.dart';
import 'package:pedidos_app/custom_app_basr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Menu_Obelie extends StatelessWidget {
  int _eleccionPastel = 0;
  final supabase = Supabase.instance.client.from('categorias').select();

  Menu_Obelie({required int initialEleccionPastel})
      : _eleccionPastel = initialEleccionPastel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Container(
        color: Color.fromARGB(
            255, 255, 255, 255), // Set the background color of the page
        child: ListView(
          children: [
            const SizedBox(height: 30), //espaci entre elementos

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
              imageAssetPath: 'Assets/Images/Crear.jpeg',
              text: 'Crea tu Pastel',
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
                _eleccionPastel = 4;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Pasteles(eleccionPastel: _eleccionPastel)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//esto si es el widget de generarnboton //hola
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

//Cosas de Supabase
//import 'package:supabase_flutter/supabase_flutter.dart';
//
//  await Supabase.initialize(
//       url: 'https://aqsixijowkhelwqmowuv.supabase.co',
//       anonKey:
//           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxc2l4aWpvd2toZWx3cW1vd3V2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0Nzk1NDIsImV4cCI6MjAyOTA1NTU0Mn0.bj3YMVCs6_5kN8RtQA1yWA-cZNLwHPvDJQGiyX4k2Oo');
//final supabase = Supabase.instance.client;
