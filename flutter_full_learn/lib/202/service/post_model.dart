class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body}); //buraya kadar daha önce öğrenmiştik

//!asla buraya kod yazılmaz

  PostModel.fromJson(Map<String, dynamic> json) {
    //jsondan bir map gelicek diyoruz
    userId = json['userId']; //jsondaki userId olan String i soldaki userId değişkeni olarak ata diyoruz
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
//!asla buraya kod yazılmaz

  Map<String, dynamic> toJson() {
    //burda da dataları doldurup json a yolluyoruz
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
