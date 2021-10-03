package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1854:String = "";
      
      private var var_1993:String = "";
      
      private var var_2877:String = "";
      
      private var var_2927:Number = 0;
      
      private var var_2926:Number = 0;
      
      private var var_2549:Number = 0;
      
      private var var_2547:Number = 0;
      
      private var var_2358:Boolean = false;
      
      private var var_2357:Boolean = false;
      
      private var var_2356:Boolean = false;
      
      private var var_2355:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1854 = param2;
         this.var_1993 = param3;
         this.var_2877 = param4;
         this.var_2927 = param5;
         this.var_2926 = param6;
         this.var_2549 = param7;
         this.var_2547 = param8;
         this.var_2358 = param9;
         this.var_2357 = param10;
         this.var_2356 = param11;
         this.var_2355 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1854;
      }
      
      public function get canvasId() : String
      {
         return this.var_1993;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2877;
      }
      
      public function get screenX() : Number
      {
         return this.var_2927;
      }
      
      public function get screenY() : Number
      {
         return this.var_2926;
      }
      
      public function get localX() : Number
      {
         return this.var_2549;
      }
      
      public function get localY() : Number
      {
         return this.var_2547;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2358;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2357;
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
