#define Get
/// @description Get(array_or_ds, ...indexes)
/// @param array_or_ds
/// @param ...indexes
{
var result = argument[0];
for (var i = 1; i < argument_count; ++i) {
  var k = argument[i];
  if (is_array(k)) {
    if (array_length_1d(k) > 0) {
      var k0, k1;
      if (k[0] == global.g_Pos_tag) {
        k0 = k[1];
        k1 = k[2];
        ds_stack_push(global.g_Pos_pool, k);
      } else show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      if (is_array(result)) {
        if (k0 < 0) k0 += array_height_2d(result);
        if (k1 < 0) k1 += array_length_2d(result, k0);
        result = result[k0, k1];
      } else {
        if (k0 < 0) k0 += ds_grid_width(result);
        if (k1 < 0) k1 += ds_grid_height(result);
        result = result[#k0, k1];
      }
    } else {
      if (is_array(result)) {
        show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      } else switch (k) {
        case stack_top: result = ds_stack_top(result); break;
        case queue_head: result = ds_queue_head(result); break;
        case pq_min: result = ds_priority_find_min(result); break;
        case pq_max: result = ds_priority_find_max(result); break;
        default: show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      }
    }
  } else if (is_string(k)) {
    result = result[?k];
  } else {
    if (is_array(result)) {
      if (k < 0) k += array_length_1d(result);
      result = result[k];
    } else {
      if (k < 0) k += ds_list_size(result);
      result = result[|k];
    }
  }
}
return result;
}

#define Set
/// @description Set(array_or_ds, ...indexes, value)
/// @param array_or_ds
/// @param ...indexes
/// @param value
{
var target = argument[0];
var i, k, k0, k1;
var n = argument_count - 2;
for (i = 1; i < n; ++i) {
  k = argument[i];
  if (is_array(k)) {
    if (array_length_1d(k) > 0) {
      if (k[0] == global.g_Pos_tag) {
        k0 = k[1];
        k1 = k[2];
        ds_stack_push(global.g_Pos_pool, k);
      } else show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      if (is_array(target)) {
        if (k0 < 0) k0 += array_height_2d(target);
        if (k1 < 0) k1 += array_length_2d(target, k0);
        target = target[k0, k1];
      } else {
        if (k0 < 0) k0 += ds_grid_width(target);
        if (k1 < 0) k1 += ds_grid_height(target);
        target = target[#k0, k1];
      }
    } else {
      if (is_array(target)) {
        show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      } else switch (k) {
        case stack_top: target = ds_stack_top(target); break;
        case queue_head: target = ds_queue_head(target); break;
        case pq_min: target = ds_priority_find_min(target); break;
        case pq_max: target = ds_priority_find_max(target); break;
        default: show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
      }
    }
  } else if (is_string(k)) {
    target = target[?k];
  } else {
    if (is_array(target)) {
      if (k < 0) k += array_length_1d(target);
      target = target[k];
    } else {
      if (k < 0) k += ds_list_size(target);
      target = target[|k];
    }
  }
}
var new_value = argument[n + 1];
k = argument[n];
if (is_array(k)) {
  if (array_length_1d(k) > 0) {
    if (k[0] == global.g_Pos_tag) {
      k0 = k[1];
      k1 = k[2];
      ds_stack_push(global.g_Pos_pool, k);
    } else show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
    if (is_array(target)) {
      if (k0 < 0) k0 += array_height_2d(target);
      if (k1 < 0) k1 += array_length_2d(target, k0);
      target[@k0, k1] = new_value;
    } else {
      if (k0 < 0) k0 += ds_grid_width(target);
      if (k1 < 0) k1 += ds_grid_height(target);
      target[#k0, k1] = new_value;
    }
  } else {
    if (is_array(target)) {
      show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
    } else switch (k) {
      case stack_top: ds_stack_pop(target); ds_stack_push(target, new_value); break;
      case queue_head: show_error("Cannot set head of queue.", true); break;
      case pq_min: show_error("Cannot set minimum of priority queue.", true); break;
      case pq_max: show_error("Cannot set maximum of priority queue.", true); break;
      default: show_error("Invalid index `" + string(k) + "` [" + string(i) + "]", 1);
    }
  }
} else if (is_string(k)) {
  target[?k] = new_value;
} else {
  if (is_array(target)) {
    if (k < 0) k += array_length_1d(target);
    target[@k] = new_value;
  } else {
    if (k < 0) k += ds_list_size(target);
    target[|k] = new_value;
  }
}
return new_value;
}

#define Pos
/// @description Pos(x, y)
/// @param x
/// @param y
gml_pragma("global", @'{
stack_top = [];
queue_head = [];
pq_min = [];
pq_max = [];
global.g_Pos_tag = [];
global.g_Pos_pool = ds_stack_create()
}');
{
// VD: Once 2.2 is out, can pop and check if it's undefined
// As for now, https://bugs.yoyogames.com/view.php?id=29747
if (ds_stack_empty(global.g_Pos_pool)) return [global.g_Pos_tag, argument0, argument1];
var r = ds_stack_pop(global.g_Pos_pool);
r[@1] = argument0;
r[@2] = argument1;
return r;
}

