import 'package:flutter/material.dart';
import 'package:helpinguni/pages/precios.dart';

import '../pages/clases.dart';
import '../pages/contacto.dart';
import '../pages/home.dart';

// Aquí está el CustomScaffold con el AppBar personalizado y el Drawer
class Pruebacustomappbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String titulo;
  final GlobalKey<ScaffoldState> scaffoldKey; // Añadimos la clave del Scaffold

  const Pruebacustomappbar({
    super.key,
    required this.titulo,
    required this.scaffoldKey, // Recibimos la clave del Scaffold
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Detecta si la pantalla es pequeña (por debajo de 600px de ancho)
        bool isSmallScreen = constraints.maxWidth < 600;

        return AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.blue,
          title: Text(
            titulo,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
          leadingWidth: isSmallScreen ? null : 100.0,
          leading: IconButton(
            icon: const Image(image: AssetImage('assets/logo.png')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          actions: isSmallScreen
              ? [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      scaffoldKey.currentState!
                          .openEndDrawer(); // Abre el Drawer usando el GlobalKey
                    },
                  )
                ]
              : [
                  _buildActionButton(context, 'INICIO', const MyHomePage()),
                  _buildActionButton(context, 'ASSIGNATURAS', const Clases()),
                  _buildActionButton(context, 'PRECIOS', const Precios()),
                  _buildActionButton(context, 'CONTACTO', Contacto()),
                  const SizedBox(width: 20), // Espacio al final
                ],
        );
      },
    );
  }

  Widget _buildActionButton(BuildContext context, String label, Widget page) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        label,
        style: const TextStyle(fontSize: 25, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // Tamaño personalizado para la AppBar
}

// Aquí está el Scaffold personalizado con el Drawer y AppBar
class CustomScaffold extends StatelessWidget {
  final Pruebacustomappbar customAppBar;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Creamos una clave GlobalKey

  CustomScaffold({
    super.key,
    required this.customAppBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Asignamos la clave GlobalKey al Scaffold
      appBar: customAppBar,
      endDrawer: Drawer(
        // Drawer que se abre desde el lado derecho en pantallas pequeñas
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            _buildDrawerItem(context, 'INICIO', const MyHomePage()),
            _buildDrawerItem(context, 'ASSIGNATURAS', const Clases()),
            _buildDrawerItem(context, 'PRECIOS', const Precios()),
            _buildDrawerItem(context, 'CONTACTO', Contacto()),
          ],
        ),
      ),
      body: body,
    );
  }

  Widget _buildDrawerItem(BuildContext context, String label, Widget page) {
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
