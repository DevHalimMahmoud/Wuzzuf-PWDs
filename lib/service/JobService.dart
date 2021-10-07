import 'package:dio/dio.dart';
import 'package:wuzzuf_pwd/models/apiJop.dart';

class JobService {
  String baseUrl =
      "https://serpapi.com/search.json?engine=google_jobs&q=freelancing&hl=en&api_key=5728845b0826a2285acab91c14d4838068ef5a8ba4ee5f0eca21d760aa99deba";

  String pwdsJops =
      "https://serpapi.com/search.json?engine=google_jobs&q=jobs&start=1&hl=en&api_key=5728845b0826a2285acab91c14d4838068ef5a8ba4ee5f0eca21d760aa99deba";

  String Recomended =
      "https://serpapi.com/search.json?engine=google_jobs&q=pwd&hl=en&api_key=5728845b0826a2285acab91c14d4838068ef5a8ba4ee5f0eca21d760aa99deba";

  List<JobsResult> Joblist = [];
  List<JobsResult> JoblistRecom = [];
  List<JobsResult> Pwds = [];
  Future<List<JobsResult>> getJob() async {
    try {
      Response response = await Dio().get('$baseUrl');
      var data = response.data;
      Joblist = Welcome.fromJson(data).jobsResults;
    } catch (e) {
      print(e);
    }
    List<JobsResult> l = await getpwdsJobs();
    if (l != null) {
      Joblist.addAll(l);
    }
    return Joblist;
  }

  Future<List<JobsResult>> getJobRecom() async {
    try {
      Response response = await Dio().get('$Recomended');
      var data = response.data;
      JoblistRecom = Welcome.fromJson(data).jobsResults;
      print("++++++++++++++++++  ${JoblistRecom.length}");
    } catch (e) {
      print(e);
    }

    return JoblistRecom;
  }

  Future<List<JobsResult>> getpwdsJobs() async {
    try {
      Response response = await Dio().get('$pwdsJops');
      var data = response.data;
      Pwds = Welcome.fromJson(data).jobsResults;
    } catch (e) {
      print(e);
    }

    return Pwds;
  }
}
