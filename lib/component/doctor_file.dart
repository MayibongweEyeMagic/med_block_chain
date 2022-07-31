

import 'package:flutter/material.dart';
import 'package:med_block_chain/model/medical_record.dart';

class DoctorsCard extends StatelessWidget{
  DoctorsCard({required this.medicalRecord});
  final MedicalRecord medicalRecord;



  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      color: Color.fromARGB(255, 1, 77, 94),
      child: Container(
        width: 340,
        child: Padding(padding: EdgeInsets.all(10.0),

          child: Column(

            children: [
              Center(
                child: Text(
                  medicalRecord.docName,
                  style: const TextStyle(
                    fontFamily: 'Monda',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Date:",
                    style: TextStyle(
                        fontFamily: "Monda",
                        fontSize: 10,
                        color: Color.fromRGBO(255, 255, 255, 1.0)
                    ),),
                  Text(
                    medicalRecord.dateOfVisit,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontFamily: "Monda",
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Clinical Summary:",
                    style: TextStyle(
                        fontFamily: "Monda",
                        fontSize: 10,
                        color: Color.fromRGBO(255, 255, 255, 1.0)
                    ),),
                  Text(
                    medicalRecord.clinicalSummary,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontFamily: "Monda",
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Diagnosis:",
                    style: TextStyle(
                        fontFamily: "Monda",
                        fontSize: 10,
                        color: Color.fromRGBO(255, 255, 255, 1.0)
                    ),),
                  Text(
                    medicalRecord.diagnoses,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontFamily: "Monda",
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Clinical details:",
                    style: TextStyle(
                        fontFamily: "Monda",
                        fontSize: 10,
                        color: Color.fromRGBO(255, 255, 255, 1.0)
                    ),),
                  Text(
                    medicalRecord.clinicalDetails,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontFamily: "Monda",
                      fontSize: 10,
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}