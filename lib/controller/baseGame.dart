abstract class BaseGame {
  void onOff();
  void reset();
  void start(Function cb);
  void rotate();
  void left();
  void right();
  void up();
  void down();
  void pause();
  void sound();
  List<List<int>> getGameSquares();
  List<List<int>> getNextSquares();
  num getScore();
}
