import 'package:flutter/material.dart';
import '../model/constantes.dart';
import 'form.dart';
import 'welcome.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Welcome(),
    Text(
      'Pesquisar...',
      style: optionStyle,
    ),
    Text(
      'Configurações...',
      style: optionStyle,
    ),
    Text(
      'Novo Lançamento...',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(Constantes.app_title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormLancamento()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Novo lançamento',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Pesquisar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constantes.button_color,
        onTap: _onItemTapped,
      ),
    );
  }
}
