import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
   const RegistrationPage({Key? key}) : super(key: key);
   @override
  State<RegistrationPage> createState() => RegistrationPageState();

  // This widget is the root of your application.
 
}

 class RegistrationPageState extends State<RegistrationPage>{

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
                            decoration:InputDecoration(
                              border: InputBorder.none,
                              hintText: 'username',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
            
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
                 // these is code for  the sign in button 
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
              
                    ],),
            ),
          ),
       ),
       
    );
  }


 }