package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPlayListModificationMessage extends RoomWidgetMessage
   {
      
      public static const const_787:String = "RWPLAM_ADD_TO_PLAYLIST";
      
      public static const const_913:String = "RWPLAM_REMOVE_FROM_PLAYLIST";
       
      
      private var var_2572:int;
      
      private var var_2573:int;
      
      public function RoomWidgetPlayListModificationMessage(param1:String, param2:int = -1, param3:int = -1)
      {
         super(param1);
         this.var_2573 = param2;
         this.var_2572 = param3;
      }
      
      public function get diskId() : int
      {
         return this.var_2572;
      }
      
      public function get slotNumber() : int
      {
         return this.var_2573;
      }
   }
}
