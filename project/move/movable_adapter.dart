import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../uObject/uobject_interface.dart';
import 'movable_interface.dart';

class MovableAdapter implements MovableInterface {
  final UObjectInterface o;

  MovableAdapter(this.o);

  @override
  Vector2? getPosition() {
    return o.getProperty('position');
  }

  @override
  void setPosition(Vector2 newV) {
    o.setProperty('position', newV);
  }

  @override
  Vector2? getVelocity() {
    double d = (o.getProperty('direction') as int).toDouble();
    double n = (o.getProperty('directionsNumber') as int).toDouble();
    double v = (o.getProperty('velocity') as int).toDouble();

    return Vector2(v * cos(d / 360 * n), v * sin(d / 360 * n));
  }
}
