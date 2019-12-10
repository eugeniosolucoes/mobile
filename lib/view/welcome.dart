import 'package:flutter/material.dart';

import '../model/constantes.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _showBalanco = false;

  final myShadow = Shadow(
    blurRadius: 1.0,
    color: Colors.grey[300],
    offset: Offset(0.5, 0.5),
  );

  void exibirBalanco() {
    setState(() {
      _showBalanco = _showBalanco ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            Constantes.welcome_msg,
            style: TextStyle(
              fontSize: 23,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          RaisedButton(
            color: Constantes.button_color,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            onPressed: () {
              exibirBalanco();
            },
            child: Text(
              "Balanço Atual",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 5),
          Visibility(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Créditos: 23540.08",
                    style: TextStyle(
                      fontSize: 20,
                      color: Constantes.button_color,
                      shadows: [
                        myShadow,
                      ],
                    ),
                  ),
                  Text(
                    "Débitos: 21681.92",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      shadows: [
                        myShadow,
                      ],
                    ),
                  ),
                  Text(
                    "Saldo: 1858.16",
                    style: TextStyle(
                      fontSize: 20,
                      color: Constantes.button_color,
                      shadows: [
                        myShadow,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            maintainAnimation: true,
            maintainState: true,
            visible: _showBalanco,
          ),
          SizedBox(height: 5),
          RaisedButton(
            color: Constantes.button_color,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            onPressed: () {},
            child: Text(
              "Períodos",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
