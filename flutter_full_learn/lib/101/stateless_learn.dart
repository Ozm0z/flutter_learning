// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});
  final String value = 'özgün'; //Local Variable yapıp taşınan veri
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ///Text('data',style: Theme.of(context).textTheme.headlineSmall), yazmak yerine en aşağıya widget açtım
            const TitleTextWidget(value: 'özgün'), //sonra aşağıdaki widgeti çağırdım
            const TitleTextWidget(value: 'özgün'), //ve istediğim kadar istediğim gibi çağırabilirim
            const _emptyBox(),
            TitleTextWidget(value: value), //ctrl . ile local variable deyip onu yukarı taşıdık
            const _emptyBox(),
            const TitleTextWidget(value: 'özgün2'), //aşağıda zorunlu kılınan value değerimi girdim
            const TitleTextWidget(value: 'özgün3'),
            const _emptyBox(),
            const TitleTextWidget(value: 'özgün4'),

            const _CustomContainer(),
            const _emptyBox(),
          ],
        ));
  }
}

class _emptyBox extends StatelessWidget {
  const _emptyBox();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      //bunu ana body: içinde yazmak yerine ctrl . yapıp extract widget ile dışarı alıyoruz
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.purple]), //bayıldım la buna
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
          border: Border.all(width: 10, color: Colors.white60),
          boxShadow: const [
            BoxShadow(
                //boxShadow
                color: Colors.green,
                offset: Offset(6, 6),
                blurRadius: 5)
          ]),
      child: Text('A' * 50),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.value}); //value değişkenini zorunlu kıldım
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(
      value, //yukarıdan alınan value yi sundum
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
