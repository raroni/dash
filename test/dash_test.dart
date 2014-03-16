import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'src/html_helper_test.dart' as html_helper_test;
import 'src/pair_cache_test.dart' as pair_cache_test;
import 'src/projection_test.dart' as projection_test;

main() {
  useHtmlEnhancedConfiguration();
  group('HTML helper test', html_helper_test.main);
  group('Pair cache test', pair_cache_test.main);
  group('Projection test', projection_test.main);
}
