import 'package:flutter/material.dart';

class Ventana02 extends StatefulWidget {
  const Ventana02({Key? key}) : super(key: key);

  @override
  _Ejercicio02PantallaEstado createState() => _Ejercicio02PantallaEstado();
}

class _Ejercicio02PantallaEstado extends State<Ventana02> {
  final _formKey = GlobalKey<FormState>();
  final _velocidadController = TextEditingController();
  String _resultadoDistancia = '';

  void _calcularDistancia() {
    if (_formKey.currentState!.validate()) {
      double velocidad = double.parse(_velocidadController.text);
      double distancia = velocidad * 100; // Constant time of 100 seconds

      setState(() {
        _resultadoDistancia = distancia.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 02: Distancia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _velocidadController,
                decoration: const InputDecoration(labelText: 'Velocidad (m/s)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la velocidad';
                  }
                  double velocidad = double.tryParse(value) ?? 0;
                  if (velocidad <= 0) {
                    return 'Ingrese una velocidad válida (mayor que 0)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _calcularDistancia,
                child: const Text('Calcular Distancia'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Distancia: $_resultadoDistancia m',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
