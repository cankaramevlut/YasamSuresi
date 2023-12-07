import 'package:yasambeklentisi/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  int? hesaplama() {
    int sonuc =
        90 + _userData.sporGunu!.toInt() - _userData.icilenSigara!.toInt();
    return sonuc;
  }
}
