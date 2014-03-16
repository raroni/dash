library projection_test;

import 'package:unittest/unittest.dart';
import 'package:dash/dash.dart';

main() {
  test("#getOverlap", () {
    var projection1 = new Projection(2, 5);
    var projection2 = new Projection(1, 3);
    var overlap = projection1.getOverlap(projection2);
    expect(overlap, equals(-1));
    overlap = projection2.getOverlap(projection1);
    expect(overlap, equals(1));
    
    projection1 = new Projection(3, 8);
    projection2 = new Projection(2, 5);
    overlap = projection1.getOverlap(projection2);
    expect(overlap, equals(-2));
    overlap = projection2.getOverlap(projection1);
    expect(overlap, equals(2));
    
    projection1 = new Projection(-4, 0);
    projection2 = new Projection(-5, -2);
    overlap = projection1.getOverlap(projection2);
    expect(overlap, equals(-2));
    overlap = projection2.getOverlap(projection1);
    expect(overlap, equals(2));
  });
  
  test("#include", () {
    var projection1 = new Projection(2, 5);
    var projection2 = new Projection(8, 10);
    var result = projection1.include(projection2);
    expect(result, isFalse);
    result = projection2.include(projection1);
    expect(result, isFalse);
    
    projection1 = new Projection(10, 20);
    projection2 = new Projection(12, 14);
    result = projection1.include(projection2);
    expect(result, isTrue);
    result = projection2.include(projection1);
    expect(result, isFalse);
    
    projection1 = new Projection(-3, 25);
    projection2 = new Projection(22, 30);
    result = projection1.include(projection2);
    expect(result, isFalse);
    result = projection2.include(projection1);
    expect(result, isFalse);
  });
}
