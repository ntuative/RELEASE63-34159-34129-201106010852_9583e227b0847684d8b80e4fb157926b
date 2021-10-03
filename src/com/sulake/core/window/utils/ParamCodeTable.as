package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_182;
         param1["bound_to_parent_rect"] = const_100;
         param1["child_window"] = const_1296;
         param1["embedded_controller"] = const_1298;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_921;
         param1["mouse_dragging_target"] = const_248;
         param1["mouse_dragging_trigger"] = const_424;
         param1["mouse_scaling_target"] = const_307;
         param1["mouse_scaling_trigger"] = const_497;
         param1["horizontal_mouse_scaling_trigger"] = const_291;
         param1["vertical_mouse_scaling_trigger"] = const_264;
         param1["observe_parent_input_events"] = const_1168;
         param1["optimize_region_to_layout_size"] = const_606;
         param1["parent_window"] = const_1231;
         param1["relative_horizontal_scale_center"] = const_216;
         param1["relative_horizontal_scale_fixed"] = const_148;
         param1["relative_horizontal_scale_move"] = const_407;
         param1["relative_horizontal_scale_strech"] = const_380;
         param1["relative_scale_center"] = const_1318;
         param1["relative_scale_fixed"] = const_800;
         param1["relative_scale_move"] = const_1306;
         param1["relative_scale_strech"] = const_1160;
         param1["relative_vertical_scale_center"] = const_205;
         param1["relative_vertical_scale_fixed"] = const_144;
         param1["relative_vertical_scale_move"] = const_241;
         param1["relative_vertical_scale_strech"] = const_349;
         param1["on_resize_align_left"] = const_850;
         param1["on_resize_align_right"] = const_484;
         param1["on_resize_align_center"] = const_568;
         param1["on_resize_align_top"] = const_799;
         param1["on_resize_align_bottom"] = const_514;
         param1["on_resize_align_middle"] = const_483;
         param1["on_accommodate_align_left"] = const_1148;
         param1["on_accommodate_align_right"] = const_470;
         param1["on_accommodate_align_center"] = const_845;
         param1["on_accommodate_align_top"] = const_1240;
         param1["on_accommodate_align_bottom"] = const_512;
         param1["on_accommodate_align_middle"] = const_788;
         param1["route_input_events_to_parent"] = const_565;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1215;
         param1["scalable_with_mouse"] = const_1187;
         param1["reflect_horizontal_resize_to_parent"] = const_587;
         param1["reflect_vertical_resize_to_parent"] = const_572;
         param1["reflect_resize_to_parent"] = const_334;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1267;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
