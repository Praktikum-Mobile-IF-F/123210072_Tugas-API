import 'package:flutter/material.dart';
import 'package:prak_tpm_api/models/job.dart';
import 'package:go_router/go_router.dart';
import 'package:prak_tpm_api/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  final Job job;

  const DetailPage({
    super.key,
    required this.job,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('loggedInUserData');
    context.goNamed("signin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.job.officeLogo,
                    width: 200,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.job.jobPosition,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.job.office,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.job.salary,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
            Text(
              '${widget.job.city}, ${widget.job.country}',
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Qualifications',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                widget.job.qualifications.length,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '${index + 1}. ${widget.job.qualifications[index]}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Jobs Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'JOB LEVEL',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.job.jobLevel,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'JOB CATEGORY',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.job.jobCategory,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'INDUSTRY',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Text(
              widget.job.industry,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


