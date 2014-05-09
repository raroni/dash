library database_test;

import 'package:unittest/unittest.dart';
import 'package:dash/dash.dart';
import '../mocks.dart';

main() {
  test("change event", () {
    var eventManager = new EventManager();
    
    var events = [];
    eventManager.subscribe(EntityAddition, (EntityAddition e) => events.add("add-${e.entity.id}"));
    eventManager.subscribe(EntityChange, (EntityChange e) => events.add("change-${e.entity.id}"));
    
    var database = new Database(eventManager);
    
    var entity = database.createEntity();
    entity.createAspect(AspectMock1);
    
    database.update();
    
    entity.createAspect(AspectMock2);
    
    database.update();
    
    expect(events, ["add-${entity.id}", "change-${entity.id}"]);
  });
}
