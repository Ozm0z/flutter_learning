import 'package:flutter/material.dart';

// ignore: camel_case_types
class colorLearnView extends StatelessWidget {
  const colorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar içi title : Text'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.error ,
        child: const Text('data'),
      ),
    );
  }
}

class ColorsItems {
  static Color porchase = const Color(0xffEDBF61);

  static Color sulu = const Color.fromRGBO(198, 237, 97, 1);
  static Color twitchMoru = const Color.fromRGBO(100, 65, 165, 1);
  static Color twitchPersMavisi = const Color.fromRGBO(28, 57, 187, 1);

}