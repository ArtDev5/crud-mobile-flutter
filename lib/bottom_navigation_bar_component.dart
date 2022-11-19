import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  BuildContext context;

  BottomNavigationBarComponent(this.context);

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: 'Voltar',
          tooltip: 'Voltar',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.logout), label: 'Sair', tooltip: 'Sair'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.popAndPushNamed(
        context,
        "/",
      );
    } else if (index == 0) {
      Navigator.pop(context);
    }

  }
}
