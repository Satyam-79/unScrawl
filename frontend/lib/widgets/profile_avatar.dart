import 'package:flutter/material.dart';

import '../theme.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Center(
        child: Text(
          text,
          style: title,
        ),
      ),
    );
  }
}
