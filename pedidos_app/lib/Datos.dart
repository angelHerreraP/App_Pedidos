import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pedidos_app/custom_app_basr.dart'; // Asegúrate de que esta ruta y archivo son correctos

class DatosUsuario extends StatefulWidget {
  @override
  _DatosUsuarioState createState() => _DatosUsuarioState();
}

class _DatosUsuarioState extends State<DatosUsuario> {
  final _formKey = GlobalKey<FormState>();

  String _nombre = '';
  String _correo = '';
  String _telefono = '';
  String _ubicacion = 'Agostadero'; // Valor inicial de la lista
  DateTime _fecha = DateTime.now();
  TimeOfDay _hora = TimeOfDay.now();

  final List<String> _ubicaciones = ['Agostadero', 'Jardines', 'Arboledas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoAppBar(),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingrese su nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
                onSaved: (value) => _nombre = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Ingrese su correo electrónico',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(value)) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
                onSaved: (value) => _correo = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  hintText: 'Ingrese su número de teléfono',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de teléfono';
                  }
                  if (value.length != 10) {
                    return 'Por favor ingrese un número de teléfono válido';
                  }
                  return null;
                },
                onSaved: (value) => _telefono = value!,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Ubicación',
                  hintText: 'Seleccione una ubicación',
                ),
                value: _ubicacion,
                onChanged: (value) {
                  setState(() {
                    _ubicacion = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una ubicación';
                  }
                  return null;
                },
                items: _ubicaciones
                    .map((ubicacion) => DropdownMenuItem<String>(
                          value: ubicacion,
                          child: Text(ubicacion),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _fecha,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null && pickedDate != _fecha) {
                          setState(() {
                            _fecha = pickedDate;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Fecha',
                          hintText: 'Seleccione una fecha',
                        ),
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(_fecha),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: _hora,
                        );
                        if (pickedTime != null && pickedTime != _hora) {
                          setState(() {
                            _hora = pickedTime;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Hora',
                          hintText: 'Seleccione una hora',
                        ),
                        child: Text(
                          _hora.format(context),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Handle form submission
                  }
                },
                child: Text('Añadir a Carrito'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
