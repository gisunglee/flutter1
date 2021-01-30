import 'package:flutter/cupertino.dart';


/**
 * ChangeNotifier 이건 데이터 변경되면 노티 뿌려주고 해당되는 위젯들 다 리로드 된다네
 */
class JoinOrLogin extends ChangeNotifier{
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle(){
    _isJoin = !_isJoin;
    notifyListeners();
  }
}