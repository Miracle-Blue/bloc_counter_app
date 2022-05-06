import 'dart:io';

import 'package:flutter/material.dart';

class ButtonHP extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;

  const ButtonHP({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        splashRadius: 24,
        padding: const EdgeInsets.all(5),
        onPressed: onPressed,
        icon: Icon(iconData, size: 30),
      ),
    );
  }
}
