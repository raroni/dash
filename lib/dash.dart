library dash;

import 'dart:html' as HTML;
import 'dart:mirrors' as Mirrors;
import 'dart:math' as Math;
import 'dart:collection' as Collection;

part 'src/simulation/entity.dart';
part 'src/simulation/simulation.dart';
part 'src/game.dart';
part 'src/simulation/database.dart';
part 'src/simulation/component.dart';
part 'src/events/event_manager.dart';
part 'src/events/event.dart';
part 'src/simulation/entity_addition.dart';
part 'src/simulation/entity_destruction.dart';
part 'src/simulation/processor.dart';
part 'src/simulation/entity_observer_processor.dart';
part 'src/events/event_subscription_manager.dart';
part 'src/simulation/update.dart';
part 'src/class_id_map.dart';
part 'src/position.dart';
part 'src/color.dart';
part 'src/math/vector4.dart';
part 'src/keyboard.dart';
part 'src/helpers/html_helper.dart';
part 'src/physics/circle_collider.dart';
part 'src/physics/collision_detection.dart';
part 'src/physics/velocity.dart';
part 'src/math/vector.dart';
part 'src/math/vector2.dart';
part 'src/pair_cache.dart';
part 'src/physics/collision.dart';
part 'src/physics/collision_resolution.dart';
part 'src/simulation/entity_processor.dart';
part 'src/physics/movement.dart';
part 'src/geometry/polygon.dart';
part 'src/geometry/line_segment.dart';
part 'src/geometry/point2d.dart';
part 'src/physics/polygon_collider.dart';
part 'src/geometry/polygon/polygon_line_collection.dart';
part 'src/geometry/polygon/polygon_line_collection_iterator.dart';
part 'src/geometry/polygon/polygon_axis_collection.dart';
part 'src/geometry/polygon/polygon_axis_collection_iterator.dart';
part 'src/events/event_subscription.dart';
