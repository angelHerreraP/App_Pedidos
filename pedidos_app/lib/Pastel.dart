import 'package:flutter/material.dart';
import 'package:pedidos_app/custom_app_basr.dart';

class SeleccionPastel extends StatefulWidget {
  @override
  _SeleccionPastelState createState() => _SeleccionPastelState();
}

class _SeleccionPastelState extends State<SeleccionPastel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(
        leading: BackButton(),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
      ),
    );
  }
}
