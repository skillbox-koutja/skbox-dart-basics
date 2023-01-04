import 'dart:math';

class Point {
  final int x;
  final int y;
  final int z;

  Point({required this.x, required this.y, required this.z});

  factory Point.origin() {
    return Point(x: 0, y: 0, z: 0);
  }

  factory Point.unit() {
    return Point(x: 1, y: 1, z: 1);
  }

  Distance distanceTo(Point another) {
    return Distance.betweenPoints(this, another);
  }
}

class Distance {
  final double value;

  Distance(this.value);

  factory Distance.betweenPoints(Point p1, Point p2) {
    var x = p2.x - p1.x;
    var y = p2.y - p1.y;
    var z = p2.z - p1.z;
    var value = sqrt(x * x + y * y + z * z);

    return Distance(value);
  }
}
