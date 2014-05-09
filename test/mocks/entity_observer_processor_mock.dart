part of mocks;

class EntityObserverProcessorMock<MatchType> extends Dash.EntityObserverProcessor {
  List<Dash.Entity> Xentities = new List<Dash.Entity>();
  
  bool match(Dash.Entity entity) {
    return entity.has(MatchType);
  }
  
  void onAddition(Dash.Entity entity) {
    
  }
  
  void onRemoval(Dash.Entity entity) {
    
  }
}
