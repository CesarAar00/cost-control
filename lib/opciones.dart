import 'package:flutter/material.dart';
import 'Movimientos.dart';
import 'Registros.dart';
//import 'compras_page.dart';
//import 'ventas_page.dart';

class Opciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Movimientos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Movimientos()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Registros'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registros()),
                );
              },
            ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   child: Text('Compras'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ComprasPage()),
            //     );
            //   },
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   child: Text('Ventas'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => VentasPage()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
