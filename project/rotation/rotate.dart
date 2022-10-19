import 'rotable_interface.dart';

class Rotate {
  final RotableInterface rotable;

  Rotate(this.rotable);

  void execute() {
    try {
      rotable.setDirection(
          (rotable.getDirection() + rotable.getAngularVelocity()) % rotable.getDirectionsNumber());
    } catch (e) {
      throw UnimplementedError('Movable object position or velocity contains null value');
    }
  }
}
