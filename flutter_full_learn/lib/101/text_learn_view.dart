import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key});
  final String name = 'Özgün';
  final String name2 = 'Arda';
  final String wlcm = 'welcome';
  final ProjectKeys keys = ProjectKeys(); //ProjectKeys sınıfında keys değişkeni tanımladık, aslında hepsi keys oldu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              //alt alta gelmesi için column kulladnık
              mainAxisAlignment: MainAxisAlignment.center, //merkezlemek için widget
              children: [
            Text(
              //ilk textimiz
              'welcome $name ${name.length}', //textimizin içine yukarıdan name değişkenini çektik, yanına name in uzunluğu fonksiyonunu ekledik
              maxLines: 2, //max 2 satır olsun diye özellik verdik
              overflow: TextOverflow.ellipsis, // uzarsa elips nokta koysun diye özellik verdik
              textAlign: TextAlign.right, //
              style: const TextStyle(
                  //özelliklerden sonra stil vermeye giriyoruz vee TextStyle açıyoruz
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  color: Colors.lime,
                  wordSpacing: 2,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600), //TextStlye muhabbetini kapatıyoruz ama bu çok uzubn kalıyor
            ),
            Text('$wlcm $name2'),
            Text('$wlcm $name2'),
            Text('$wlcm $name2'),
            Text('$wlcm $name2'),
            Text('$wlcm $name2'),
            Text('$wlcm $name2'),
            Text(
              'Hello $name ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyle
                  .welcomeStyle, //onun yerine burda style içine doğrudan başka classta yazdığımız stili çektyik
            ),
            Text('Hello $name ${name.length}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: ProjectColors
                        .welcomeColor) //burda ise flutterın sunduğu nimetlerden faydalanırken kendimiz ekleme yaptık
                ),
            Text(
              keys.welcome, //yukarıda keys olarak tanımlanan ProjectKeys sınıfından welcome elemanını çağırdık
              style: ProjectStyle.welcomeStyle, //stillendirdik ...
            )
          ])),
    );
  }
}

class ProjectStyle {
  static TextStyle welcomeStyle = const TextStyle(
      //2. yazıdaki style içeriğini bulunduran welcomeStlye sınıfı
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Color.fromARGB(255, 96, 0, 250),
      wordSpacing: 2,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
