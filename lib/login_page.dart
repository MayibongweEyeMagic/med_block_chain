// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:med_block_chain/RegistrationPage.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key}) : super(key: key);
   @override
  State<LoginPage> createState() => LoginPageState();

  // This widget is the root of your application.
 
}

 class LoginPageState extends State<LoginPage>{

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
       body: SafeArea(
         
        // SafeArea is an important and useful widget in Flutter which makes UI dynamic and adaptive 
        //to a wide variety of devices. While designing the layout of widgets,
        // we consider different types of devices and their pre-occupied
          child: Center(
            child: SingleChildScrollView(
              child: Column( 
                   mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(height: 25),
                  //welcome back text
                  // ignore: prefer_const_constructors
                  Text(
            
                    "Welcome Back",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 52
                        )
                    ),
                    SizedBox(height: 20),
            
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
                            
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                            obscureText: true,
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                 // these is code for the sign in button 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                      ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ),
                      ),
                    ),
                   ),
                 ), 
                 SizedBox(height: 25),
            
                 // code for Register text
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   // ignore: prefer_const_literals_to_create_immutables
                   children: <Widget>[
                     Text(' dont have an account?',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                     GestureDetector(
                       child: Text( ' Register now',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                        onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));

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

