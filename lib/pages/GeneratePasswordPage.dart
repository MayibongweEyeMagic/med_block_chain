import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneratePasswordPage extends StatefulWidget {
  const GeneratePasswordPage({Key? key}) : super(key: key);

  @override
  State<GeneratePasswordPage> createState() => _GeneratePasswordPageState();
}

class _GeneratePasswordPageState extends State<GeneratePasswordPage> {
  String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/caduceus-medical-symbol.svg",
                  width: 50,
                  height: 50,

                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Specify accessibility duration",
                style: TextStyle(
                    fontFamily: "Monda",
                    fontSize: 20,
                    color: Color.fromRGBO(1, 77, 94, 1)
                ),),
              DropdownButton(
                hint: Text(
                  "Choose..."
                ),

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 500,
              ),
              ElevatedButton(
                onPressed: (){

                  var key = utf8.encode("foo");
                  var bytes = utf8.encode("foobar");
                  var hmacSha256 = Hmac(sha256, key);
                  var digest = hmacSha256.convert(bytes);
                  var hashcode = "$digest";
                },
                child: Text(
                  "Generate Password"
                  ,style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Monda"
                ),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(352, 60)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(1, 77, 94, 1)

                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


