import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num _imc = 0, peso = 0, altura = 0;

  void _calcular() {
    setState(() {
      _imc += 1.0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: const Color.fromARGB(255, 44, 163, 250),
      ),
      body: Column(
        children: [
          Container(child: Text(_imc.toString())),
          Container(
            height: 250,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(titulo: 'Altura', defaultValue: 1.73),
                InputField(titulo: 'Largura', defaultValue: 60.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calculate_outlined),
        onPressed: _calcular,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  InputField({required this.titulo, required this.defaultValue});

  String titulo = 'null';
  double defaultValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        // color: Colors.amber,
        width: 110,
        height: 100,
        child: Column(children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 30),
          ),
          Container(
            width: 80,
            child: TextField(
                decoration: InputDecoration(
                  // suffix: Text((titulo == 'altura' ? 'm' : 'kg')),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  hintText: defaultValue.toString() +
                      (titulo == 'altura' ? ' m' : ' kg'),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true)),
          )
        ]));
  }
}
