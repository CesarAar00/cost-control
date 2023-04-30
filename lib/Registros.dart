import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class RegistrosPage extends StatefulWidget {
  @override
  _RegistrosPageState createState() => _RegistrosPageState();
}

class _RegistrosPageState extends State<RegistrosPage> {
  final box = GetStorage();

  final _ingresoController = TextEditingController();
  final _retiroController = TextEditingController();

  double contador = 0;
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = box.read('total') ?? 0;
    contador = box.read('contador') ?? 0;//almacena el valor
  }

  void _ingresarMonto() {
    double monto = double.tryParse(_ingresoController.text) ?? 0;
    if (monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El valor ingresado no es válido')),
      );
    } else {
      total ??= 0;
      box.write('total', total + monto);
      contador += monto;
      box.write('contador', contador);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Monto ingresado correctamente')),
      );
      _ingresoController.clear();
      setState(() {});
    }
  }

  void _retirarMonto() {
    double monto = double.tryParse(_retiroController.text) ?? 0;
    double balance = contador;
    if (monto <= 0 || monto > balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El valor ingresado no es válido')),
      );
    } else {
      total ??= 0;
      box.write('total', balance - monto);
      contador -= monto;
      box.write('contador', contador);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Monto retirado exitosamente')),
      );
      _retiroController.clear();
      setState(() {});
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
              child: Text('Retirar dinero'),
            ),
            SizedBox(height: 32.0),
            Text(
              'Total: $contador',
              style: TextStyle(fontSize: 20.0),
            ),
            // SizedBox(height: 8.0),
            // Text(
            //   'Contador: $contador',
            //   style: TextStyle(fontSize: 20.0),
            // ),

            //SizedBox(height: 8.0),
            // Text('Contador: $contador',
            //   style: TextStyle(fontSize: 20.0),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     contador++;
      //    // box.write('contador', contador);
      //     print('valor en storage');
      //    // print(box.read('contador') ?? 0);

      //     //setState(() {});
      //   },
      // ),
    );
  }
}
