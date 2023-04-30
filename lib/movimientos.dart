import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Movimientos extends StatefulWidget {
  const Movimientos({Key? key}) : super(key: key);

  @override
  State<Movimientos> createState() => _MovimientosState();
}

class _MovimientosState extends State<Movimientos> {
  String mesSeleccionado = 'Enero'; // El mes seleccionado por defecto es enero
  List<String> tiposDeGastos = ['Alcohol', 'Comida', 'Vestimenta', 'Mascotas'];

  // Creamos un mapa para almacenar los tipos de gastos por mes
  Map<String, List<Map<String, dynamic>>> gastosPorMes = {
    'Enero': [
      {'tipo': 'Alcohol', 'monto': 0},
      {'tipo': 'Comida', 'monto': 0},
      {'tipo': 'Vestimenta', 'monto': 0},
      {'tipo': 'Mascotas', 'monto': 0},
    ],
    'Febrero': [
      {'tipo': 'Comida', 'monto': 0},
    ],
    'Marzo': [
      {'tipo': 'Alcohol', 'monto': 0},
      {'tipo': 'Vestimenta', 'monto': 0},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gastos este mes:'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: mesSeleccionado,
              onChanged: (value) {
                setState(() {
                  mesSeleccionado = value!;
                });
              },
              items: <String>['Enero', 'Febrero', 'Marzo'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Ingresa los montos de gastos en $mesSeleccionado:'),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: gastosPorMes[mesSeleccionado]!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(gastosPorMes[mesSeleccionado]![index]['tipo']),
                      trailing: SizedBox(
                        width: 100,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            setState(() {
                              gastosPorMes[mesSeleccionado]![index]['monto'] = double.tryParse(value) ?? 0;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: '0.00',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
