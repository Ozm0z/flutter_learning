import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/button_learn.dart';
import 'package:flutter_full_learn/101/color_learn.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/text_learn_view.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // tabbar kullanımında scaffoldu önce bu widget ile srmalamam gerekiyor
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          appBar: AppBar(),
          extendBody: true,
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            shape: const CircularNotchedRectangle(),
            child: _myTabView(),
          ),

          //butonumuzu konumlandırma komponenti
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.home),
              onPressed: () {
                //butona basıldığında
                _tabController.animateTo(_MyTabViews.home.index);
              }),

          //tabBarView ekliyoruz, view kısmı önemli, burda görüneni eklkiyoruz,
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
//? genel tabbar komponentleri (main.dart ta thme içine yazılır normalde)
        labelColor: Colors.cyan,
        unselectedLabelColor: Colors.brown,
        indicatorColor: Colors.blue,
        padding: EdgeInsets.zero,
        onTap: (int value) {
          // ignore: avoid_print
          return print('object');
        },
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(), //ekranı kaydırmayı kapattık
      controller: _tabController,
      children: [
        //içerisine yukarıta lenght: 2 de belirttiğim kadar komponent ekleyebilirim
        //* 1. komponent
        //? örnek olarak Container(color: Colors.red),
        TextLearnView(),
        //* 2. komponent
        //? örnek olarak Container(color: Colors.green)
        IconLearnView(),
        const colorLearnView(),
        const ButtonLearnView(),
      ],
    );
  }
}

enum _MyTabViews {
  home,
  settings,
  favourite,
  profile,
}

extension _MyTabViewExtension on _MyTabViews {
  //buraya yazacağım methodlar, _MyTabViews in özellikleri olacak
}
