import 'movable_interface.dart';

class Move {
  final MovableInterface movable;

  Move(this.movable);

  void execute() {
    try {
      movable.setPosition(movable.getPosition()!..add(movable.getVelocity()!));
    } catch (e) {
      throw UnimplementedError('Movable object position or velocity contains null value');
    }
  }
}
