package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_695:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2457:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_695);
         this.var_2457 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2457;
      }
   }
}
