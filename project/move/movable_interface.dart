import 'package:vector_math/vector_math.dart';

abstract class MovableInterface {
  Vector2? getPosition();

  Vector2? getVelocity();

  void setPosition(Vector2 newV);
}
