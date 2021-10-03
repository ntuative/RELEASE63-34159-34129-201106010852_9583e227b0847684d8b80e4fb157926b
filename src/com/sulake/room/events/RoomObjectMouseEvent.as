package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_141:String = "ROE_MOUSE_CLICK";
      
      public static const const_185:String = "ROE_MOUSE_ENTER";
      
      public static const const_635:String = "ROE_MOUSE_MOVE";
      
      public static const const_177:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2164:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_508:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1854:String = "";
      
      private var var_2357:Boolean;
      
      private var var_2358:Boolean;
      
      private var var_2356:Boolean;
      
      private var var_2355:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1854 = param2;
         this.var_2357 = param5;
         this.var_2358 = param6;
         this.var_2356 = param7;
         this.var_2355 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1854;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2357;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2358;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2356;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2355;
      }
   }
}
