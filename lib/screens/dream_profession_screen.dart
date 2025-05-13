import 'package:flutter/material.dart';

class DreamProfessionScreen extends StatefulWidget {
  const DreamProfessionScreen({Key? key}) : super(key: key);

  @override
  State<DreamProfessionScreen> createState() => _DreamProfessionScreenState();
}

class _DreamProfessionScreenState extends State<DreamProfessionScreen> {
  final Color darkBlue = const Color(0xFF0A0659);

  String selectedProfession = 'Software Engineer';
  String selectedCompany = 'Apple';

  final List<String> professions = [
    'Software Engineer',
    'Designer',
    'Doctor',
    'Teacher',
    'Data Scientist',
  ];

  final List<String> companies = [
    'Apple',
    'Google',
    'Microsoft',
    'Tesla',
    'Amazon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressBar(),
              const SizedBox(height: 20),

              // Illustration
              Center(
                child: Image.asset(
                  'assets/profession.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),
              Text("Your Dream Profession", style: _titleStyle()),
              const SizedBox(height: 8),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Dropdowns
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I want to be a...  ", style: TextStyle(fontSize: 14)),
                  DropdownButton<String>(
                    value: selectedProfession,
                    onChanged: (value) => setState(() => selectedProfession = value!),
                    items: professions
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                  ),
                  const Text("  at  "),
                  DropdownButton<String>(
                    value: selectedCompany,
                    onChanged: (value) => setState(() => selectedCompany = value!),
                    items: companies
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                  ),
                ],
              ),

              const Spacer(),

              // Continue
              ElevatedButton(
                onPressed: () {
                  // next step (or finish)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Continue", style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
              const SizedBox(height: 12),

              // Back
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0A65D9)),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Back", style: TextStyle(fontSize: 16, color: Color(0xFF0A65D9))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      width: double.infinity,
      height: 6,
      child: Stack(
        children: [
          Container(color: const Color(0xFFF4F4F4)),
          FractionallySizedBox(
            widthFactor: 0.8, // adjust based on step
            child: Container(color: darkBlue),
          ),
        ],
      ),
    );
  }

  TextStyle _titleStyle() {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: darkBlue,
    );
  }
}
