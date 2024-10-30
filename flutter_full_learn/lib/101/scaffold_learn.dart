import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scaffold öğreniyoz'),),
      body: const Text('Mehabaaa'),
      backgroundColor: Colors.purple,
      floatingActionButton: FloatingActionButton(onPressed: () { //yüzen buton
        showModalBottomSheet(context: context, builder: (context) => Container( height: 250,)); //tıklayınca 250 pixellik alttan vontainer açılacak
      }, ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // aynı bnutonu böyle konumlandırdık
      drawer: const Drawer(), //en önemliilerden
      bottomSheet: const Text('sasd'),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration.boxDecorationDesign,
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'b'),
        ],),
      ),
    );
  }
}