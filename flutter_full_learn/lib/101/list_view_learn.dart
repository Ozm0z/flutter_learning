import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          //FLUTTERDA TASARIM YAPMANIN 2. YAKLAŞIMI
          //LİST VİEW DE SONSUZLUK VARDIR
          padding: EdgeInsets.zero,
          children: [
            FittedBox(child: Text(LanguageItems.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium)),
            Container(
                height: 500,
                color: Colors.blue,
                child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
            // const SizedBox(height: 10), yerine Divider kullan
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                    width: 125,
                    color: Colors.red,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.white,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.red,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.white,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
              ]),
            ),
            FittedBox(
                child: TextButton.icon(
              icon: const Icon(Icons.abc_outlined),
              onPressed: () {},
              label: (Text(LanguageItems.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium)),
            )),

            //xx
            const Divider(),
            FittedBox(child: Text(LanguageItems.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium)),
            Container(
                height: 500,
                color: Colors.green,
                child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
            // const SizedBox(height: 10), yerine Divider kullan
            const Divider(),
            SizedBox(
              height: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                    width: 125,
                    color: Colors.red,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.white,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.red,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
                Container(
                    width: 125,
                    color: Colors.white,
                    child: Image.network(const RandomImage().imageUrl, fit: BoxFit.contain)),
              ]),
            ),
            FittedBox(
                child: TextButton.icon(
              icon: const Icon(Icons.abc_outlined),
              onPressed: () {},
              label: (Text(LanguageItems.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium)),
            )),
            const ListViewDemo(),
          ]),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});
  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  void initState() {
    super.initState();
    print('BURDAYIM LOOOOOO');
  }

  @override
  void dispose() {
    super.dispose();
    print('Çıktın Dayı');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
