import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = []; //içi boş bi liste yarattım

  void addSelected(int index, bool isAdd) {
    //bi fonk tanımladım
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index); //kaçıncı indexteysem o indexi ekleyecek
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        // ListView build ettik,
        return TextButton(
          onPressed: () async {
            final response = await navigateToWidgetNormal<bool>(
                context,
                NavigateDetailLearn(
                  isOkey: selectedItems.contains(index),
                ));
            if (response is bool) {
              //response bizim tanımladığımız bi değişken
              print('onaylaya tılkladın');
              addSelected(index, response);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.green : Colors.red,
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        //yüzen aksiyon butonu
        child: const Icon(Icons.navigation_rounded), //iconu
        onPressed: () async {},
      ),
    );
  }
}

mixin NavigatorManager {
  //class yerine mixin yapıyorum ki constucktorsız olsun ve yukarıda with diye kullanabileyim
  void navigateToWidget(BuildContext context, Widget widget) {
    //fonksiyon tanımlıyoruz
    // bana contexti versin, gitmek istediği widgeti söylesin ben yollayım
    Navigator.of(context).push(
      //yönlendirme için böyle başlıyoruz sonra .push atıyoruz
      MaterialPageRoute(
          builder: (context) {
            //bir material sayfaya yönlendireceğimizi gösteriyoruz
            return widget; //ve bu yönlendirme methodu içinde istediğimiz sayfayı return ediyoruz...
          }, //en basit senaryo bu kadar amaaaaa

          //xx

          fullscreenDialog: true,
          settings: const RouteSettings() //bi sayfaya dynamic ya da obje olarak yollayabiliyoruz
          //bu kaydırgaçlı açılış olmasını sağlıyor diyalog ekranı gibi, ve çarpı ikonu ekliyor
          ),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }
}
