package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_412:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const const_1254:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
      
      public static const const_433:String = "RWCCUE_HIDE_CLOTHING_EDITOR";
       
      
      private var var_221:int = -1;
      
      private var var_2321:int = -1;
      
      private var _roomId:int = -1;
      
      private var _roomCategory:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_221 = param2;
         this.var_2321 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
      
      public function get objectCategory() : int
      {
         return this.var_2321;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
