import 'package:mongo_dart/mongo_dart.dart';

class Patient{

  final ObjectId id;
  final String username;
  final String email;
  final String password;

  const Patient({required this.id, required this.username,
    required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  Patient.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        username = map['username'],
        email = map['email'],
        password = map['password'];

}