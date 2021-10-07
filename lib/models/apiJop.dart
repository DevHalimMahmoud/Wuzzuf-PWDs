class Welcome {
  Welcome({
    this.searchMetadata,
    this.searchParameters,
    this.jobsResults,
    this.chips,
  });

  SearchMetadata searchMetadata;
  SearchParameters searchParameters;
  List<JobsResult> jobsResults;
  List<Chip> chips;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        searchMetadata: json["search_metadata"] == null
            ? null
            : SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters: json["search_parameters"] == null
            ? null
            : SearchParameters.fromJson(json["search_parameters"]),
        jobsResults: json["jobs_results"] == null
            ? null
            : List<JobsResult>.from(
                json["jobs_results"].map((x) => JobsResult.fromJson(x))),
        chips: json["chips"] == null
            ? null
            : List<Chip>.from(json["chips"].map((x) => Chip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata":
            searchMetadata == null ? null : searchMetadata.toJson(),
        "search_parameters":
            searchParameters == null ? null : searchParameters.toJson(),
        "jobs_results": jobsResults == null
            ? null
            : List<dynamic>.from(jobsResults.map((x) => x.toJson())),
        "chips": chips == null
            ? null
            : List<dynamic>.from(chips.map((x) => x.toJson())),
      };
}

class Chip {
  Chip({
    this.type,
    this.param,
    this.options,
  });

  String type;
  String param;
  List<Option> options;

  factory Chip.fromJson(Map<String, dynamic> json) => Chip(
        type: json["type"] == null ? null : json["type"],
        param: json["param"] == null ? null : json["param"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "param": param == null ? null : param,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.text,
    this.value,
  });

  String text;
  String value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"] == null ? null : json["text"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "value": value == null ? null : value,
      };
}

class JobsResult {
  JobsResult({
    this.title,
    this.companyName,
    this.location,
    this.via,
    this.description,
    this.thumbnail,
    this.extensions,
    this.detectedExtensions,
    this.jobId,
  });

  String title;
  String companyName;
  String location;
  String via;
  String description;
  String thumbnail;
  List<String> extensions;
  DetectedExtensions detectedExtensions;
  String jobId;

  factory JobsResult.fromJson(Map<String, dynamic> json) => JobsResult(
        title: json["title"] == null ? null : json["title"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        location: json["location"] == null ? null : json["location"],
        via: json["via"] == null ? null : json["via"],
        description: json["description"] == null ? null : json["description"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        extensions: json["extensions"] == null
            ? null
            : List<String>.from(json["extensions"].map((x) => x)),
        detectedExtensions: json["detected_extensions"] == null
            ? null
            : DetectedExtensions.fromJson(json["detected_extensions"]),
        jobId: json["job_id"] == null ? null : json["job_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "company_name": companyName == null ? null : companyName,
        "location": location == null ? null : location,
        "via": via == null ? null : via,
        "description": description == null ? null : description,
        "thumbnail": thumbnail == null ? null : thumbnail,
        "extensions": extensions == null
            ? null
            : List<dynamic>.from(extensions.map((x) => x)),
        "detected_extensions":
            detectedExtensions == null ? null : detectedExtensions.toJson(),
        "job_id": jobId == null ? null : jobId,
      };
}

class DetectedExtensions {
  DetectedExtensions({
    this.postedAt,
    this.scheduleType,
  });

  String postedAt;
  ScheduleType scheduleType;

  factory DetectedExtensions.fromJson(Map<String, dynamic> json) =>
      DetectedExtensions(
        postedAt: json["posted_at"] == null ? null : json["posted_at"],
        scheduleType: json["schedule_type"] == null
            ? null
            : scheduleTypeValues.map[json["schedule_type"]],
      );

  Map<String, dynamic> toJson() => {
        "posted_at": postedAt == null ? null : postedAt,
        "schedule_type": scheduleType == null
            ? null
            : scheduleTypeValues.reverse[scheduleType],
      };
}

enum ScheduleType { FULL_TIME }

final scheduleTypeValues = EnumValues({"Full-time": ScheduleType.FULL_TIME});

class SearchMetadata {
  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleJobsUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  String id;
  String status;
  String jsonEndpoint;
  String createdAt;
  String processedAt;
  String googleJobsUrl;
  String rawHtmlFile;
  double totalTimeTaken;

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        jsonEndpoint:
            json["json_endpoint"] == null ? null : json["json_endpoint"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        processedAt: json["processed_at"] == null ? null : json["processed_at"],
        googleJobsUrl:
            json["google_jobs_url"] == null ? null : json["google_jobs_url"],
        rawHtmlFile:
            json["raw_html_file"] == null ? null : json["raw_html_file"],
        totalTimeTaken: json["total_time_taken"] == null
            ? null
            : json["total_time_taken"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "json_endpoint": jsonEndpoint == null ? null : jsonEndpoint,
        "created_at": createdAt == null ? null : createdAt,
        "processed_at": processedAt == null ? null : processedAt,
        "google_jobs_url": googleJobsUrl == null ? null : googleJobsUrl,
        "raw_html_file": rawHtmlFile == null ? null : rawHtmlFile,
        "total_time_taken": totalTimeTaken == null ? null : totalTimeTaken,
      };
}

class SearchParameters {
  SearchParameters({
    this.q,
    this.engine,
    this.googleDomain,
    this.hl,
  });

  String q;
  String engine;
  String googleDomain;
  String hl;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters(
        q: json["q"] == null ? null : json["q"],
        engine: json["engine"] == null ? null : json["engine"],
        googleDomain:
            json["google_domain"] == null ? null : json["google_domain"],
        hl: json["hl"] == null ? null : json["hl"],
      );

  Map<String, dynamic> toJson() => {
        "q": q == null ? null : q,
        "engine": engine == null ? null : engine,
        "google_domain": googleDomain == null ? null : googleDomain,
        "hl": hl == null ? null : hl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
