import 'package:flutter/material.dart';


class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

        SizedBox(           //SizedBox öğrenimi
          width: 300,
          height: 300,
          child: Text('A' * 599),
        ),

        const SizedBox.shrink(), //boş sizedbox
        SizedBox.square( //kare sizedbox
          dimension: 50, //sizedboxun kenar uzunluğu
          child: Text('B'*599), //sizedboxun childi(text)
        ),

        Container(           //Container öğrenimi
          height: 300,
          constraints: const BoxConstraints(maxWidth: 200, minWidth: 100, maxHeight: 100, minHeight: 100),
          padding: const EdgeInsets.all(15), //dıştan içe padding
          margin: const EdgeInsets.all(15), //içten dışa margin
          decoration: ProjectContainerDecoration.boxDecorationDesign, //aşağıdaki classtan çağırdım daha temiz oldu
          child: Text('A' * 599),
        ),

        
        ],
      )
    );
  }
}

class ProjectContainerDecoration {
  static BoxDecoration boxDecorationDesign = BoxDecoration(
    gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.purple]), //bayıldım la buna
    borderRadius: BorderRadius.circular(15),
    color: Colors.red,
    border: Border.all(width: 10, color: Colors.white60 ),
    boxShadow: const [
      BoxShadow(    //boxShadow
        color: Colors.green,
        offset: Offset(6, 6),
        blurRadius: 5
      )
    ]
  );

}