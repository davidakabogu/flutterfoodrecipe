import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToSection extends StatelessWidget {
  const HowToSection({super.key, required this.meal});

  final String meal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 6.0),
        child: Text('How to make $meal',
            style: GoogleFonts.poppins(
                fontSize: 30.2, fontWeight: FontWeight.w600)),
      ),
    ]);
  }
}
