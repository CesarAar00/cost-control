
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Registros extends StatefulWidget {
  @override
  _RegistrosState createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  final box = GetStorage();

  final _ingresoController = TextEditingController();
  final _retiroController = TextEditingController();

  void _ingresarMonto() {
    double monto = double.tryParse(_ingresoController.text) ?? 0;
    if (monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El valor ingresado no es válido')),
      );
    } else {
      box.write('balance', box.read('balance') + monto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Monto ingresado correctamente')),
      );
      _ingresoController.clear();
    }
  }

  void _retirarMonto() {
    double monto = double.tryParse(_retiroController.text) ?? 0;
    double balance = box.read('balance');
    if (monto <= 0 || monto > balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El valor ingresado no es válido')),
      );
    } else {
      box.write('balance', balance - monto);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Monto retirado exitosamente')),
      );
      _retiroController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Maneja tu dinero aquí',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ingresoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresar monto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _ingresarMonto,
              child: Text('Ingresar dinero'),
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _retiroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Retirar monto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _retirarMonto,
              child: Text('Retirar monto'),
            ),
          ],
        ),
      ),
    );
  }
}
