import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prak_tpm_api/models/job.dart';

class JobService {
  static const String baseUrl = 'https://joblyst-api-2zuyaoa73q-uc.a.run.app/v1/jobs';
  static Future<List<Job>> fetchJobs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl'));
      final body = response.body;
      final result = jsonDecode(body);
      List<Job> jobs = List<Job>.from(
        result['jobs'].take(100).map((job) => Job.fromJson(job)),
      );
      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
