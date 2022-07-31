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


  void popUpDialog(String jsonString) async {

  }

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
              const Text("Providing...",
                  style:TextStyle(
                      color: Color.fromARGB(255, 1, 77, 94),
                      fontFamily: 'Monda',
                      // fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
              const SizedBox(height: 20,),
               Card(
                 margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                 elevation: 0, 
                 shape: RoundedRectangleBorder(
                 side: BorderSide(
                   color: Theme.of(context).colorScheme.outline,
                 ),
                 borderRadius: const BorderRadius.all(Radius.circular(12)),
               ),
                color: Color.fromARGB(255, 1, 77, 94),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: SvgPicture.asset(
                                    'assets/caduceus-medical-symbol.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(

                                  children: const [
                                    Text(
                                        "Doctor's name:",
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                    ),),
                                    Text(
                                        "Lorem Ipsum",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    ),),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                        "Licence's No.:",
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                    ),),
                                    Text(
                                        "Lorem Ipsum",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    ),),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                     Text(
                                        "Practice No.: ",
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                    ),),
                                    Text(
                                        "Lorem Ipsum",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    ),),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                        "Location:",
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                    ),
                                    ),
                                    Text(
                                        "Lorem Ipsum",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    ),),

                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: () => showSimpleDialog(context),
                                style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 194, 249, 255), //background color of button
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5) //content padding inside button
                          ),
                                  child: const Text(
                                      "View Profile",
                                    style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 1, 77, 94)
                                    ),
                                  )
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const Text("......with access to your medical record?",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                        color: Color.fromARGB(255, 1, 77, 94),
                        fontFamily: 'Monda',
                        // fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                ),
              ),
              const SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                              "Reject",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Monda"
                          ),),
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 1, 77, 94), //background color of button
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5) //content padding inside button
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                              "Accept",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Monda"
                          ),),
                        ),
                      ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 1, 77, 94), //background color of button
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5) //content padding inside button
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  void showSimpleDialog(BuildContext context) {

    var URL = "https://cdn.edhub.ama-assn.org/ama/content_public/multimedia/imi200012audioa_thumb.jpeg?Expires=2147483647&Signature=DdLijKQL14ku87eLF3hS8ilg4~q12MmmKvRQq798cyilca0Oq2rP2q1bBJVeZrHgErKn6hGUI1vK5Y7JYZdpI48TLtveKo2q1I2z-bs6cF6C4riYh-~4pDFAQw72bmuoNjqynHOUJDULKrON8pOO5iNv-6GkCLatPJzR5Sf5YESCgWyrzFfy2tU2G3pPB950Op3CKZ0pInNTRfNA4Hm5aEjFFUvH1aRenYza75mw7EZiRDuLUDDvZANXg0HB-WKXXLtR5z6nIhGCjZqIroRLBXjAXJzO9~aKTGudTvSN8sbK~5a3v~dcF4WrFsy6daiMG3u2fW-p4q2piFLMRkYFww__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA";
    var URL_board = "https://els-jbs-prod-cdn.jbs.elsevierhealth.com/cms/attachment/374d77b3-6311-43d5-b822-f48b85ec4997/fx1_lrg.jpg";
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ) ,
        backgroundColor: Color.fromARGB(255, 1, 77, 94),
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 500,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: SvgPicture.asset(
                                'assets/caduceus-medical-symbol.svg',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: const [
                                Text(
                                  "Doctor's name:",
                                  style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                  ),),
                                Text(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: "Monda",
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Licence's No.:",
                                  style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                  ),),
                                Text(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: "Monda",
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Practice No.: ",
                                  style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                  ),),
                                Text(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: "Monda",
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Location:",
                                  style: TextStyle(
                                      fontFamily: "Monda",
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1.0)
                                  ),
                                ),
                                Text(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: "Monda",
                                    fontSize: 10,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),),

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Licence:",
                          style: TextStyle(
                            fontFamily: "Monda",
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                        Image.network(
                          URL,
                          height: 200,
                          width: 200,)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Board:",
                          style: TextStyle(
                              fontFamily: "Monda",
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                        Image.network(
                          URL_board,
                          height: 200,
                          width: 200,)
                      ],
                    )
                  ],
                ),
            ),
          )
        ],
      )
  );
  }


}
