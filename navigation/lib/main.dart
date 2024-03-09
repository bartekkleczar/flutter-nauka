import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){},
            child: const Text('Press'),
          ),
        ),
      ),
    );
  }
}

