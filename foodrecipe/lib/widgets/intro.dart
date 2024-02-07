import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToSection extends StatelessWidget {
  const HowToSection({super.key, required this.meal});

  final String meal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('How to make $meal',
            style:
                GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600)),
      ),
    ]);
  }
}
