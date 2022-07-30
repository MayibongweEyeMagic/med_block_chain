import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScanPage extends StatefulWidget {
  @override
  State<QrScanPage> createState() => _QrScanPageState();

}

class _QrScanPageState extends State<QrScanPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),

              SvgPicture.asset(
                'assets/caduceus-medical-symbol.svg',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 20,),
              const Text("Grant Access",
                  style:TextStyle(
                      color: Color.fromARGB(255, 1, 77, 94),
                      fontFamily: 'Monda',
                      // fontWeight: FontWeight.bold,
                      fontSize: 15
                  )
              ),
              const SizedBox(height: 20,),
               Card(

                elevation: 0,
                color: Color.fromARGB(255, 1, 77, 94),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                          ),

                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Doctor\'s name',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('Dr Isaia Rashad',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text('License No: ', style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('25641165', style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// child: Card(
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// const ListTile(
// leading: Icon(Icons.album),
// title: Text('The Enchanted Nightingale'),
// subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: <Widget>[
// TextButton(
// child: const Text('BUY TICKETS'),
// onPressed: () {/* ... */},
// ),
// const SizedBox(width: 8),
// TextButton(
// child: const Text('LISTEN'),
// onPressed: () {/* ... */},
// ),
// const SizedBox(width: 8),
// ],
// ),
// ],
// ),
// ),
// );
