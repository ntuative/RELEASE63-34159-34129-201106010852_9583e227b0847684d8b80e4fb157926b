package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_947:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1337:String = "inventory_effects";
      
      public static const const_1287:String = "inventory_badges";
      
      public static const const_1747:String = "inventory_clothes";
      
      public static const const_1664:String = "inventory_furniture";
       
      
      private var var_2701:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_947);
         this.var_2701 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2701;
      }
   }
}
