import 'package:bytebank/models/saldo-model.dart';
import 'package:bytebank/models/transferencias-model.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),

        ChangeNotifierProvider(
          create: (context) => Transferencias(),
        )

      ],
      child: BytebankApp(),
    ));

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
//      theme: ThemeData(
//        primaryColor: Colors.green[900],
//        accentColor: Colors.blueAccent[700],
//        buttonTheme: ButtonThemeData(
//          buttonColor: Colors.blueAccent[700],
//          textTheme: ButtonTextTheme.primary,
//        ),
//      ),
      home: DashBoard(),
    );
  }
}
