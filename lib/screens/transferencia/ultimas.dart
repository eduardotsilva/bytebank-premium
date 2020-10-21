import 'package:bytebank/models/transferencias-model.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titulo = 'Últimas Transferências';

class UltimasTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_titulo),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _quantidade = transferencias.transferencias.length;
          //inverte Sort da últimas transf com reversed e transforma novamente em List
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();

          //só para mostrar as duas últimas transferências
          int _tamanho = 2;

          if (_quantidade == 0){
            return SemTransferencia();
          }

          if (_quantidade < 2) {
            _tamanho = _quantidade;
          }
          return ListView.builder(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: _tamanho,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        RaisedButton(
          child: Text(
            "Transferências",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListaTransferencias()));
          },
        ),
      ],
    );
  }
}

class SemTransferencia extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Você não possui nenhuma transferência",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
