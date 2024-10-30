import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final String _imageNetworkPath = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/327px-Apple-book.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 500,
            // child: Image.asset(ImageItems().appleWithBookYontem1,fit: BoxFit.contain,) yerine
            child: PngImage(path: ImageItems().appleWithBookYontem2,) // bu şekilde PngImage sınıfına path verdik
            //verdiğimiz path ise ImageItems sınıfından appleWithBook değişkeniydi
          ), 
          Image.network(_imageNetworkPath,
          errorBuilder: (context, error, stackTrace) => const Text('Networkten Image Alınamıyor!!!')
          )
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBookYontem1 = 'assets/png/apple_with_book.png'; //bu yöntem iyidir ama bunun yerine alttaki yöntem daha iyi olabilir
  final String appleWithBookYontem2 = 'apple_with_book';
  final String errorAppleWithNetwork = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/327px-Apple-book.svg.png';
}
class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.path}); //required yapıyoruz ki path kısmını yukarıda çağırırken yazaağız
  final String path;
      //PngImage diye Stsl sınıf türettik içine path diye bi string değişken tanımladık
      //sonta aşağoda return döndürdük
      //returnde imaj dönüyor ve bizim path kısmını yazmamızı istiyor
  @override
  Widget build(BuildContext context) {
    return Image.asset(
              _nameWithPath, //burda static hiç bir şey yazmaması için 'assets/png/$path.png' yerine 
              //bunu seçip _nameWithPath şeklinde method vermek çok temiz bir okuma sağlar
              fit: BoxFit.cover,
            );
  }

  String get _nameWithPath => 'assets/png/$path.png';
}