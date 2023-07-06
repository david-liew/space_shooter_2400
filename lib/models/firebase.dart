import 'package:cloud_firestore/cloud_firestore.dart';

import 'account.dart';

class FireBase {
  final db=FirebaseFirestore.instance.collection("account");

  void addAccountByName(String name){
    db.add(Account().toMap(name)).then((DocumentReference doc) => Account().saveID(doc.id));
  }

  //void getAccountByID(Account acc){
  //  db.doc(Account.)
  //}

}