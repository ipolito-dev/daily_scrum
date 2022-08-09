import 'package:flutter/material.dart';

class ElegantDropdownItem<T> {
  final String label;
  final Widget? iconChild;
  final T value;

  ElegantDropdownItem({
    required this.label,
    this.iconChild,
    required this.value,
  });
}
