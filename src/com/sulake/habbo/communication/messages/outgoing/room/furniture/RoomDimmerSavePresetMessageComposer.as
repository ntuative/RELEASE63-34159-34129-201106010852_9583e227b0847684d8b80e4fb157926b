package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2267:int;
      
      private var var_2266:int;
      
      private var var_2494:String;
      
      private var var_2492:int;
      
      private var var_2493:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2267 = param1;
         this.var_2266 = param2;
         this.var_2494 = param3;
         this.var_2492 = param4;
         this.var_2493 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2267,this.var_2266,this.var_2494,this.var_2492,int(this.var_2493)];
      }
      
      public function dispose() : void
      {
      }
   }
}
