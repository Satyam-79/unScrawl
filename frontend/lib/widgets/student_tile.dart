import 'package:flutter/material.dart';

import '../model/models.dart';
import '../theme.dart';
import 'widgets.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({Key? key, required this.userStudent}) : super(key: key);

  final Student userStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: physicalWidth * .17,
      decoration: cardDecoration,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, top: 10, bottom: 10),
            child: ProfileAvatar(
              text: userStudent.name[0],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userStudent.name,
                  softWrap: true,
                  style: title,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
