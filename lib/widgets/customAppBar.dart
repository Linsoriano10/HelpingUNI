import 'package:flutter/material.dart';

import '../pages/clases.dart';
import '../pages/contacto.dart';
import '../pages/home.dart';

class WidgetCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const WidgetCustomAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(titulo),
      leading: IconButton(
        icon: const Image(image: AssetImage('assets/logo.png')),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.class_),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Clases()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.contact_mail),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contacto()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
