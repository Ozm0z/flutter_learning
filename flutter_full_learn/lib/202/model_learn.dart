// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
class PostModel {
  //modellemenin yolları
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  //modellemenin yolları
  int userId;
  int id;
  String title;
  String body;
  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  //modellemenin yolları
  final int userId;
  final int id;
  final String title;
  final String body;
  PostModel3(
    //bu variables lar yalnızca const zamaında gelip initialize olabilir
    this.userId,
    this.id,
    this.title,
    this.body,
  );
}

class PostModel4 {
  //modellemenin yolları
  final int userId;
  final int id;
  final String title;
  final String body;
  PostModel4({
    //yine yalnızca const zamanında gelebilir ama bunun farkı named parametre alır
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

//?en iyi yollardan biri
class PostModel5 {
  // ignore: duplicate_ignore
  // ignore: unused_field
  final int _userId;
  final int _id; //private yani _ olarak tanımladık
  final String _title;
  final String _body;

  int get userId =>
      _userId; //bu şekilde dışarıdan userId yazarak _userId ye özel erişim açtık //?senaryoya göre en mantıklı kullanım
  PostModel5({
    required int userId, //dışardan veri alalım istediik
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title, //sonra kendi değişkenimizi alınan veriyle eşitledik
        _body = body;

  //  {
  //    _userId = userId;
  //    _id = id;
  //    _title = title;
  //    _body = body;
  //  }
}

class PostModel6 {
  // ignore: duplicate_ignore
  // ignore: unused_field
  late final int _userId;
  late final int _id; //bu değerin sonradan geleceğini söyledik
  //sadece final verirsek sadece const zamanında çalışack demek
  late final String _title;
  late final String _body;
  int get userId => _userId; //! buraya bi göz at tekrar
  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel7 {
  // ignore: duplicate_ignore
  // ignore: unused_field
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;
  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//?eğer servisten besleniceksek bunlar null gelebilir diyip nullable yapıyoruz ve named olanları optional parametere yapıyoruz
class PostModel8 {
  // ignore: duplicate_ignore
  // ignore: unused_field
  final int? userId;
  final int? id;
  final String? title;
  String? body; //başındaki finali siliyoruz ki sonradan değiştirebilelim

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    //sonradan güncelleyebilmek için böyle bi fonksiyon tanımlyorum
// data.length;neden burda hata veriyor?
//burda data null olabilir ve ben bunu hesaplayamayabilirim o yüzden olmaz dayı diyor
//bunu burda hesaplamak istiyosan ya force ! atıcaksın ya nullable ? atıcaksın
    data?.length; //! ama asla bunu kullanma mutlaka patlarsın bi yerde
    if (data != null && data.isNotEmpty) {
      //?onun yerine bu daha mantıklı, datamı check ediyorum null ve boş değil mi diye
      body = data; //burası artık null ve boş değil bunu öğrndik ve artık body mi data ya eşitledim
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
