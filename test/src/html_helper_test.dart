library html_helper_test;

import 'package:unittest/unittest.dart';
import 'package:dash/dash.dart';

main() {
  test(".formatsAsRGBA", () {
    var color = new Color(0.5, 0.5, 1, 0.25);
    var result = HTMLHelper.formatAsRGBA(color);
    expect(result, equals("rgba(128, 128, 255, 0.25)"));
  });
}
