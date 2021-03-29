import 'dart:math';
import 'dart:ui';

mixin ColorGenerator {
  /// return dart:ui Color
  Color generateNewColor() {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  /// return true if color is dark
  /// return false if color ain't dark
  bool isColorDark(Color color) {
    if (color.red < 127 || color.green < 127 || color.blue < 127) {
      return true;
    } else
      return false;
  }
}
