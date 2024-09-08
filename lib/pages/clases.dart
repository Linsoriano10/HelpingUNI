import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/customAppBar.dart';
import '../widgets/assignaturasInfo.dart';

/*
Hacer:
  Todos los archivos de assignaturas

*/
class Clases extends StatefulWidget {
  const Clases({super.key});

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Clases> {
  String fileContent = '';

  String assigIngInf = '';
  String assigIngElec = '';
  String assigIngMec = '';
  String assigTurismo = '';
  String assigAudioVisuales = '';
  String assigAde = '';
  String assigMarqueting = '';
  String assigLogistica = '';
  String assigCAFE = '';

  @override
  void initState() {
    super.initState();
    loadFileAndAssign();
  }

  Future<void> loadFileAndAssign() async {
    String data = await loadFileData('assets/Ingenieria_Informatica.txt');
    setState(() {
      assigIngInf = data;
    });
    data = await loadFileData('assets/Ingenieria_Mecanica.txt');
    setState(() {
      assigIngMec = data;
    });
    data = await loadFileData('assets/Audiovisuales.txt');
    setState(() {
      assigAudioVisuales = data;
    });
    data = await loadFileData('assets/Ingenieria_Electronica.txt');
    setState(() {
      assigIngElec = data;
    });

    data = await loadFileData('assets/Marqueting.txt');
    setState(() {
      assigMarqueting = data;
    });
    data = await loadFileData('assets/Turismo.txt');
    setState(() {
      assigTurismo = data;
    });
    data = await loadFileData('assets/Cafe.txt');
    setState(() {
      assigCAFE = data;
    });
    data = await loadFileData('assets/ADE.txt');
    setState(() {
      assigAde = data;
    });
    data = await loadFileData('assets/Logistica.txt');
    setState(() {
      assigLogistica = data;
    });
  }

  Future<String> loadFileData(String path) async {
    String data = '';
    try {
      data = await rootBundle.loadString(path);
      setState(() {
        fileContent = data;
      });
      return data;
    } catch (e) {
      setState(() {
        fileContent = 'Error al cargar el archivo + $e';
      });
    }
    return fileContent;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const WidgetCustomAppBar(titulo: 'Pruebas'),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Assignaturas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    //inicio fila de espacios de assignaturas
                    child: Wrap(
                      spacing: 40, // Espacio entre las columnas
                      runSpacing: 40, // Espacio entre filas si se desbordan
                      alignment: WrapAlignment.center,
                      children: [
                        Assignaturasinfo(
                          titulo: 'Ingenieria Informatica',
                          texto: assigIngInf,
                        ),
                        Assignaturasinfo(
                          titulo: 'Ingenieria Mecanica',
                          texto: assigIngMec,
                        ),
                      ],
                    ),
                  ), //final fila de espacios de assignaturas
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  Center(
                    //inicio fila de espacios de assignaturas
                    child: Wrap(
                      spacing: 40, // Espacio entre las columnas
                      runSpacing: 40, // Espacio entre filas si se desbordan
                      alignment: WrapAlignment.center,
                      children: [
                        Assignaturasinfo(
                          titulo: 'Ingenieria Electronica',
                          texto: assigIngElec,
                        ),
                        Assignaturasinfo(
                          titulo: 'Logistica',
                          texto: assigLogistica,
                        ),
                      ],
                    ),
                    //final fila de espacios de assignaturas
                  ),
                  Center(
                    //inicio fila de espacios de assignaturas
                    child: Wrap(
                      spacing: 40, // Espacio entre las columnas
                      runSpacing: 40, // Espacio entre filas si se desbordan
                      alignment: WrapAlignment.center,
                      children: [
                        Assignaturasinfo(
                          titulo: 'Audiovisuales',
                          texto: assigAudioVisuales,
                        ),
                        Assignaturasinfo(
                          titulo: 'ADE',
                          texto: assigAde,
                        ),
                      ],
                    ),
                    //final fila de espacios de assignaturas
                  ),
                  Center(
                    //inicio fila de espacios de assignaturas
                    child: Wrap(
                      spacing: 40, // Espacio entre las columnas
                      runSpacing: 40, // Espacio entre filas si se desbordan
                      alignment: WrapAlignment.center,
                      children: [
                        Assignaturasinfo(
                          titulo: 'Marqueting',
                          texto: assigMarqueting,
                        ),
                        Assignaturasinfo(
                          titulo: 'CAFE',
                          texto: assigCAFE,
                        ),
                      ],
                    ),
                    //final fila de espacios de assignaturas
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
