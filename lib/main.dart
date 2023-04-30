import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'opciones.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://c0.wallpaperflare.com/preview/241/384/859/analysis-analytics-analyzing-annual.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Builder(builder: (context) {
            return Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 75),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Empecemos',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Opciones()),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
