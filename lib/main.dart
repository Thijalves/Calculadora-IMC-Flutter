import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('sCalculadora IMC'),
            backgroundColor: const Color.fromARGB(255, 44, 163, 250),
          ),
          body: InputField(titulo: 'Altura'),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 3, 76, 129),
            child: const Icon(Icons.arrow_right),
            onPressed: () => null,
          )),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({required this.titulo, Key? key});

  String titulo = 'null';

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.amber,
        width: 100,
        child: Column(children: [
          Text(titulo),
          TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.height),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: '1,70',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true))
        ]));
  }
}
