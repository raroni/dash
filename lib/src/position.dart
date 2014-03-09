part of dash;

class Position extends Component {
  Point2D vector = new Point2D.zero();
  
  set x (x) => vector[0] = x;
  set y (y) => vector[1] = y;
  num get x => vector[0];
  num get y => vector[1];
}
