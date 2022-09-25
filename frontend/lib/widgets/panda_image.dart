import 'package:flutter/material.dart';

import '../theme.dart';

class PandaImage extends StatelessWidget {
  const PandaImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/panda.png',
      height: physicalHeight * .026,
      width: physicalWidth * .14,
    );
  }
}
