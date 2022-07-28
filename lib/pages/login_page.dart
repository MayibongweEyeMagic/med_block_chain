// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_block_chain/database/connectDB.dart';
import 'package:med_block_chain/pages/RegistrationPage.dart';
import 'package:med_block_chain/pages/forgot_password.dart';

import '../model/login_state.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key}) : super(key: key);
   @override
  State<LoginPage> createState() => LoginPageState();

  // This widget is the root of your application.
 
}

 class LoginPageState extends State<LoginPage>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _emailValidate =false;
  bool _passValidate =false;

  bool _isObscure =true;

  String _errorMessage = '';


  @override
  void dispose() {

    super.dispose();
    emailController.dispose();
  }

  @override
  void initState() {
    super.initState();
    try{
      final Login login =ModalRoute.of(context)!.settings.arguments as Login;
      emailController.text = login.email;
      passwordController.text =login.password;
    } catch(e)
    {
      print(e);
    }
  }

  void checkEmailField(String email) {
    if (email.isEmpty) {
      setState(() {
        email.isEmpty ? _emailValidate = true : _emailValidate = false;
      });
    }else {
      setState(() {
        _emailValidate = false;
      });
    }
  }

  void checkPassField(String password) {
    if (password.isEmpty)
    {
      setState(() {
        password.isEmpty ? _passValidate = true : _passValidate = false;
      });
    }else {
      setState(() {
        _passValidate = false;
      });
    }
  }

  void login() async{
    final login =Login(email: emailController.text, password: passwordController.text);

    var object = await DBConnection.login(login);

    if (object == null && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {_errorMessage ='Account with that email does not exist';});
    }
    else {

      if (object['password'] != passwordController.text) {
        setState(() {_errorMessage ='Incorrect credentials';});
      }
      else {
        setState(() {
          _errorMessage ='Successfully logged in';
          emailController.clear();
          passwordController.clear();
        });
      }
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(
         
        // SafeArea is an important and useful widget in Flutter which makes UI dynamic and adaptive 
        //to a wide variety of devices. While designing the layout of widgets,
        // we consider different types of devices and their pre-occupied
          child: Center(
            child: SingleChildScrollView(
              child: Column( 
                   mainAxisAlignment: MainAxisAlignment.center,

                children: [
                 SvgPicture.asset(
                      'assets/caduceus-medical-symbol.svg',
                      width: 60,
                      height: 70,
                 ),
                  SizedBox(height: 10),
                  Text("Med Chain", style:TextStyle(
                        color: Color.fromARGB(255, 1, 77, 94),
                        fontFamily: 'Monda',
                        // fontWeight: FontWeight.bold,
                        fontSize: 38
                        )
                  ),
                  SizedBox(height: 10),
                  Text("Medic file on the go",
                      style:TextStyle(
                      color: Color.fromARGB(255, 1, 77, 94),
                      fontFamily: 'Monda',
                      // fontWeight: FontWeight.bold,
                      fontSize: 25
                  )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_errorMessage, style: const TextStyle(color: Colors.red),),
                  ),
                    SizedBox(height: 16),
                  //code for the email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color.fromARGB(255, 1, 77, 94)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: emailController,
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              errorText: _emailValidate ? 'Email can\'t be empty' : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    // code for the Password textfield
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color.fromARGB(255, 1, 77, 94)),
                          borderRadius: BorderRadius.circular(20),
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
                                  setState(() {_isObscure = !_isObscure;});
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
                  SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right:0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                          },
                          child: Text('Forgot password?',
                            style: const TextStyle(
                              fontFamily: 'Monda',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50),

                 SizedBox(
                   width: 331,
                   child:  ElevatedButton(
                       onPressed: () {
                         checkEmailField(emailController.text);
                         checkPassField(passwordController.text);
                         login();
                       },
                       style: ElevatedButton.styleFrom(
                           primary: Color.fromARGB(255, 1, 77, 94), //background color of button
                           elevation: 3, //elevation of button
                           shape: RoundedRectangleBorder( //to set border radius to button
                               borderRadius: BorderRadius.circular(20)
                           ),
                           padding: EdgeInsets.all(18) //content padding inside button
                       ),
                       child: Center(
                         child: Text(
                           "Sign In",
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                           ),
                         ),
                       ),
                     ),

                 ),
                 SizedBox(height: 50),
            
                 // code for Register text
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   // ignore: prefer_const_literals_to_create_immutables
                   children: <Widget>[
                     Text(' Don\'t have an account?',style: TextStyle(fontWeight: FontWeight.bold,),),
                     GestureDetector(
                       child: Text( ' Register now',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,),),
                        onTap: (){
                            setState(() {
                              _errorMessage =''; _emailValidate = false; _passValidate = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegistrationPage()));
                        },
                     ),
                   ],
                 ),
              //mainAxisAlignment: MainAxisAlignment.center,
              
                    ],),
            ),
          ),
       ),
       
    );
  }


 }

