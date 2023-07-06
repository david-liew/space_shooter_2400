import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Account with HiveObjectMixin{
  @HiveField(0)
  late final String _id;
  late final String _name;
  late int _score=0;

  var db=FirebaseFirestore.instance;
  

  Map<String,dynamic> toMap(String name){
    return{
      "name":name,
      "score":_score,
    };
  }

  void saveID(String id){
    _id=id;
    save();
  }

  //String readID(){

  //}
}