import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/customAppBar.dart';
import 'clases.dart';

class Precios extends StatefulWidget {
  const Precios({super.key});

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Precios> {
  String infoPacks = '';
  String fileContent = '';

  void initState() {
    super.initState();
    loadFileAndAssign();
  }

  Future<void> loadFileAndAssign() async {
    String data = await loadFileData('assets/info_packs.txt');
    setState(() {
      infoPacks = data;
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
        fileContent = 'Error al cargar el archivoccc + $e';
      });
    }
    return fileContent;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        customAppBar: const WidgetCustomAppBar(
          titulo: '',
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Precios',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Clases individuales:15€/h \n'
                              'Clases grupales: 10€/h*persona\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Packs de clases',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              infoPacks,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Precios por persona en el pack\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
                          ]))));
        }));
  }
}
