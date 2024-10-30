//Bir ekran olacak
//bu ekranda 3 buton olacak ve bunlara basınca renk değişimi olacak
//Seçili olan buton SELECTED İCON OLSUN

//renk değişimi olacak duyduğum an demek ki bir hayat var o zaman stfl

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _scafColor;

  @override
  void initState() {
    super.initState();
    _scafColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    //tam anlamadım iyi bakmak lazım
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _scafColor && widget.initialColor != null) {
      colorChanger(widget.initialColor!);
    }
  }

  void colorChanger(Color verilencolor) {
    //1. renk değiştirici adında fonksiyon tanımladım ve içine Color sınıfından verilen color girileceğini gösterdim
    setState(() {
      _scafColor = verilencolor; //3. verilen color scafcolor diye bişeye eşitlendi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scafColor, //4 backgroundColor scafa eşitlendi
      bottomNavigationBar: BottomNavigationBar(
          onTap: _colorOnTap, //basıldığında şu olsun diye method oluşturdum
          items: const [
            BottomNavigationBarItem(icon: _ColorContainer(colorVercem: Colors.indigo), label: 'Indigo'),
            BottomNavigationBarItem(icon: _ColorContainer(colorVercem: Colors.yellow), label: 'Yellow'),
            BottomNavigationBarItem(icon: _ColorContainer(colorVercem: Colors.green), label: 'Green'),
          ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.indigo.index) {
      //value == 0 yerine aşağıya enum açıp işimi kolaylaştırdım
      colorChanger(Colors.indigo); //2fonksiyonu çalıitırırken verilen cololoru verdim
    } else if (value == _MyColors.yellow.index) {
      colorChanger(Colors.yellow);
    } else if (value == _MyColors.green.index) {
      colorChanger(Colors.green);
    }
  }
}

enum _MyColors {
  indigo, // sıfırıncı index
  yellow,
  green,
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({required this.colorVercem});
  final Color colorVercem;
  @override
  Widget build(BuildContext context) {
    return Container(color: colorVercem, width: 35, height: 35);
  }
}
