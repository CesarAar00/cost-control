import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'opciones.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp()); //
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido'),
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
      ),
    );
  }
}
