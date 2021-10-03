package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_843;
         param1["bitmap"] = const_499;
         param1["border"] = const_688;
         param1["border_notify"] = const_1752;
         param1["bubble"] = const_936;
         param1["bubble_pointer_up"] = const_1219;
         param1["bubble_pointer_right"] = const_1328;
         param1["bubble_pointer_down"] = const_1308;
         param1["bubble_pointer_left"] = const_1261;
         param1["button"] = const_494;
         param1["button_thick"] = const_957;
         param1["button_icon"] = const_1869;
         param1["button_group_left"] = const_842;
         param1["button_group_center"] = const_776;
         param1["button_group_right"] = const_804;
         param1["canvas"] = const_764;
         param1["checkbox"] = const_910;
         param1["closebutton"] = const_1138;
         param1["container"] = const_418;
         param1["container_button"] = const_714;
         param1["display_object_wrapper"] = const_993;
         param1["dropmenu"] = const_571;
         param1["dropmenu_item"] = const_530;
         param1["frame"] = const_389;
         param1["frame_notify"] = const_1932;
         param1["header"] = const_712;
         param1["html"] = const_1161;
         param1["icon"] = const_1171;
         param1["itemgrid"] = const_1327;
         param1["itemgrid_horizontal"] = const_537;
         param1["itemgrid_vertical"] = const_757;
         param1["itemlist"] = const_1225;
         param1["itemlist_horizontal"] = const_376;
         param1["itemlist_vertical"] = const_428;
         param1["label"] = const_802;
         param1["maximizebox"] = const_1718;
         param1["menu"] = const_1960;
         param1["menu_item"] = const_1661;
         param1["submenu"] = const_1200;
         param1["minimizebox"] = const_1832;
         param1["notify"] = const_1658;
         param1["null"] = const_982;
         param1["password"] = const_980;
         param1["radiobutton"] = const_728;
         param1["region"] = const_469;
         param1["restorebox"] = const_1804;
         param1["scaler"] = const_542;
         param1["scaler_horizontal"] = const_1819;
         param1["scaler_vertical"] = const_1929;
         param1["scrollbar_horizontal"] = const_607;
         param1["scrollbar_vertical"] = const_986;
         param1["scrollbar_slider_button_up"] = const_1320;
         param1["scrollbar_slider_button_down"] = const_1305;
         param1["scrollbar_slider_button_left"] = const_1326;
         param1["scrollbar_slider_button_right"] = const_1336;
         param1["scrollbar_slider_bar_horizontal"] = const_1131;
         param1["scrollbar_slider_bar_vertical"] = const_1358;
         param1["scrollbar_slider_track_horizontal"] = const_1344;
         param1["scrollbar_slider_track_vertical"] = const_1155;
         param1["scrollable_itemlist"] = const_1697;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1183;
         param1["selector"] = const_698;
         param1["selector_list"] = const_958;
         param1["submenu"] = const_1200;
         param1["tab_button"] = const_790;
         param1["tab_container_button"] = const_1252;
         param1["tab_context"] = const_439;
         param1["tab_content"] = const_1133;
         param1["tab_selector"] = const_734;
         param1["text"] = const_918;
         param1["input"] = const_933;
         param1["toolbar"] = const_1764;
         param1["tooltip"] = const_441;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
