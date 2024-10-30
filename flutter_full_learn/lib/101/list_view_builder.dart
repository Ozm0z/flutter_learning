import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.white,
            );
          },
          itemBuilder: (context, index) {
            print(index);
            return SizedBox(
              //2 o yüzden bunu sized box ile sarmalayıp height ile sınırlıyoruz.
              height: 200, //3 height ile sınırlayınca sığamayıp hata veriyor
              child: Column(
                children: [
                  Expanded(child: Image.network(const RandomImage().imageUrl)), //4 bu yüzden expanded ile sarmalayınca
                  //hepsini sizedbocaun 200 heightine göre sııkkıştırıyo
                  Text('$index'),
                ],
              ),
            );
          },
          itemCount: 15, //1 seperated list vieev için zorunlu ama bunu verince hepsini çiziyor,
          // biz bunu istemiyoruz
        ));
  }
}
