// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final _title = 'Create your first note...';
  final _description = 'Add a note...';
  final _createNote = 'Create a note';
  final _importNotes = 'Import Notes';


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(path: ImageItems().appleWithBookYontem2),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(title: _description*10,),//4. parantez içinde vermezsek center olucak
            ),
          const Spacer(),

          _createButton(context),

          _createTextButton(context),

            const SizedBox(height: ButtonHeigts.buttonNormalHeight),
          ],
        ),
      )
    );
  }

  TextButton _createTextButton(BuildContext context) {
    return TextButton(onPressed: (){}, child:
          Text(_importNotes,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.black)));
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(onPressed: (){},child:
          SizedBox(
            height: ButtonHeigts.buttonNormalHeight,
            child: Center(
              child: Text(
                _createNote,
                style: Theme.of(context).textTheme.labelMedium)
            )
          )
        );
  }
}


// Centered Text widget
class _SubTitleWidget extends StatelessWidget {
  // ignore: unused_element
  const _SubTitleWidget({Key? key,this.textAlign = TextAlign.center, required this.title,}); //3. text align eğer verilmezse center olarak ayarlanmasını istedik
  final TextAlign textAlign; //1. textAlign adında değişken oluşiturduk
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ,
      textAlign: textAlign, // 2. oluşturulan değişkeni çağırdık
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w400),);
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w800
      ),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeigts {
  static const double buttonNormalHeight = 50 ;
}