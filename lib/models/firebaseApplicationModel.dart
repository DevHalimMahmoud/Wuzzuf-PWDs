import 'package:flutter/cupertino.dart';

class firebaseApplicationModel {
  String cv_link;
  String job_id;
  String status;
  String user_id;
  firebaseApplicationModel({
    @required this.cv_link,
    @required this.job_id,
    @required this.status,
    @required this.user_id,
  });
  firebaseApplicationModel.fromMap(Map<dynamic, dynamic> data, String id)
      : cv_link = data['cv_link'] ?? '',
        job_id = data['job_id'] ?? '',
        status = data['status'] ?? '',
        user_id = data['user_id'] ?? '';
  Map<String, dynamic> toMap() {
    return {
      "cv_link": cv_link,
      "job_id": job_id,
      "status": status,
      "user_id": user_id,
    };
  }
}
