
class Login {

  final String email;
  final String password;

  const Login({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  Login.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        password = map['password'];

}