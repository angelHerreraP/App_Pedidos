import 'package:flutter/material.dart';
import 'package:pedidos_app/Carrito.dart';

// Define the image asset path as a constant
class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;

  LogoAppBar({this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Disable the default back button
      backgroundColor: Color.fromARGB(255, 60, 119, 63),
      title: Container(
        width: 100, // Set the desired width here
        height: 80, // Set the desired height here
        child: Image.asset('Assets/Images/Logo.png'),
      ),
      leading: leading,
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => CarritoItem(),
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

Widget _buildBottomSheetContent(BuildContext context) {
  return Container(
    height: 300, // Adjust the height as needed
    width: 350,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add your pop-up content here
        Text("Título del pop-up"),
        Text("Contenido del pop-up"),
        // ... Add more widgets as needed
      ],
    ),
  );
}

//showModalBottomSheet(
//  context: context,
//  builder: (context) => _buildBottomSheetContent(context),
//);
