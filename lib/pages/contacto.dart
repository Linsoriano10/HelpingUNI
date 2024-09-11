import 'package:flutter/material.dart';
import 'dart:html' as html; // Importa la librería para manipular elementos HTML

import '../widgets/customAppBar.dart';

class Contacto extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    String nombre = "";
    String correo = "";
    String mensaje = "";
    return CustomScaffold(
        customAppBar: const WidgetCustomAppBar(
          titulo: '',
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Contacto',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'Ponte en contacto con nosotros y haznos tus preguntas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Text(
                      'Un coordinador se pondrá en contacto contigo lo antes posible\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre y Apellidos (obligatorio)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduce tu nombre y apellidos';
                        }
                        nombre = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText:
                            'Correo electronico universitario (obligatorio)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduce tu correo universitario (obligatorio)';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Introduce un correo valido';
                        }
                        correo = value;
                        return null;
                      },
                    ),
                    const Text(
                        'AVISO: No recibimos correos que no sean universitarios, los mensajes seran eliminados'),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Mensaje (obligatorio)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Intoduce un mensaje';
                        }
                        mensaje = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _sendEmail(nombre, correo, mensaje);
                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        }));
  }

  void _sendEmail(nombre, correo, mensaje) {
    final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'linosoriano10@gmail.com', // Dirección de correo electrónico
        query:
            'subject= Contacto HelpingUni&body= Nombre: $nombre \n\n Correo: $correo \n\n Mensaje: $mensaje ' // Asunto y cuerpo del correo
        );

    // Abre el enlace mailto en una nueva pestaña del navegador
    html.window.open(emailUri.toString(), '_blank');
  }
}
