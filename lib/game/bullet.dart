import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'enemy.dart';

class Bullet extends SpriteComponent with CollisionCallbacks {
  final double _speed = 450;

  Vector2 direction = Vector2(0, -1);

  final int level;

  Bullet({
    required Sprite? sprite,
    required Vector2? position,
    required Vector2? size,
    required this.level,
  }) : super(sprite: sprite, position: position, size: size);

  @override
  void onMount() {
    super.onMount();

    final shape = CircleHitbox.relative(
      0.4,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Enemy) {
      removeFromParent();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += direction * _speed * dt;

    // If bullet crosses the upper boundary of screen
    // mark it to be removed it from the game world.
    if (position.y < 0) {
      removeFromParent();
    }
  }
}
