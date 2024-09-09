import 'package:flutter/material.dart';
import 'package:helpinguni/pages/precios.dart';

import '../pages/clases.dart';
import '../pages/contacto.dart';
import '../pages/home.dart';

class Pruebacustomappbar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const Pruebacustomappbar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Determinar si el ancho de la pantalla es menor que el de un móvil típico (por ejemplo, 600px)
        bool isSmallScreen = constraints.maxWidth < 600;

        return AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.blue,
          title: Text(
            titulo,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
          leading: isSmallScreen
              ? IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Abre el Drawer
                  },
                )
              : IconButton(
                  icon: const Image(image: AssetImage('assets/logo.png')),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                ),
          actions: isSmallScreen
              ? null // No mostramos las acciones en pantallas pequeñas, se muestran en el Drawer
              : [
                  _buildActionButton(context, 'INICIO', const MyHomePage()),
                  _buildActionButton(context, 'ASSIGNATURAS', const Clases()),
                  _buildActionButton(context, 'PRECIOS', const Precios()),
                  _buildActionButton(context, 'CONTACTO', Contacto()),
                  const SizedBox(width: 20), // Espacio adicional al final
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
  Size get preferredSize => const Size.fromHeight(100); // Tamaño personalizado para la AppBar
}

class CustomScaffold extends StatelessWidget {
  final Pruebacustomappbar customAppBar;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.customAppBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
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
