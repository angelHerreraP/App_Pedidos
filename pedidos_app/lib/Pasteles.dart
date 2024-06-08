// main.dart
import 'package:flutter/material.dart';
import 'package:pedidos_app/custom_app_basr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pastel.dart'; // Import your pastel.dart file

// Código que inicia Supabase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://aqsixijowkhelwqmowuv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxc2l4aWpvd2toZWx3cW1vd3V2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0Nzk1NDIsImV4cCI6MjAyOTA1NTU0Mn0.bj3YMVCs6_5kN8RtQA1yWA-cZNLwHPvDJQGiyX4k2Oo',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pasteles(eleccionPastel: 1), // Cambia este valor según tu necesidad
    );
  }
}

class Pasteles extends StatefulWidget {
  final int eleccionPastel;

  Pasteles({required this.eleccionPastel});

  @override
  _PastelesState createState() => _PastelesState();
}

class _PastelesState extends State<Pasteles> {
  List<dynamic> pasteles = [];
  final String defaultImage = 'Assets/Images/Betun.jpeg';

  @override
  void initState() {
    super.initState();
    fetchPasteles();
  }

  Future<void> fetchPasteles() async {
    final supabase = Supabase.instance.client;
    final response = await supabase
        .from('productos')
        .select()
        .eq('id_categoria', widget.eleccionPastel) as List<dynamic>;

    // Filtrar los productos que no contengan 'Pay' o 'Carlotas y Reinas'
    final filteredResponse = response.where((item) {
      String nombre = item['nombre'].toString().toLowerCase();
      return !nombre.contains('pay') && !nombre.contains('carlotas y reinas');
    }).toList();

    setState(() {
      pasteles = filteredResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        leading: BackButton(),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: _buildRows(),
        ),
      ),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> rows = [];
    for (int i = 0; i < pasteles.length; i += 2) {
      List<_ButtonPastel> rowItems = [];
      for (int j = i; j < i + 2 && j < pasteles.length; j++) {
        rowItems.add(
          _ButtonPastel(
            imageAssetPath: defaultImage,
            text: pasteles[j]['nombre']
                .replaceAll('Pastel de ', '')
                .trim(), // Eliminar la palabra "Pastel"
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeleccionPastel(
                    nombrePastel: pasteles[j]['nombre'],
                    idCategoria: widget.eleccionPastel,
                  ),
                ),
              );
            },
          ),
        );
      }
      rows.add(_ButtonRow(buttons: rowItems));
    }
    return rows;
  }
}

class _ButtonRow extends StatelessWidget {
  final List<_ButtonPastel> buttons;

  _ButtonRow({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons.map((button) => Expanded(child: button)).toList(),
    );
  }
}

class _ButtonPastel extends StatelessWidget {
  final String imageAssetPath;
  final String text;
  final VoidCallback onPressed;

  _ButtonPastel({
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
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imageAssetPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      textAlign: TextAlign
                          .center, // Asegurar que el texto esté centrado
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
