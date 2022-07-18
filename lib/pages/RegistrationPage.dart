import 'package:flutter/material.dart';
import 'package:med_block_chain/database/connectDB.dart';
import 'package:med_block_chain/pages/login_page.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:med_block_chain/model/patient.dart';
import 'package:crypt/crypt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => RegistrationPageState();

  // This widget is the root of your application.
 
}

class RegistrationPageState extends State<RegistrationPage>{
  bool _isObscure = true;
  bool _userValidate =false;
  bool _emailValidate =false;
  bool _passValidate =false;

  String _errorMessage ='';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        try {
          final Patient patient = ModalRoute.of(context)!.settings.arguments as Patient;
          usernameController.text = patient.username;
          emailController.text = patient.email;
          passwordController.text = patient.password;
        }catch(e)
        {
          print(e);
        }

      });
    });
  }
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
       body: SafeArea(
         
        // SafeArea is an important and useful widget in Flutter which makes UI dynamic and adaptive 
        //to a wide variety of devices. While designing the layout of widgets,
        // we consider different types of devices and their pre-occupied
          child: Center(
            child:SingleChildScrollView (
              child: Column( 
                   mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                    //code for the username textfield 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: usernameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Username',
                              errorText: _userValidate ? 'Username can\'t be empty' : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
            
                    //code for the email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              errorText: _emailValidate ? 'Email can\'t be empty' : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // code for the Password textfield
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: _isObscure,
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              errorText: _passValidate ? 'Password can\'t be empty' : null,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    _isObscure ? Icons.visibility_off : Icons.visibility,
                                  ),
                              )
                            ),
                          ),

                        ),

                      ),
                    ),
                  FlutterPwValidator(
                      controller: passwordController,
                      minLength: 6,
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      width: 300 ,
                      height: 100,
                      onSuccess: () {},
                      onFail: () {},
                  ),
                  const SizedBox(height: 10),
                 // these is code for  the sign in button 
                 ElevatedButton(
                   // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   onPressed: () {
                     checkUsernameVal(usernameController.text);
                     checkEmailValidity(emailController.text);
                     checkPasswordVal(passwordController.text);
                     register();
                   },
                   child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                      ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ),
                      ),
                    ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_errorMessage, style: const TextStyle(color: Colors.red),),
                  ),
                ],
              ),
            ),
          ),
       ),

    );
  }
  void insertUser() async {
    // final patient = Patient(
    //   id: m.ObjectId(),
    //   username: usernameController.text,
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
    // await DBConnection.insert(patient);
  }

  void checkUsernameVal(String username) async {
    if (username.isEmpty)
    {
      setState(() {
        username.isEmpty ? _userValidate = true : _userValidate = false;
      });
    }
    // check if it already exists in the database
    else
    {
      setState(() {_userValidate = false;});

    }
  }

  void checkEmailValidity(String email) async {
     if (email.isEmpty) {
       setState(() {
         email.isEmpty ? _emailValidate = true : _emailValidate = false;
       });

     }
     else {
       setState(() {_emailValidate = false;});
       if(!EmailValidator.validate(email, true))
       {
         setState(() {_errorMessage ='Email is invalid';});
       }
       //check if it already exists in the database
       else
       {
         setState(() {_errorMessage ='';});
       }
     }
  }

  void checkPasswordVal(String password) async {
    if (password.isEmpty)
    {
      setState(() {
        password.isEmpty ? _passValidate = true : _passValidate = false;
      });
    }
    else{
      setState(() {
         _passValidate = false;
      });
    //  hashing the password
      if(password.length <6) {
        setState(() {_errorMessage ='Password is not correct';});
      }
    }
  }

  void register() async{
    if (_userValidate == false &&
        _emailValidate == false &&
        _passValidate ==false && _errorMessage.isEmpty) {

      final String password =Crypt.sha256(passwordController.text).toString();

      final patient = Patient(
        id: m.ObjectId(),
        username: usernameController.text,
        email: emailController.text,
        password: password,
      );
      await DBConnection.insert(patient);
      setState(()
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      });


    }

  }

}