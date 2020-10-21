import 'package:bytebank/models/saldo-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {


  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Consumer<Saldo>(
          builder: (context, saldoValor, child) {
            return Text(
              saldoValor.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
