import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  final String photoUrl;
  final double radius;

  const ContactAvatar({super.key, required this.photoUrl, this.radius = 60});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          photoUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) =>
                  Image.asset('assets/images/google-contacts.png'),
        ),
      ),
    );
  }
}
