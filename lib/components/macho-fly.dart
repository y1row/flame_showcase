import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flame_showcase/games/main_game.dart';

import 'fly.dart';

class MachoFly extends Fly {
  MachoFly(MainGame game, double x, double y) : super(game) {
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
  }
}
