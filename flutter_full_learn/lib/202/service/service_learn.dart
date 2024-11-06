import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items; //* _items adında PostModelden gelen bi listem var ve nullable olabilir
  String? name;
  bool _isLoading = false;
  late final Dio _networkManager;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    name = 'can';
    fetchPostItems(); //initstate içinde await diyemeyiz çünkü bi nevi const
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading; //hep tersini ver diye çağırdık
    });
  }

//?ben bi request atıcam ve bu datalarımı çekiğccem
  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    //future yani asenkron bir cevap döner bu yüzden bu fonksyionu async yapıp response diye bir değişkene await olarak atıyoruz
    //bu kodu bekle ve bu koddan sonra daha aşağı geçme demek

//! yapman gerekenler
//! response un statuscode una bakman lazım
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data; //response içindeki dataya eşitledim

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(name ?? ''),
          actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()]),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: _items?.length ?? 0, //* listview uzunluğu item sayısı kadar olsun ama null gelirse 0 at diyoruz
          itemBuilder: (context, index) {
            return _PostCard(model: _items?[index]);
          }),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
