import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imageUrl = 'https://picsum.photos/200/300';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              //title: Image.network(imageUrl, height: 100, fit: BoxFit.cover),yerine
              title: const RandomImage(),
             // dense: true,
              subtitle: const Text('How do you use your card',),
              minVerticalPadding: 0,
              dense: true,
              leading: Container(
                height: 200, 
                width: 30,
                alignment: Alignment.topCenter,
                color: Colors.green,
                child: const Icon(Icons.money)),
              trailing: Container(width: 20,
              color: Colors.red,
              child: const SizedBox(width: 20,child: SizedBox(width: 20,child: Icon(Icons.chevron_right_outlined)))),
              onTap: () {},
            ),
          ),
        ),
      ],),
    );
  }
}