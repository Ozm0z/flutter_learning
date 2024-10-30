// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;
  //sonradan değer alacağı için CollectionModel sınıfı değişkenlerini içeren late bir sınıf oluşturduk
  //ve listemizin adını _items koyduk
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().itemsDummy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          padding: PaddingUtility().paddingHorizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          }),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingAll,
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.red, child: Image.asset(_model.imagePath, fit: BoxFit.fill))),
              Padding(
                padding: PaddingUtility().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _model.title,
                      style: const TextStyle(color: Colors.black),
                    ),
                    //Text(_model[index].price.toString() + ' ETH'), bu yol gereksiz bir kullanım
                    Text(
                      '${_model.price} ETH',
                      style: const TextStyle(color: Colors.black),
                    ) //bu daha mantıklı
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath; // dışarıdan image alıcam
  final String title; //title alıcam
  final double price; //price alıcam
  CollectionModel({required this.imagePath, required this.title, required this.price}); //ve bunlar zorunlu istensin
}

class PaddingUtility {
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingTop = const EdgeInsets.only(top: 20);
  final paddingAll = const EdgeInsets.all(20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems {
  late final List<CollectionModel> itemsDummy;
  CollectionItems() {
    //sonradan değer alacağı için CollectionModel sınıfı değişkenlerini içeren late bir sınıf oluşturduk
    //ve listemizin adını _items koyduk
    itemsDummy = [
      //burda da listemizin içeriğini belirlityoruz
      //itemleri tanımlıyoruz
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.1),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.2),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.3),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.5),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.6),
      CollectionModel(imagePath: ProjectImages().imgPathinCards, title: 'Abstract Art', price: 3.7),
    ];
  }
}

class ProjectImages {
  final String imgPathinCards = 'assets/png/image_collection.png';
}
