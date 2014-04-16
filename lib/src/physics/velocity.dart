part of dash;

class Velocity extends Component {
  Vector2 vector = new Vector2.zero();
  num limit = 1;
  
  void reset() {
    vector.reset();
  }
}
