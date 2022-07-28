import 'package:mongo_dart/mongo_dart.dart' show Db;

import '../model/login_state.dart';
import '../model/patient.dart';



class DBConnection {
  static var db, userCollection;

  static connect() async {
    db = await Db.create(
        "mongodb+srv://siba:blockchain@cluster0.c6dii.mongodb.net/mydatabase");
    await db.open();
    userCollection = db.collection("registration");
  }

  static insert(Patient patient) async {
    await userCollection.insertAll([patient.toMap()]);
  }

  static login(Login login) async{
    var u  = await userCollection.findOne({'email': login.email});

    return u;
  }

  static findEmail(Patient patient) async {
    return await userCollection.findOne({'email': patient.email});
  }



}