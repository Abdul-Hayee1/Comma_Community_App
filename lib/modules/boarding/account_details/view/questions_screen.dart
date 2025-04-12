import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comma_community_app/modules/boarding/auth/view/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({super.key});

  @override
  ConsumerState<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  late final TextEditingController _q1Controller;
  late final TextEditingController _q2Controller;
  late final TextEditingController _q3Controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _q1Controller = TextEditingController();
    _q2Controller = TextEditingController();
    _q3Controller = TextEditingController();
  }

  @override
  void dispose() {
    _q1Controller.dispose();
    _q2Controller.dispose();
    _q3Controller.dispose();
    super.dispose();
  }

  Future<void> _submitAnswers(String uid) async {
    final q1 = _q1Controller.text.trim();
    final q2 = _q2Controller.text.trim();
    final q3 = _q3Controller.text.trim();

    if (q1.isEmpty || q2.isEmpty || q3.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please answer all questions.")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        'questions': {
          'q1': q1,
          'q2': q2,
          'q3': q3,
        },
      });

      if (!mounted) return;
      Navigator.pushNamed(context, "/pendingApproval");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving answers: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider).value;
    final uid = user?.uid;

    if (uid == null) {
      return const Center(child: Text("User not signed in"));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF141821),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 60, left: 16, right: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 5, 35, 60),
                          child: Image(
                            image: AssetImage('assets/logos/app_logo.png'),
                            width: 70,
                            height: 70,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "INVITI",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Questions",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  buildTextField(
                    "You must be one of the following to join Comma: Medical Doctor (Physician), Dentist, Dental Therapist, Dental Hygienist, Nurse, Midwife, Pharmacist, Paramedic, Physician Associate, Physician Assistant, Anaesthetic Assistant or an Allied Health Professional with a Clinical Background (e.g. Physiotherapist, Radiographer). Please provide your PROFESSION",
                    _q1Controller,
                  ),
                  buildTextField(
                    "Please provide your PROFESSIONAL REGISTRATION NUMBER or MEDICAL IDENTIFICATION NUMBER",
                    _q2Controller,
                  ),
                  buildTextField(
                    "Where did you hear about Inviti?",
                    _q3Controller,
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      if (Platform.isIOS)
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, bottom: 7),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 190,
                            height: 40,
                            child: ElevatedButton(
                              onPressed:
                                  _isLoading ? null : () => _submitAnswers(uid),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 70, 78, 185),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2)
                                  : const Text(
                                      "SUBMIT ANSWERS",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    const int maxLength = 500;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          TextField(
            controller: controller,
            maxLines: 3,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: "Enter your answer here...",
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 59, 76, 170),
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[850],
              counterStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
