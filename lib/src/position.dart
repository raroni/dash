part of dash;

class Position extends Component {
  Vector2 vector = new Vector2();
  
  set x (x) => vector[0] = x;
  set y (y) => vector[1] = y;
  num get x => vector[0];
  num get y => vector[1];
}
