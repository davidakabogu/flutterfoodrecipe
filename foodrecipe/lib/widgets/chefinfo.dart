import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 6.0),
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
                          const Icon(Icons.location_on,
                              color: Color(0xFFE23E3E)),
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
        backgroundColor: _isFollowing ? Colors.green : const Color(0xFFE23E3E),
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
