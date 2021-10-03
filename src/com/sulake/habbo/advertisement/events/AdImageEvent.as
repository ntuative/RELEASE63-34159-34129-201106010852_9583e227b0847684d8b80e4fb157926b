package com.sulake.habbo.advertisement.events
{
   import flash.events.Event;
   
   public class AdImageEvent extends Event
   {
      
      public static const const_179:String = "AE_ROOM_AD_LOAD_IMAGE";
       
      
      private var _imageUrl:String;
      
      private var var_1160:String;
      
      private var _roomId:int;
      
      private var var_221:int;
      
      public function AdImageEvent(param1:String, param2:String, param3:String, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this._imageUrl = param2;
         this.var_1160 = param3;
         this._roomId = param4;
         this.var_221 = param5;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1160;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get objectId() : int
      {
         return this.var_221;
      }
   }
}
