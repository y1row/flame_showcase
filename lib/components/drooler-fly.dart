import 'package:flame/sprite.dart';
import 'package:flame_showcase/games/main_game.dart';

import 'fly.dart';

class DroolerFly extends Fly {
  DroolerFly(MainGame game, double x, double y) : super(game, x, y) {
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}
