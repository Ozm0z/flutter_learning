// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  // final user9 = PostModel8(); böyle olursa içerdeki datalar final olduğundan güncelleyemeyiz
  var user9 = PostModel8(body: 'bodym bne'); //böyle olursa üncelleriz
  @override
  void initState() {
    super.initState();

    //!user1
    final user1 = PostModel1(); //PostModele user1 diyip
    user1.body = 'hello'; //user1 in bodysini 'hello' yaptık
    //*bunun yerine 2 satır üstteki PostModel(); in noktalı virgülünün öncesine şu şekilde yazılabilirdi
    //?..userId = 1
    //?..body = 'Özgün' ; noktalı virgül burada

    //!user2
    final user2 = PostModel2(1, 2, 'title', 'Body'); //bu şekilde named istediğinde
    //ama postmodel2 içinde fial olarak işaretlelndmediğinden ben bunları sonradan değiştirebilrim
    //örnek
    user2.body = 'x';

    //!user2
    final user3 = PostModel3(1, 2, 'title', 'body'); //yine değerleri verdik
    //ama burda update edemiyoruz çünkü postmodel3 içinde final olarak verilmiş
    //* user3.body = 'update body'; hata vericektir

    //!user4
    //?localde çalışacaksan burda variable alıp doldurmak daha mantıklı
    final user4 = PostModel4(userId: 1, id: 2, title: 'title', body: 'body'); //required paremetreleri verdik
    //* user4.body = 'update body'; hata vericektir çünkü final olarak girilmiş yine
    //!user5
    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    //* user5.body ='a'; ile erişemiyor çünkü ben bu nesneleri postmodel 5 içinde _ kullanarak private olarak verdim
    //?ancak post model5 içinde yaptığım değişiklik ile
    user5.userId; //userId ye erişebiliyorum

    //!user6
    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body'); //kullanım farkı öncekinden yok
    user6.userId; //private olduğu için postmodel6 içinde düzenleme yapıp eriştim

    //!user7
    final user7 = PostModel7(
        //burda hiç değer vermeyebiliyoruz ve default değerleri bizi karşılıyor
        );

    //!user8
    //?service de iş yapıyosan en mantıklısı bu
    final user8 = PostModel8(body: 'user8 im ben');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.abc, size: 50),
          label: const Text('''appbarı değiştir'''),
          foregroundColor: Colors.white,
          onPressed: () {
            //*müşteri dediki butona basıcam basınca user9 un body si güncellensin
            //* ama PostModel8 içinde bunları final olarak atadığımızdan güüncelleyemeyiz
            //* bunun için ya PostModel8 i normal variable a çekicez yani 14. satırda
            //* PostModel9 user9 = PostModel8(); veya var final user9 = PostModel8(); olmalı

            setState(() {
              // user9 = PostModel8(title: 'a'); böyle yapınca diğer named parmetreler sıfılranıyor
              user9 = user9.copyWith(title: 'copyWithli title'); //böyle yparsak şunu demiş oluyoruz,
              //?tüm named parmetreler ilk tanımladığımız gibi (15. satır) kalsın, sadece title burda tekrar atansın
              user9.updateBody(
                  'body i update ettik'); //içerideki text yerine null gelse bile bu fonksiyon benim kodumu koruyacak
            });
          }),
      body: AppBar(
        //? title: Text(user9.body), bu kullanımda body String? yani nullable olduğu için hata veriyor
        title: Text(user9.body ?? 'Not have any data'), //burda eğer null gelirse  şu metni yaz diye tembihledik
        //!ama FAB a basımnca normalde tanımladığımız body yok oldu gitti
        //bunun için ya FAB içinde yeniden data vericez
        //?ya da en best practise olarak postmodel8 e gidip bodyi 'generate copyWith' diyoruz
      ),
    );
  }
}
