import 'package:fluent_ui/fluent_ui.dart';

class ColorParser {
  static Color fromName(String? colorName) {
    switch (colorName?.toLowerCase()) {
      case 'white': return Colors.white;
      case 'yellow': return Colors.yellow;
      case 'green': return Colors.green;
      case 'blue': return Colors.blue;
      case 'red': return Colors.red;
      case 'black': return Colors.black;
      default: return Colors.grey; 
    }
  }
}