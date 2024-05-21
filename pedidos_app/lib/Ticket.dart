import 'package:flutter/material.dart';
import 'package:pedidos_app/menu.dart';

class TicketFinal extends StatefulWidget {
  @override
  _TicketFinalState createState() => _TicketFinalState();
}

class _TicketFinalState extends State<TicketFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Fondo gris para resaltar el ticket
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: CustomPaint(
                painter: TicketPainter(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Tu Orden:',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Alineación vertical: centro
                        children: [
                          Text(
                            'Gracias por Comprar con  Nosotros',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign
                                .center, // Alineación horizontal: centro
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No. Orden: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Items: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fecha: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hora de Tolerancia: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sucursal: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Text(
                          'Toma Captura de Pantalla de este Ticket',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0), // Espacio entre el ticket y el botón
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Menu_Obelie(initialEleccionPastel: 0)),
                );
              },
              child: const Text(
                'Terminar Compra',
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
          ],
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Path path = Path();

    double cornerRadius = 20.0;
    double notchSize = 10.0;

    // Start from top left
    path.moveTo(0, cornerRadius);

    // Top left corner
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Top line
    path.lineTo(size.width - cornerRadius, 0);

    // Top right corner
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right line with notch
    path.lineTo(size.width, size.height / 2 - notchSize);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + notchSize),
      radius: Radius.circular(notchSize),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom right corner
    path.quadraticBezierTo(
        size.width, size.height, size.width - cornerRadius, size.height);

    // Bottom line
    path.lineTo(cornerRadius, size.height);

    // Bottom left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left line with notch
    path.lineTo(0, size.height / 2 + notchSize);
    path.arcToPoint(
      Offset(0, size.height / 2 - notchSize),
      radius: Radius.circular(notchSize),
      clockwise: false,
    );
    path.lineTo(0, cornerRadius);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
