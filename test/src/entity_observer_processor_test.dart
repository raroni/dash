library entity_observer_processor_test;

import 'package:unittest/unittest.dart';
import 'package:dash/dash.dart';
import '../mocks.dart';

main() {
  test("aspect change", () {
    var eventManager = new EventManager();
    var database = new Database(eventManager);
    
    var processor = new EntityObserverProcessorMock<AspectMock2>();
    processor.eventManager = eventManager;
    processor.initialize();
    
    var entity = database.createEntity();
    entity.createAspect(AspectMock1);
    database.update();
    expect(processor.entities, []);
    
    entity.createAspect(AspectMock2);
    database.update();
    expect(processor.entities, [entity]);
  });
}
