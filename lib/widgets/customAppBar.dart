import 'package:flutter/material.dart';
import 'package:helpinguni/pages/precios.dart';

import '../pages/clases.dart';
import '../pages/contacto.dart';
import '../pages/home.dart';

class WidgetCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titulo;

  const WidgetCustomAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.blue,
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ),
      leadingWidth: 100,
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
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          child: const Text(
            'INICIO',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        const SizedBox(width: 10), // Espacio entre los botones
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Clases()),
            );
          },
          child: const Text(
            'ASSIGNATURAS',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          // Crear Pagina de Precios
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Precios()),
            );
          },
          child: const Text(
            'PRECIOS',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        const SizedBox(width: 10), // Otro espacio entre los botones
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contacto()),
            );
          },
          child: const Text(
            'CONTACTO',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        const SizedBox(
            width: 20), // Espacio adicional para el final si es necesario
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100); //Default = 56.0
}
