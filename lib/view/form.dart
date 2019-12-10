import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import '../model/constantes.dart';

enum TipoLancamento { debito, credito }

class FormLancamento extends StatefulWidget {
  @override
  _FormLancamentoState createState() => _FormLancamentoState();
}

class _FormLancamentoState extends State<FormLancamento> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  TipoLancamento _tipoLancamento = TipoLancamento.debito;
  final _format = DateFormat("dd/MM/yyyy");

  double _quantidade = 1;
  double _valor = 0.0;
  double _valorTotal = 0.0;

  int _initValorColor = Colors.red.value;

  List<String> suggestions = [];

  String currentText = "";

  void calculate() {
    _valorTotal = _valor * _quantidade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(Constantes.app_title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Novo Lançamento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Constantes.app_color,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: TipoLancamento.debito,
                    groupValue: _tipoLancamento,
                    onChanged: (TipoLancamento value) {
                      setState(() {
                        _tipoLancamento = value;
                        _initValorColor = Colors.red.value;
                      });
                    },
                  ),
                  new Text(
                    'Débito',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  new Radio(
                    value: TipoLancamento.credito,
                    groupValue: _tipoLancamento,
                    onChanged: (TipoLancamento value) {
                      setState(() {
                        _tipoLancamento = value;
                        _initValorColor = Colors.blue.value;
                      });
                    },
                  ),
                  new Text(
                    'Crédito',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              TextFormField(
                autofocus: true,
                decoration: new InputDecoration(
                  hintText: 'Descrição',
                  hasFloatingPlaceholder: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor informe a descrição do lançamento!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Qtd.',
                  hasFloatingPlaceholder: true,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                initialValue: '$_quantidade',
                onChanged: (value) {
                  _quantidade = double.parse(value);
                  calculate();
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor informe a quantidade!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: 'Valor',
                  hasFloatingPlaceholder: true,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                initialValue: '$_valor',
                style: TextStyle(
                  color: Color(_initValorColor),
                ),
                onChanged: (value) {
                  _valor = double.parse(value);
                  calculate();
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor informe a valor!';
                  }
                  return null;
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                child: Text(
                  '$_valorTotal',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(_initValorColor),
                  ),
                ),
              ),
              DateTimeField(
                format: _format,
                initialValue: DateTime.now(),
                decoration: new InputDecoration(
                  hintText: 'Data Inclusão',
                  hasFloatingPlaceholder: true,
                ),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
              ),
              SimpleAutoCompleteTextField(
                decoration: new InputDecoration(
                  hintText: 'Categorias',
                ),
                key: key,
                suggestions: suggestions,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  color: Constantes.button_color,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      print(this._formKey.currentState);
                    }
                  },
                  child: Text(
                    'Incluir Lançamento',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
