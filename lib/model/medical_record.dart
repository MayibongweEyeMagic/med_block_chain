
class MedicalRecord {
  final String docName;
  final String clinicalSummary;
  final String diagnoses;
  final String dateOfVisit;
  final String clinicalDetails;

  MedicalRecord(this.docName, this.clinicalSummary, this.diagnoses,
      this.dateOfVisit, this.clinicalDetails);

   MedicalRecord.fromMap(Map<String, dynamic> map)
    :  docName = map['docName'],
       clinicalSummary = map['clinicalSummary'],
       diagnoses = map['diagnoses'],
       dateOfVisit = map['dateOfVisit'],
       clinicalDetails = map['clinicalDetails'];

}