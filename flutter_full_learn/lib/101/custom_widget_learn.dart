import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String title = 'Food'; //1 değişken tanımlandı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.light),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(width: MediaQuery.of(context).size.width,child: CustomFootButton(title: title, onPressed: () {  },)),
            ),//4 kullanırken çağırıldı
          ),

          const SizedBox(height: 100,),
          CustomFootButton(title: title, onPressed: () {  },),

        ],
      ),
  );
  }
}

mixin _ColorsUtility {
  final Color red = Colors.red;
  final Color white = Colors.white;

}

mixin _PaddingUtility {
  final normalPadding = const EdgeInsets.all(8.0);
  final normalPadding2x = const EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget  with _ColorsUtility, _PaddingUtility {
  CustomFootButton({super.key, required this.title, required this.onPressed});//3 ve zorunlu hale getirildi
  final String title; //2 değişken çağırıldı
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(backgroundColor:red, //yukarıdaki with den geliyo
            shape: const StadiumBorder()),
            child: Padding(
              padding: normalPadding2x,
              child: Text(
                title, //4 kullanırken çağırıldı
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color:white,
                fontWeight: FontWeight.bold,)
              ),
            ));
  }
}