import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/opciones.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp()); //
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bienvenido'),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text('Empecemos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Opciones()),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

