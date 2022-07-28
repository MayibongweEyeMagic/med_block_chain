import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  State<ForgotPasswordPage> createState() => ForgotPassState();

// This widget is the root of your application.

}


class ForgotPassState extends State<ForgotPasswordPage> {
  bool _emailValidate =false;
  TextEditingController emailController = TextEditingController();
  String errorMessage ='';
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  void resettingEmail(String email) async {

    if (email.isEmpty){
      setState(() {
        _emailValidate = true;
        errorMessage = 'Please enter email address';
      });
    }
    else
    {
      setState(() {_emailValidate = false;});
      if (!EmailValidator.validate(email, true)){
        setState(() {_emailValidate = true;
        errorMessage = 'Email is Invalid';
        });
      }
      //const Text('Password reset instructions have been sent to your email')
      else {
        setState(() {_emailValidate = false;});
        // Send the email to the typed email address.
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
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            // actions: [
            //   TextButton(
            //     onPressed: () {},
            //     child: Container(
            //       padding: const EdgeInsets.all(14),
            //       child: const Text("Ok", style: TextStyle(color: Colors.blue),
            //         ),
            //       ),
            //   ),
            // ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16));

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const SizedBox(height: 8,),
            SizedBox(
              width: 400,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Enter your email Address',
                  errorText: _emailValidate ? errorMessage : null,
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              height: 50,
              width: 400,
              child: ElevatedButton(style: style,
                  onPressed: () {
                    resettingEmail(emailController.text);
                  }, child: const Text("Reset password")),
            )
          ],
        ),
      ),
    );
  }

}
