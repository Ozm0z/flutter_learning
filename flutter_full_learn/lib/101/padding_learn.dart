import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        // const EdgeInsets.symmetric(vertical: 20.0), yerine üsttekini yazdık
        child: Column(
          children: [
          Container( color: Colors.white,height: 100, width: 200),
          const SizedBox(height: 10,), // araya boşluk vermek için doğru bilr kullanım değil

          Padding( //veya böyle tek tek vermek yerine ana columnu paddinglesek daha mantıklı
            padding: const EdgeInsets.symmetric(horizontal: 20), //container artık padding içinde ve sağdan soldan 20 pixel boşluklu
            child: Container( color: Colors.red,height: 100, width: 200) //wrap with widget ile padding içine aldık
          ),

          Container( color: Colors.green,height: 100, width: 200),

          Padding(
            padding: ProjectPadding.pagePaddingOnlyTop + ProjectPadding.pagePaddingVertical,
            child: Text('Ali',
            style: TextStyle(
              color: Colors.yellow[400]),), //başka bir senaryoda üstten 20 pixel paddingli Ali yazısı
          ),

          Padding(
            padding: const EdgeInsets.all(20), //container artık padding içinde ve padding her yerden 20 pixel boşluklu
          child: Container( color: Colors.blue,height: 100, width: 200) //wrap with widget ile padding içine aldık
          ),
        ],),
      ),
    );
  }
}
//hepsini böyle amele gibi yazmak yerineeeee
//padding classı açıyoruzz

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 20);
  static const pagePaddingOnlyTop = EdgeInsets.only(top: 20.0);
}