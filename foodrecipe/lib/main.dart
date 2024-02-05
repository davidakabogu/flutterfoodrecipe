import 'package:flutter/material.dart';

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
              HowToSection(description: "How to Make french toast"),
              ImageSection(image: 'assets/images/image-13.png'),
              ChefInfoSection(
                name: 'Roberta Anny',
                location: 'Bali Indonesia',
                image: 'assets/images/unsplash_Ij24Uq1sMwM.png',
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
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _showPopup(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              _showPopup(context);
            },
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(description, style: const TextStyle(fontSize: 40)),
      ]),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
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
  double _favoriteRating = 4.5;
  int _favoriteCount = 300;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteRating -= 0.1;
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteRating += 0.1;
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon: (_isFavorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
          color: Colors.yellow[700],
          // alignment: Alignment.bottomLeft,
        ),
        SizedBox(
          width: 26,
          child: SizedBox(
              child: Text(
            '$_favoriteRating',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(
          width: 128,
          child: Text('($_favoriteCount Reviews)',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey)),
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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        location,
                        style: const TextStyle(color: Colors.grey),
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
        backgroundColor: _isFollowing ? Colors.green : Colors.red,
      ),
      child: Text(
        _isFollowing ? 'Following' : 'Follow',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
