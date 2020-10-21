import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo-model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Receber depósito';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: _dicaCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);

    debugPrint('dentro metodo criaDeposito $valor');

    if(depositoValido) {
      debugPrint('deposito criado');
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }

  }

  _validaDeposito(valor) {
    print('metodo valida deposito $valor');

    final _campoPreenchido = valor != null;

    print('campo preenchido retorno $_campoPreenchido');

        return _campoPreenchido;
  }

  _atualizaEstado(context, valor){
     print('atualiza estado');
      Provider.of<Saldo>(context,listen:false).adiciona(valor);
  }

}
