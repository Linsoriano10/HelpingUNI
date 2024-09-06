import 'package:flutter/material.dart';

class Assignaturasinfo extends StatelessWidget {
  final String titulo;
  final String texto;

  const Assignaturasinfo(
      {super.key, required this.titulo, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 300,
          height: 600,
          child: ColoredBox(
            color: Colors.blue,
            child: SingleChildScrollView(
              child: Text(
                texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
