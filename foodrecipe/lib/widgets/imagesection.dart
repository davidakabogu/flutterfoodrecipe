import 'package:flutter/material.dart';

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
