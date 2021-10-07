import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';
import 'package:wuzzuf_pwd/service/FirebaseJobService.dart';

class ApplicationsService {
  List<String> Applications = [];
  String UserId = "";
  Future<void> getApplications() async {
    UserId = await FirebaseJobService().getUserId();
    try {
      CollectionReference _collectionRef =
          Firestore.instance.collection('applications');

      QuerySnapshot querySnapshot = await _collectionRef.getDocuments();

      querySnapshot.documents.forEach((element) {
        if (element.data['user_id'] == UserId) {
          Applications.add(element.data['job_id']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  bool ApplicationsContains(String id) {
    for (int i = 0; i < Applications.length; i++) {
      if (Applications[i] == id) return true;
    }
    return false;
  }

  List<JobsResult> FilterList(List<JobsResult> list) {
    List<JobsResult> filteredList = [];

    for (int i = 0; i < list.length; i++) {
      if (!ApplicationsContains(list[i].jobId)) {
        filteredList.add(list[i]);
      }
    }
    return filteredList;
  }
}
