class Job {
  String city;
  String jobLevelSpecific;
  String jobLevel;
  String industry;
  String workTime;
  String rangeSalary;
  String country;
  String office;
  String jobCategory;
  String salary;
  List<String> qualifications;
  String jobPosition;
  String officeLogo;

  Job({
    required this.city,
    required this.jobLevelSpecific,
    required this.jobLevel,
    required this.industry,
    required this.workTime,
    required this.rangeSalary,
    required this.country,
    required this.office,
    required this.jobCategory,
    required this.salary,
    required this.qualifications,
    required this.jobPosition,
    required this.officeLogo,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    var qualificationsJson = json['qualifications'];
    List<String> qualifications;
    if (qualificationsJson is List) {
      qualifications = qualificationsJson.cast<String>();
    } else if (qualificationsJson is String) {
      qualifications = [qualificationsJson];
    } else {
      qualifications = [];
    }

    return Job(
      city: json['city'],
      jobLevelSpecific: json['jobLevelSpecific'],
      jobLevel: json['jobLevel'],
      industry: json['industry'],
      workTime: json['workTime'],
      rangeSalary: json['rangeSalary'],
      country: json['country'],
      office: json['office'],
      jobCategory: json['jobCategory'],
      salary: json['salary'],
      qualifications: qualifications,
      jobPosition: json['jobPosition'],
      officeLogo: json['officeLogo'],
    );
  }
}
