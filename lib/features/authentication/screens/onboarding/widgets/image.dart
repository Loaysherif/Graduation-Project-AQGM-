import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageStackWidget extends StatelessWidget {
  final String path;

  const ImageStackWidget({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 282,
          height: 281,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/on_boarding_images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipRect(
            child: SizedBox(
          width: 210.37, // Set your desired width for the variable image
          height: 212.46, // Set your desired height for the variable image
          child: Image.asset(
            path,
            fit: BoxFit.contain,
          ),
        )),
      ],
    );
  }
}
