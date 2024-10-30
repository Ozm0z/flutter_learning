import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('AppBar',),
      ),
      body: Column(
        children: [
          TextButton( //text butonumuz
           child: Text('TextButton', style: Theme.of(context).textTheme.titleLarge), onPressed: (){}, //ThemeData dan textTheme içinden titleLarge ı çektikl
          ),
          const ElevatedButton(onPressed: null, child: Text('ElevatedButton')), //onPressed a null eklendiği zaman buton kendini kapatıyor
          IconButton(onPressed: (){}, icon: const Icon(Icons.access_alarm),),
          OutlinedButton.icon(onPressed: (){},label: const Text('OutlinedButton.icon'), icon: const Icon(Icons.remove_circle_outline_rounded),),
          FloatingActionButton(
            onPressed: (){
              //servise istek at
              //sayfanın rengini düzenle
              //işlem (backend)
            },
          child: const Icon(Icons.account_balance_outlined),),
          SizedBox(
            width: 240,
          child: OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: const RoundedRectangleBorder(),
            padding: const EdgeInsets.all(10)
          ) ,
          child: const Text('OutlinedButton')),
          ),
          InkWell(onTap: (){}, child: const Text('custom',),),
          const SizedBox( height: 20,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20)) )),
              onPressed: (){},
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20 , right: 40, left: 40),
              child: Text(
                'Place Bid',
              style: Theme.of(context).textTheme.headlineLarge,),

          )),
        ],
      ),
    );
  }
}