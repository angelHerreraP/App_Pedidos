import 'package:flutter/material.dart';
import 'package:pedidos_app/Datos.dart';
import 'package:pedidos_app/Pastel.dart';
import 'package:pedidos_app/custom_app_basr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Codigo que inicia SupaBase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://aqsixijowkhelwqmowuv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxc2l4aWpvd2toZWx3cW1vd3V2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM0Nzk1NDIsImV4cCI6MjAyOTA1NTU0Mn0.bj3YMVCs6_5kN8RtQA1yWA-cZNLwHPvDJQGiyX4k2Oo',
  );
}

// Aqi manda a llam
class Pasteles extends StatefulWidget {
  final int eleccionPastel;

  Pasteles({required this.eleccionPastel});

  @override
  _PastelesState createState() => _PastelesState();
}

//Aqui inicia mi app
class _PastelesState extends State<Pasteles> {
  List<dynamic> pasteles = [];

  @override
  void initState() {
    super.initState();
    fetchPasteles();
  }

  Future<void> fetchPasteles() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('productos').select('*');
    setState(() {
      //pasteles = response.data;
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
          children: [
            _ButtonRow(
              buttons: [
                _ButtonPastel(
                  imageAssetPath: 'Assets/Images/Betun.jpeg',
                  text: 'Pastel de Guayaba',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeleccionPastel()),
                    );
                  },
                ),
                _ButtonPastel(
                  imageAssetPath: 'Assets/Images/Betun.jpeg',
                  text: 'Pastel de Baileys',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DatosUsuario()),
                    );
                  },
                ),
              ],
            ),
          ],
        ), // Set background color to white
      ),
    );
  }
}

//codigo _ButtonRow
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

//Formato boton
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
                //esto se encarga de dar sombra a la de cada boton
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!, // Adjust shadow color as needed
                    offset: Offset(0, 5), // Offset to create a bottom shadow
                    blurRadius: 10.0, // Spread of the shadow
                    spreadRadius: 2.0, // Size of the shadow relative to button
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
