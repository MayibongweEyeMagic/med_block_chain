// import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_block_chain/database/connectDB.dart';
import 'package:med_block_chain/pages/login_page.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'package:med_block_chain/model/patient.dart';
// import 'package:crypt/crypt.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';



// import '../model/login_state.dart';

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
  bool _pcValidate =false;

  String _errorMessage ='';
  String _errorPass ='';


  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passConfirmController.dispose();
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
        }catch(e) {
          print(e);
        }

      });
    });
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
            child:SingleChildScrollView (
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                    SvgPicture.asset(
                      'assets/caduceus-medical-symbol.svg',
                      width: 60,
                      height: 70,
                    ),
                    const SizedBox(height: 10),

                    const Text("Med Chain", style:TextStyle(
                        color: Color.fromARGB(255, 1, 77, 94),
                        fontFamily: 'Monda',
                        // fontWeight: FontWeight.bold,
                        fontSize: 38
                    )
                    ),
                    const SizedBox(height: 2),
                    const Text('Registration',
                        style:TextStyle(
                            color: Color.fromARGB(255, 1, 77, 94),
                            fontFamily: 'Monda',
                            // fontWeight: FontWeight.bold,
                            fontSize: 25
                        )
                    ),
                    //code for the username textfield
                  const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color.fromARGB(255, 1, 77, 94)),
                          borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 38),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color.fromARGB(255, 1, 77, 94)),
                          borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 38),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color.fromARGB(255, 1, 77, 94)),
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

                  const SizedBox(height: 10),
                  // code for the Password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color.fromARGB(255, 1, 77, 94)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: passConfirmController,
                          obscureText: _isObscure,
                          decoration:InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Confirm Password',
                              errorText: _pcValidate ? _errorPass : null,

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
                  SizedBox(
                    width: 358,
                    child: ElevatedButton(
                      // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      onPressed: () {
                        checkUsernameVal(usernameController.text);
                        checkEmailValidity(emailController.text);
                        checkPasswordVal(passwordController.text);
                        checkConfirmPassword(passwordController.text, passConfirmController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 1, 77, 94), //background color of button
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.all(18) //content padding inside button
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
       //check if it already exists in the databas
       else {
         setState(() {_errorMessage ='';});
       }

     }
  }

  void checkPasswordVal(String password) async {
    if (password.isEmpty)
    {
      setState(() {
        _passValidate = true;
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

  void checkConfirmPassword(String password, String cpassword) async {
    if (cpassword.isEmpty) {
      setState(() {
        _pcValidate =true;
        _errorPass ='Field can\'t be empty';
      });
    }
    else {
      setState(() {_pcValidate =false;});

      if (password != cpassword) {
        setState(() {
          _pcValidate =true;
          _errorPass ='Passwords don\'t match';
        });
      }
      else {
        setState(() {_pcValidate =false;});
        register();
      }
    }
  }

  void register() async {
    // final String password =Crypt.sha256(passwordController.text).toString();

    final patient = Patient(id: m.ObjectId(),
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,);

    var findEmail = await DBConnection.findEmail(patient);

    if (findEmail != null) {
      setState(() {_errorMessage = 'Email already exist';});
    }
    else {
      setState(() {_errorMessage = '';});

      if (_userValidate == false &&
          _emailValidate == false &&
          _passValidate ==false && _errorMessage.isEmpty){

        showDialog(context: context,
          builder: (ctx) =>  AlertDialog(
            title: const Text('Successful!'),
            content: OTPTextField(
              length: 5,
              width: MediaQuery.of(ctx).size.width,
              fieldWidth: 50,
              style: const TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async {
                // await DBConnection.insert(patient);
                setState(() {
                  Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                });
              },
            ),
          ),
        );
      }
    }
  }

}