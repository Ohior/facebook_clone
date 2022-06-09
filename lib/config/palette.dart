import 'package:flutter/material.dart';

class Palette{
  static const Color scaffold = Color(0xFFF0f2F5);
  static const Color facebookBlue = Color(0xFF1777F2);
  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF4964A1), Color(0xFFCE4881)]
  );
  static const Color online = Color(0xFF00FF19);
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26]
  );
}