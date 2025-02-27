import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF141821),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, left: 16, right: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 24,
                      child: Icon(
                        Icons.copyright,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "COMMA",
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
                  "You must be one of the following to join Comma: Medical Doctor (Physician), Dentist, Dental Therapist, Dental Hygienist, Nurse, Midwife, Pharmacist, Paramedic, Physician Associate, Physician Assistant, Anaesthetic Assistant or an Allied Health Professional with a Clinical Background (e.g. Physiotherapist, Radiographer). Please provide your PROFESSION"),
              buildTextField(
                  "Please provide your PROFESSIONAL REGISTRATION NUMBER or MEDICAL IDENTIFICATION NUMBER"),
              buildTextField("Where did you hear about Comma?"),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                          onPressed: () {
                            Navigator.pushNamed(context, "/pendingApproval");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: const Text(
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
      ),
    );
  }

  Widget buildTextField(String label) {
    final TextEditingController controller = TextEditingController();
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
            ),
          ),
          const SizedBox(height: 7),
          TextField(
            controller: controller,
            maxLines: 3,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: "Enter your answer here",
              hintStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[850],
              counterText: "$maxLength",
              counterStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
