import 'package:flutter/material.dart';

import '../widgets/customAppBar.dart';
import 'clases.dart';

class MyHomePage extends StatelessWidget {
  // Nombre de la clase cambiado
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetCustomAppBar(titulo: 'Inicio'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Te acompañamos en tus estudios universitarios',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Asignaturas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Matematicas de todos los grados\n Estadistica & Stata \n '
                      'Informatica: Java, C++, JavaScript, SQL \n'
                      'Medios Audiovisuales & P5.JS \n '
                      'Metodos cuantitativos \n '
                      'Derecho mercantil y laboral \n'
                      'Fisica \n'
                      'Definicion de Precios(Grado Marketing) \n'
                      'Contabilidad I & Contabilidad (Grado Marketing) \n',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 180, // Ancho del botón
                        height: 60, // Altura del botón
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Clases()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Consultar Asignaturas',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Primera clase 2h gratuitas\n'
                                  'Clases individuales\n'
                                  'Clases de grupos reducidos, maximo 6 alumnos\n'
                                  'Clases online o presenciales\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center, // Texto centrado
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Quienes Somos?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 400,
                              child: Text(
                                'Alumnos de grados de empresa, ingeniería y medios audiovisuales con un nivel académico excelente',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center, // Texto centrado
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
