import 'package:flutter/material.dart';

class Gstate {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};
  static Gstate instance = new Gstate._();
  Gstate._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}
