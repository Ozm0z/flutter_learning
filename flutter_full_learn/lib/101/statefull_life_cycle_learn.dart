import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = ''; //boş bi değişken tanımladık
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    //initState gibi çalışır, drawdan önce çalışır, önce initstate çalışır
    super.didChangeDependencies(); //tekrardan call edebiliyoruz
    print('c'); //işlem bittikten sonra çağırıldı
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    //lifecycle içerisinde en kolay ve en sık kullanılması gerekenlerden
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      //eski mesaj şu ankine eşit değilse _message mi artık güncelle diyorum
      _message = widget.message;
      _computeName();
    }
    print('b'); //işlem bittikten sonra çağırılmadı
  }

  @override
  void dispose() {
    //sayfadan çıktığı an, sayfa öldüğü an çalışır
    super.dispose();
    _message = '';
  }

  @override
  void initState() {
    //statefull widgetlardan önce işlenen ve biten işlemler burada gerçekleşir
    super.initState();
    _message = widget.message; //boş mesajımızı asıl mesaja eşitledik
    _isOdd = widget.message.length.isOdd;
    _computeName();
    print('a'); //işlem bittikten sonra çağırıldı
  }

  void _computeName() {
    //if (widget.message.length.isOdd) {} yazmak yerine
    if (_isOdd) {
      //yazmak çok daha mantıklı
      _message += ' çift'; //dışarıdan gelen mesajın yanına 'çift' eklemiş olduk
    } else {
      _message += ' tek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: widget.message.length.isOdd ? const Text('Tek') : const Text('Çift'), BUNU YAZMAMA GEREK KALMADI
        title: Text(_message),
      ),
      body: widget.message.length.isOdd
          ? TextButton(
              onPressed: () {
                setState(() {
                  _message = 'a';
                });
              },
              child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
