import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_block_chain/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Text("Doctor's Tips",
                style:TextStyle(
                  fontSize: 40,
                  fontFamily: "Monda",
                  color: Color.fromRGBO(1, 77, 94, 1.0)
                ) ,),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                    viewportFraction: 1,
                    height: 300.0),
                items: [
                  "Go slow on antibiotics",
                  "Drink more water",
                  "Cut carbs to keep your weight down",
                  "Find your active self",
                  "Everything in moderation"].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: Text('"$i"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(1, 77, 94, 1.0),
                                  fontSize: 40.0,
                                fontFamily: "Monda"
                              ),
                            ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: (){},
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
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text(
                  "View Medical History"
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


            ],
          ),
        ),
      ),
    );
  }
}
