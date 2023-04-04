import 'dart:math' as math;

class Util {
  static final _random = math.Random();

  /// Generates a positive random integer uniformly distributed on the range
  /// from [min], inclusive, to [max], exclusive.
  static int nextInt(int min, int max) => min + _random.nextInt(max - min);

  static double nextDouble(double min, double max) => min + _random.nextDouble() * (max - min);
}
