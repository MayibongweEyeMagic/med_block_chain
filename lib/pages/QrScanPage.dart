import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScanPage extends StatefulWidget {

  final String HashCode;

  const QrScanPage({required this.HashCode});


  @override
  State<QrScanPage> createState() => _QrScanPageState();

}

class _QrScanPageState extends State<QrScanPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
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
                    "Let your doctor scan your QR code",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Monda",
                        color: Color.fromRGBO(1, 77, 94, 1)
                    ),),
                  SizedBox(
                    height: 30,
                  ),
                  QrImage(
                    foregroundColor: Color.fromRGBO(1, 77, 94, 1),
                    data: widget.HashCode,
                    version: QrVersions.auto,
                    size: 400.0,

                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text(
                    "Done"
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
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
