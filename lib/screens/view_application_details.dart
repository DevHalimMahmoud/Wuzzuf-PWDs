import 'package:flutter/material.dart';

class ViewApplication extends StatelessWidget {
  final Map<String, dynamic> job;
  final String status;
  ViewApplication({this.job, this.status});
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              mainRowBuilder(title: 'Organization', details: job['organization']),
              mainRowBuilder(title: 'Address', details: job['address']),
              mainRowBuilder(title: 'Department', details: job['department']),
              mainRowBuilder(title: 'Title', details: job['title']),
              mainRowBuilder(title: 'Desability', details: job['disability']),
              mainRowBuilder(title: 'Description', details: job['description']),
              mainRowBuilder(title: 'Application Status', details: status),
            ],
          ),
        ));
  }

  Widget mainRowBuilder({String title, String details}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title : ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: size.width, child: Text('$details')),
        ],
      ),
    );
  }
}
