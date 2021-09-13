import '../controller/tetris.dart';

enum EGameName {
  Tetris,
  Snake,
}

class Config {
  var gameInstance;
  Config(EGameName gameName) {
    switch (gameName) {
      case EGameName.Tetris:
        this.gameInstance = new Tetris();
        break;
      case EGameName.Snake:
    }
  }

  rotate() {
    this.gameInstance.rotate();
  }
}
