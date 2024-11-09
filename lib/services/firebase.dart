import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future addUserDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(userInfoMap);
  }

  Future<double?> getUserBmiInfo(String userId) async {
    final docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (docSnapshot.exists) {
      return docSnapshot.data()?['bmi'] as double?;
    }
    return null;
  }
}
