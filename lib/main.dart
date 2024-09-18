import 'package:flutter/material.dart';
import 'package:my_own_api/view/purchase_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter & Flask - Purchase Details'),
        ),
        body: PurchaseDetails(), // Chamando a view corretamente
      ),
    );
  }
}
