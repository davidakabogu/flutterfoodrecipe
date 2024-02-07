import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ButtonSection(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              HowToSection(description: "How to make french toast"),
              ImageSection(
                image: 'assets/images/image-13.png',
                overlayImage: 'assets/images/Play-button.png',
              ),
              ChefInfoSection(
                name: 'Roberta Anny',
                location: 'Bali, Indonesia',
                image: 'assets/images/unsplash_Ij24Uq1sMwM.png',
              ),
              IngredientsSection(
                ingredients: ['Bread', 'Eggs', 'Milk', 'Ham', 'Cake'],
                ingredientWeights: ['200g', '200g', '200g', '300g', '400g'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Button Clicked!'),
          content: const Text('You have clicked the button.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                _showPopup(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                _showPopup(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HowToSection extends StatelessWidget {
  const HowToSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(description,
            style:
                GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600)),
      ),
    ]);
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection(
      {super.key, required this.image, required this.overlayImage});

  final String image;
  final String overlayImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                image,
                width: 400,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                overlayImage,
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
        const FavoriteWidget()
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  final String _favoriteRating = '4,5';
  final int _favoriteCount = 300;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
          child: IconButton(
            onPressed: _toggleFavorite,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.yellow[700],
          ),
        ),
        SizedBox(
          width: 32,
          child: SizedBox(
              child: Text(
            _favoriteRating,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
        ),
        SizedBox(
          width: 128,
          child: Text('($_favoriteCount Reviews)',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 17)),
        ),
      ],
    );
  }
}

class ChefInfoSection extends StatelessWidget {
  const ChefInfoSection(
      {super.key,
      required this.name,
      required this.location,
      required this.image});

  final String name;
  final String location;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),
                          Text(
                            location,
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
          const FollowButton()
        ],
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleFollow,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(16, 45),
        backgroundColor: _isFollowing ? Colors.green : Colors.red,
        shape: RoundedRectangleBorder(
          // Adjust this value to change the button's roundness
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
      child: Text(
        _isFollowing ? 'Following' : 'Follow',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
      ),
    );
  }
}

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
