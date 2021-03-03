import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mtlu_brew_crew/models/brew.dart';

class DatabaseService {
  // collection reference

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  final String uid;

  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // brew list from snapshots
  List<Brew> _brewListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      return Brew(
          name: doc.data()['name'] ?? '',
          sugars: doc.data()['sugars'],
          strength: doc.data()['strength'] ?? 0);
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }
}
