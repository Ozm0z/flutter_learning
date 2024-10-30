import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
    int _counterCustom = 0;
    final String _welcomeTitle = LanguageItems.welcomeTitle;
    final String _dayimsin = LanguageItems.dayi;

    void _updateCounter() {
      setState(() {
        ++ _counterCustom;
      });
    }
    void _downCounter (){
      setState(() {
        -- _counterCustom;
      });
    }
  @override
  Widget build(BuildContext context) {
    return
          Column(
            children: [
              ElevatedButton(
                onPressed: _updateCounter,child: Text('$_welcomeTitle $_counterCustom')
              ),
              Container(height: 10, color: Colors.teal,),
              ElevatedButton(onPressed: _downCounter,
              child: Text(_dayimsin) //3 bu şekilde sadece bu sayfada kullanılacak değişkenin adını _dayimsin yaparak çağırdık
              )
              //child: const Text(LanguageItems.dayi)) 1 şeklinde çağırmak yerine yıkarı önce class çağırmak daha mantıklı
            ],
          );
  }
}