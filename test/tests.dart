import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math.dart';
import '../project/move/movable_adapter.dart';
import '../project/move/move.dart';
import '../project/rotation/rotable_adapter.dart';
import '../project/rotation/rotate.dart';
import '../project/uObject/uobject.dart';

class UObjectTest extends Mock implements UObject {}

class MovableAdapterTest extends Mock implements MovableAdapter {}

class RotableAdapterTest extends Mock implements RotableAdapter {}

@GenerateMocks([UObjectTest, MovableAdapterTest])
void main() {
  late MovableAdapterTest movableAdapterTest;
  late RotableAdapterTest rotableAdapterTest;

  setUpAll(() {
    movableAdapterTest = MovableAdapterTest();
    rotableAdapterTest = RotableAdapterTest();
  });

  group('position tests', () {
    test('position + velocity -> updated position', () {
      when(movableAdapterTest.getPosition()).thenAnswer((realInvocation) => Vector2(12, 5));
      when(movableAdapterTest.getVelocity()).thenAnswer((realInvocation) => Vector2(-7, 3));
      Move(movableAdapterTest).execute();
      verify(movableAdapterTest.getPosition() == Vector2(5, 8));
    });

    test('move with null position -> error', () {
      reset(movableAdapterTest);
      when(movableAdapterTest.getVelocity()).thenAnswer((realInvocation) => Vector2(-7, 3));
      expect(() => Move(movableAdapterTest)..execute(), throwsA(isA<UnimplementedError>()));
    });

    test('move with null velocity -> error', () {
      reset(movableAdapterTest);
      when(movableAdapterTest.getPosition()).thenAnswer((realInvocation) => Vector2(12, 5));
      expect(() => Move(movableAdapterTest)..execute(), throwsA(isA<UnimplementedError>()));
    });

    test('set position with null position and null velocity -> error', () {
      reset(movableAdapterTest);
      expect(() => Move(movableAdapterTest)..execute(), throwsA(isA<UnimplementedError>()));
    });
  });

  group('rotation tests', () {
    test('rotate with null properties -> error', () {
      reset(rotableAdapterTest);
      expect(() => Rotate(rotableAdapterTest)..execute(), throwsA(isA<UnimplementedError>()));
    });
  });
}
