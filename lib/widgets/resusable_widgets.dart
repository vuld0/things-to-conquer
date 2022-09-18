import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}
