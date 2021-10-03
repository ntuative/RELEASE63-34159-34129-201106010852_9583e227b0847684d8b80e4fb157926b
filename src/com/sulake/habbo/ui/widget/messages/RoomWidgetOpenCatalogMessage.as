package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_403:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1288:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1333:String = "RWOCM_PIXELS";
      
      public static const const_1353:String = "RWOCM_CREDITS";
       
      
      private var var_2523:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_403);
         this.var_2523 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2523;
      }
   }
}
