import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'src/html_helper_test.dart' as HTMLHelperTest;
import 'src/projection_test.dart' as ProjectionTest;
import 'src/entity_observer_processor_test.dart' as EntityObserverProcessorTest;
import 'src/database_test.dart' as DatabaseTest;

main() {
  useHtmlEnhancedConfiguration();
  group('HTML helper test', HTMLHelperTest.main);
  group('Projection test', ProjectionTest.main);
  group('Entity observer processor test', EntityObserverProcessorTest.main);
  group('Database test', DatabaseTest.main);
}
