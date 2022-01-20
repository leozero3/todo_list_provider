import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _index =
    0; // Make sure this is outside build(), otherwise every setState will chage the value back to 0 

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Container(child: Text('You tapped the FAB $_index times')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        tooltip: 'Increment Counter',
        child: Icon(Icons.add), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );;
  }
}
