import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';
import 'package:flutter_full_learn/101/statefull_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0; //sayfa numaraswı eklemece başlangıç
  void _updatePageIndex(int index) {
    //2 sayfa numarasını sürekli güncellesin istedik
    setState(() {
      _currentPageIndex = index; //3 değişkenimizi indexe eşitledik
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(_currentPageIndex.toString()), //4 değişkeni yazdırdık
          ),
          const Spacer(),
          FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.bounceOut);
              },
              child: const Icon(Icons.chevron_left)),
          FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.bounceOut);
              },
              child: const Icon(Icons.chevron_right)),
        ],
      ),
      body: PageView(
        controller: _pageController, //küçük ama tricky bi numara, diğer sayfayı önizletiyo
        onPageChanged: _updatePageIndex, //1 sayfa değiştikçe bu methoda gidelim dedik
        padEnds: false,

        children: [
          const ImageLearn(),
          IconLearnView(),
          const StatefullLearn(),
          const StackLearn(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(milliseconds: 500);
}
