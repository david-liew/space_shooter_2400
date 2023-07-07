

class Account {

  String _id;
  late String _name;
  int _score = 0;

  String get id => _id;

  Account({
    String id = "0",
  }) : _id = id;

  set name(String value) {
    _name = value;
  }

  set score(int value) {
    _score = value;
  }

  set id(String value){
    _id=id;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": _name,
      "score": _score,
    };
  }
}
