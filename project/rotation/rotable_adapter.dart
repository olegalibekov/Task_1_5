import '../uObject/uobject_interface.dart';
import 'rotable_interface.dart';

class RotableAdapter implements RotableInterface {
  final UObjectInterface uObject;

  RotableAdapter(this.uObject);

  int get d => (uObject.getProperty('direction') as int);

  int get a => (uObject.getProperty('alpha') as int);

  int get n => (uObject.getProperty('directionsNumber') as int);

  @override
  int getDirection() {
    return (d + d * a) % n;
  }

  @override
  int getAngularVelocity() {
    return d * a;
  }

  @override
  int getDirectionsNumber() {
    return n;
  }

  @override
  void setDirection(int newV) {
    return uObject.setProperty('direction', newV);
  }
}
