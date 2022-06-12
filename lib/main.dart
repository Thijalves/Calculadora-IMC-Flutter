import 'package:flutter/material.dart';

double peso = 0;
double altura = 0;
String classe = 'Normal';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  double _imc = 0;

  void _calcular() {
    setState(() {
      _imc = peso / (altura * altura);
      if (_imc < 18.5) {
        classe = 'Magreza';
      } else if (_imc < 25) {
        classe = 'Normal';
      } else if (_imc < 30) {
        classe = 'Sobrepeso';
      } else if (_imc < 40) {
        classe = 'Obesidade';
      } else {
        classe = 'Obesidade Grave';
      }
      // print(_imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: const Color.fromARGB(255, 44, 163, 250),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: 30),
              const Text('IMC:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(_imc.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text(classe,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500))
            ],
          )),
          SizedBox(
            height: 250,
            // color: Color.fromARGB(255, 61, 120, 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(titulo: 'Altura', defaultValue: 1.73),
                InputField(titulo: 'Peso', defaultValue: 60.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          onPressed: _calcular,
          child: const Text(
            'Calcular',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class InputField extends StatelessWidget {
  InputField({Key? key, required this.titulo, required this.defaultValue})
      : super(key: key);

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
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 80,
            child: TextField(
                onChanged: (value) {
                  String temp = '';
                  //arruma a string
                  for (int i = 0; i < value.length; i++) {
                    if (value[i] != ',') {
                      temp += value[i];
                    } else {
                      temp += '.';
                    }
                  }
                  //ternario
                  titulo == 'Altura'
                      ? altura = double.parse(temp)
                      : peso = double.parse(temp);
                },
                decoration: InputDecoration(
                  // suffix: Text((titulo == 'altura' ? 'm' : 'kg')),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  hintText: defaultValue.toString() +
                      (titulo == 'Altura' ? ' m' : ' kg'),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true)),
          )
        ]));
  }
}
