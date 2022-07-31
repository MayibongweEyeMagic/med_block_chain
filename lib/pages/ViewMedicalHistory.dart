import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_block_chain/component/doctor_file.dart';
import 'package:med_block_chain/model/api_service.dart';
import 'package:med_block_chain/model/medical_record.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ViewMedicalHistory extends StatefulWidget {
  const ViewMedicalHistory({Key? key}) : super(key: key);

  @override
  State<ViewMedicalHistory> createState() => _ViewMedicalHistoryState();
}

class _ViewMedicalHistoryState extends State<ViewMedicalHistory> {

  ApiService apiService =ApiService();

  @override
  void initState() {
    super.initState();
    apiService =ModalRoute.of(context)?.settings.arguments as ApiService;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  Center(
                      child: SfLinearGauge(
                        ranges: [
                          //Applies linear gradient. The start and end values are 0 to 100 by default
                          LinearGaugeRange(
                              startWidth: 20,
                              endWidth: 20,
                              shaderCallback: (bounds) => const LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [Color.fromRGBO(1, 77, 94, 1), Color.fromRGBO(
                                      255, 247, 214, 1.0)])
                                  .createShader(bounds))
                        ],
                      ),
                ),

                 const SizedBox(height: 60,),

                  Container(
                    height: 430,
                    width: 340,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 1, 77, 94),
                        borderRadius: BorderRadius.circular(18.0)),
                    child: FutureBuilder(
                      future: apiService.fetchUsers(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return Container(
                            color: const Color.fromARGB(255, 1, 77, 94),
                            child: const LinearProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          );
                        } else {
                          if (snapshot.hasError) {
                            return Container(
                              color: const Color.fromARGB(255, 1, 77, 94),
                              child: Center(
                                child: Text(
                                  'Something went wrong, try again.',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(itemBuilder: (context, index) {
                              return Padding(padding: EdgeInsets.all(8.0),
                                // child: DoctorsCard(medicalRecord: MedicalRecord.fromMap(snapshot.data[index]),),
                              );
                            });
                          }
                        }
                      },
                    ),

                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ElevatedButton(
                  onPressed: (){

                  },
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
                  child: const Text(
                    "Done"
                    ,style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Monda"
                  ),
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
