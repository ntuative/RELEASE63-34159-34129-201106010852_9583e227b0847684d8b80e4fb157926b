package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_853:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_174:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_221:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_221 = param1;
      }
   }
}
