import 'package:flutter/material.dart';

//import '../widgets/customAppBar.dart';
import '../widgets/customAppBar.dart';
import 'clases.dart';

class MyHomePage extends StatelessWidget {
  // Nombre de la clase cambiado
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: const WidgetCustomAppBar(
        titulo: '',
      ),
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
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 180, // Ancho del botón
                        height: 60, // Altura del botón
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Clases()),
                            );
                          },
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
                    const Flexible(
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
                    const Flexible(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
