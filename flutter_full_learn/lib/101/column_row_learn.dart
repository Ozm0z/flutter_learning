import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar() ,
      body: Column(
        children: [
          Expanded (
            flex: 4,
            child: Row(
            children: [
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.green,)),
              Expanded(child: Container(color: Colors.blueGrey,)),
              Expanded(child: Container(color: Colors.pink,)),
            ],
          )),

          const Spacer(flex:2),

          const Expanded (flex: 2, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
           // mainAxisSize: MainAxisSize.min
            children: [

            Text('a'),
            Text('a1'),
            Text('a2'),
          ],)),
          const Expanded (flex: 2, child: FlutterLogo()),

          const SizedBox(height: ProjectContainerSizes.cardHeight,
          child: Column(children: [
            Expanded(child: Text('a')),
            Expanded(child: Text('a')),
            Expanded(child: Text('a')),
            Expanded(child: Text('a')),
          ],),)
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200 ;
}