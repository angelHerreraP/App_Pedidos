import 'package:flutter/material.dart';

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
        child: Container(
          width: 300,
          height: 500,
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
                      'Ticket de Cine',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Película: Una Aventura Increíble',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fecha: 20 Mayo 2024',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hora: 19:30',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Asiento: F13',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      'Disfruta la Función',
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

    // Start from top left
    path.moveTo(0, cornerRadius);

    // Top left corner
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Top line
    path.lineTo(size.width - cornerRadius, 0);

    // Top right corner
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right line
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom right corner
    path.quadraticBezierTo(
        size.width, size.height, size.width - cornerRadius, size.height);

    // Bottom line
    path.lineTo(cornerRadius, size.height);

    // Bottom left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left line
    path.lineTo(0, cornerRadius);

    canvas.drawPath(path, paint);

    // Draw the perforated lines (dots)
    Paint dotPaint = Paint()..color = Colors.grey;
    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double startY = 0;
    while (startY < size.height) {
      canvas.drawCircle(Offset(size.width / 2, startY), 1.5, dotPaint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
