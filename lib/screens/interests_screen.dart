import 'package:flutter/material.dart';
import '../widgets/interest_chip.dart';
import 'dream_profession_screen.dart';
import 'package:catalift_app/utils/navigation.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = List.generate(
    24,
        (index) => index == 5 || index == 17 ? 'sit amet' : 'Lorem ipsum',
  );

  final Set<int> selectedIndexes = {0, 3, 7, 10, 12, 15, 19, 23};
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color darkBlue = const Color(0xFF0A0659);
    final String query = searchController.text.toLowerCase();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              _buildProgressBar(darkBlue),

              const SizedBox(height: 30),
              Text("Your Interests", style: _titleStyle(darkBlue)),
              const SizedBox(height: 8),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 24),
              _buildSearchField(),

              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(interests.length, (index) {
                      final String interest = interests[index];

                      if (query.isNotEmpty && !interest.toLowerCase().contains(query)) {
                        return const SizedBox.shrink();
                      }

                      return InterestChip(
                        label: interest,
                        isSelected: selectedIndexes.contains(index),
                        onTap: () {
                          setState(() {
                            if (selectedIndexes.contains(index)) {
                              selectedIndexes.remove(index);
                            } else {
                              selectedIndexes.add(index);
                            }
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              _buildContinueButton(darkBlue),
              const SizedBox(height: 12),
              _buildBackButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(Color color) {
    return SizedBox(
      width: double.infinity,
      height: 6,
      child: Stack(
        children: [
          Container(color: const Color(0xFFF4F4F4)),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(color: color),
          ),
        ],
      ),
    );
  }

  TextStyle _titleStyle(Color color) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.blueAccent),
        prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
  }

  Widget _buildContinueButton(Color color) {
    return ElevatedButton(
      onPressed: () {
        navigateTo(context, const DreamProfessionScreen());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Continue", style: TextStyle(fontSize: 16,color: Colors.white)),
    );
  }

  Widget _buildBackButton() {
    return OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF0A65D9)),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Back", style: TextStyle(fontSize: 16, color: Color(0xFF0A65D9))),
    );
  }
}
