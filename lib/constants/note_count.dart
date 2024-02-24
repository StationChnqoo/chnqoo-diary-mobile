import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteCount {
  String name;
  String value;
  IconData icon;

  NoteCount({required this.name, required this.value, required this.icon});

  static List<NoteCount> loadNoteCounts() {
    return [
      NoteCount(name: '创作', value: '12篇', icon: Icons.emoji_nature_outlined),
      NoteCount(name: '活跃', value: '1234天', icon: Icons.insights),
      NoteCount(name: '相册', value: '123张', icon: Icons.now_wallpaper_outlined),
    ];
  }
}
