import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('Report');

class Database {
  static Future<void> addItem({
    required String Name,
    required String applyfor,
    required String birthday,
    required String Parent,
    required String Address,
    required String Email,
    required String city,
    required String country,
    required String phoneNumber,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc() ;

    Map<String, dynamic> data = <String, dynamic>{
      "Name": Name,
      "applyfor": applyfor,
      "birthday": birthday,
      "Parent": Parent,
      "Address": Address,
      "Email": Email,
      "city": city,
      "country": country,
      "phoneNumber": phoneNumber,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Report item added to the database"))
        .catchError((e) => print(e));
  }
  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
    _mainCollection;

    return notesItemCollection.snapshots();
  }

}
