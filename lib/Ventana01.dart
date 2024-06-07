import 'package:flutter/material.dart';

class Ventana01 extends StatefulWidget {
  const Ventana01({Key? key}) : super(key: key);

  @override
  _Ejercicio01PantallaEstado createState() => _Ejercicio01PantallaEstado();
}

class _Ejercicio01PantallaEstado extends State<Ventana01> {
  final _formKey = GlobalKey<FormState>();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  String _resultadoIMC = '';
  String _interpretacionIMC = '';

  void _calcularIMC() {
    if (_formKey.currentState!.validate()) {
      double altura = double.parse(_alturaController.text);
      double peso = double.parse(_pesoController.text);

      double imc = peso / (altura * altura);

      setState(() {
        _resultadoIMC = imc.toStringAsFixed(2); // Format to two decimal places
        if (imc < 18.5) {
          _interpretacionIMC = 'Bajo peso';
        } else if (imc < 25) {
          _interpretacionIMC = 'Peso normal';
        } else if (imc < 30) {
          _interpretacionIMC = 'Sobrepeso';
        } else {
          _interpretacionIMC = 'Obesidad';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 01: IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _alturaController,
                decoration: const InputDecoration(labelText: 'Altura (en metros)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su altura';
                  }
                  double altura = double.tryParse(value) ?? 0;
                  if (altura <= 0) {
                    return 'Ingrese una altura válida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(labelText: 'Peso (en kilogramos)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su peso';
                  }
                  double peso = double.tryParse(value) ?? 0;
                  if (peso <= 0) {
                    return 'Ingrese un peso válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _calcularIMC,
                child: const Text('Calcular IMC'),
              ),
              SizedBox(height: 16.0),
              Text(
                'IMC: $_resultadoIMC',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Interpretación: $_interpretacionIMC',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


