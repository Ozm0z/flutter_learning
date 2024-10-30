import 'package:flutter/material.dart';
class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String _title = 'Welcome Learn'; //_title değişkeni tanımladık bu değişken bir string ve Welcome Learn yazıcak
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title), //yukarıda tanımlanan _title değişkenini çağırdık
        leading: Icon(Icons.chevron_left, size: IconStyleDesign.iconSize),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.mark_email_read_sharp, size: IconStyleDesign.iconSize,),
          ),
        const Center(child: CircularProgressIndicator())
        ],

      ),
      body: const Column(
        children: [
          Text('zort'),
          Text('zort'),
          Text('zort'),
          Text('zort'),
          Text('zort'),
          Text('zort'),
          Text('zort'),
          ],
      ),
    );
  }
}

class IconStyleDesign {
  static double iconSize  =  35 ;
}