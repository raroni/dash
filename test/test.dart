import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'src/html_helper_test.dart' as HTMLHelperTest;
import 'src/projection_test.dart' as ProjectionTest;

main() {
  useHtmlEnhancedConfiguration();
  group('HTML helper test', HTMLHelperTest.main);
  group('Projection test', ProjectionTest.main);
}
