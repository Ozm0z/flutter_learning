import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/color_learn.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:  [
          Card(
            margin: const EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.error,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SizedBox(height: 100, width: 320, child: Text('a '* 20, style: TextStyle(color: ColorsItems.sulu,),textAlign:TextAlign.center,)),
          ),

          Card(
            shape: const StadiumBorder(),
            color: Colors.white70,
            child: SizedBox(height: 100, width: 250, child: Center(child: Text('a '* 20, style: const TextStyle(color: Colors.purple)))),
          ),


          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 320,
              child: Center(child:
                Text('a '* 20,
                style: TextStyle(
                  color: ColorsItems.sulu,))
              )
            ),
          ),
        ],
      )
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}


//borders
//StadiumBorder()
//CircleBorder()
//RounderRectangleBorder()

class _CustomCard extends StatelessWidget {
  _CustomCard({required this.child});
  final Widget child;
  final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.error,
          //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), böyle yazmak yerine extract local variable,
      shape: roundedRectangleBorder,
      child: child);
  }
}