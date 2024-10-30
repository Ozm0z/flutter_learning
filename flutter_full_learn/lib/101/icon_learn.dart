import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sen De Gel'),
      ),
      body: Column(
        children: [
          const Text('ben bir textim'),

          IconButton(onPressed: () {},
          icon: Icon(Icons.message_outlined,
          color: IconColors.iconSec,
          size: IconSizes().iconSmall,
          )),

          Container(
            height: 50,
            width: 500,
            decoration: ProjectContainerDecoration.boxDecorationDesign,
            child: const Text('''ben Container'ım''', textAlign: TextAlign.center),) ,

          IconButton(onPressed: () {},
          icon: Icon(Icons.message_outlined,
          color: IconColors.iconMain,
          size: IconSizes().iconSmall,
          )),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ac_unit_rounded,
              color: IconColors.iconSec,
              size: IconSizes().iconSmall,
            )
          ),

          IconButton(onPressed: () {},
          icon: Icon(Icons.add_location_alt_sharp,
          color: IconColors.iconMain,
          size: IconSizes().iconMed,
          )),

          IconButton(onPressed: () {},
          icon: Icon(Icons.message_outlined,
          color: IconColors.iconSec,
          size: IconSizes().iconSmall,
          )),
        ],
      )
    );
  }
}

class IconSizes {
  final double iconSmall = 25;
  final double iconMed = 50;


}

class IconColors {
  static Color iconMain = Colors.blue;
  static Color iconSec = Colors.yellow;
}