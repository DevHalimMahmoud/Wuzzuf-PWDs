import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wuzzuf_pwd/screens/view_application_details.dart';

class Applications extends StatefulWidget {
  const Applications({Key key}) : super(key: key);

  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  void initState() {
    super.initState();
    getUserid();
  }

  bool ready = false;
  String userid;
  getUserid() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    userid = user.uid;
    ready = true;
    setState(() {});
  }

  var jobsReady = false;
  Map jobtemplet = {};
  var jobscount;
  getJobData(var jobid, var ind) async {
    var templet =
        await Firestore.instance.collection('job').document(jobid).get();
    jobtemplet[ind] = templet.data;
    if (jobtemplet.length == jobscount) {
      jobsReady = true;
      setState(() {});
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Applications'),),
        body: ready
            ? applicationsStreamBuilder()
            : const Center(child: CircularProgressIndicator()));
  }

  StreamBuilder<QuerySnapshot> applicationsStreamBuilder() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('applications')
            .where('user_id', isEqualTo: userid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('you have no applications'));
          }
          if (jobscount != snapshot.data.documents.length) {
            jobsReady = false;
            jobscount = snapshot.data.documents.length;
            jobtemplet.clear();
          }
          if (jobsReady == false) {
            for (int i = 0; i < jobscount; i++) {
              var jobid = snapshot.data.documents[i]['job_id'];
              getJobData(jobid, i);
            }
          }

          return jobsReady
              ? jobsListViewBuilder(snapshot)
              : const Center(child: CircularProgressIndicator());
        });
  }

  ListView jobsListViewBuilder(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index) {
          return applicationCard(
              job: jobtemplet[index],
              status: snapshot.data.documents[index]['status']);
        });
  }

  Widget applicationCard({var job, String status}) {
    String organization = job['organization'];
    String title = job['title'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: const Icon(Icons.business),
          title: Text(organization),
          subtitle: Text(title),
          trailing: Text('status: $status'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewApplication(
                        job: job,
                        status: status,
                      )),
            );
          },
        ),
      ),
    );
  }
}
