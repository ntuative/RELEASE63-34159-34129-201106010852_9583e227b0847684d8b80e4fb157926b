package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_176:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_885:Array;
      
      private var var_2468:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_176,param4,param5);
         this._userId = param1;
         this.var_885 = param2;
         this.var_2468 = param3;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get tags() : Array
      {
         return this.var_885;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2468;
      }
   }
}
