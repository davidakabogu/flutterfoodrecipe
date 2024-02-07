import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection(
      {super.key, required this.ingredients, required this.ingredientWeights});

  final List<String> ingredients;
  final List<String> ingredientWeights;

  // Map each ingredient to its corresponding image asset
  static Map<String, String> ingredientImages = {
    'Bread': 'assets/images/🍜.png',
    'Eggs': 'assets/images/🍣.png',
    'Milk': 'assets/images/🍜.png',
    // Add more mappings for other ingredients as needed
    'Ham': 'assets/images/🍣.png',
    'Cake': 'assets/images/🍜.png',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingredients',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 30),
              ),
              Text('${ingredients.length} items',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.grey))
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              final weight = ingredientWeights[index];
              final ingredientImage = ingredientImages[ingredient];

              return FadeIn(
                // Delay each item's animation
                delay: Duration(milliseconds: index * 100),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ingredientImage != null
                                    ? Image.asset(
                                        ingredientImage,
                                        width: 70,
                                        height: 70,
                                      )
                                    : const Icon(Icons.image),
                              ),
                            ),
                            Text(ingredient,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600, fontSize: 22)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(weight,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class FadeIn extends StatefulWidget {
  const FadeIn({super.key, required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Adjust animation duration
      // Adjust reverse animation duration
      reverseDuration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Adjust animation curve
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}