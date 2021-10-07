import 'package:flutter/cupertino.dart';

class firebaseJobModel {
  String Id;
  String address;
  String department;
  String description;
  String disability;
  String organization;
  String title;
  firebaseJobModel({
    @required this.Id,
    @required this.address,
    @required this.department,
    @required this.description,
    @required this.disability,
    @required this.organization,
    @required this.title,
  });
  firebaseJobModel.fromMap(Map<dynamic, dynamic> data)
      : Id = data['id'] ?? '',
        address = data['address'] ?? '',
        department = data['department'] ?? '',
        description = data['description'] ?? '',
        disability = data['disability'] ?? '',
        organization = data['organization'] ?? '',
        title = data['title'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "id": Id,
      "address": address,
      "department": department,
      "description": description,
      "disability": disability,
      "organization": organization,
      "title": title,
    };
  }
}
